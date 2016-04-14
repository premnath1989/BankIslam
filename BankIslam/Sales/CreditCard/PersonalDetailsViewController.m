//
//  PersonalDetailsViewController.m
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import "PersonalDetailsViewController.h"
#import "MyKadViewController.h"
#import "MyKidViewController.h"
#import <MyID/MYKID.h>
#import <MyID/MYKAD.h>

@interface PersonalDetailsViewController ()

@end

@implementation PersonalDetailsViewController
@synthesize navVC;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    CAGradientLayer *bgLayer = [GradientLayer greyGradient];
    bgLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view.layer insertSublayer:bgLayer atIndex:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    idCard = [[MyID alloc] init];
    idCard.delegate = self;
    
    [self showStatus:STATUS_NOREADER];
    // Do any additional setup after loading the view from its nib.
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:recognizer];
    
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:recognizer];
}

- (void) didSwipe:(UISwipeGestureRecognizer *)recognizer{
    if([recognizer direction] == UISwipeGestureRecognizerDirectionLeft){
        //Swipe from right to left
        //Do your functions here
        [delegate nextSegment];
    }else{
        //Swipe from left to right
        //Do your functions here
        [delegate prevSegment];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) adjustGenderToMale
{
    [(UIButton*)[[self view] viewWithTag:1] setImage:[UIImage imageNamed:@"checkBox1.png"] forState:UIControlStateNormal];
    [(UIButton*)[[self view] viewWithTag:2] setImage:[UIImage imageNamed:@"checkBox0.png"] forState:UIControlStateNormal];
}

-(void) adjustGenderToFemale
{
    [(UIButton*)[[self view] viewWithTag:1] setImage:[UIImage imageNamed:@"checkBox0.png"] forState:UIControlStateNormal];
    [(UIButton*)[[self view] viewWithTag:2] setImage:[UIImage imageNamed:@"checkBox1.png"] forState:UIControlStateNormal];
}

-(IBAction)genderSelected:(id)sender
{
    if ([sender tag] == 1)
    {
        [self adjustGenderToMale];
    }
    else
    {
        [self adjustGenderToFemale];
    }
}

-(void) fillTextFieldData:(MYKAD *) mykadData
{
    [tfName setText:mykadData.name];
    [tfIC setText:mykadData.ICNo];
    [tfICOld setText:mykadData.oldICNo];
    
    if ([mykadData.gender caseInsensitiveCompare:@"l"] == NSOrderedSame)
        [self adjustGenderToMale];
    else
        [self adjustGenderToFemale];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"] ];
    [dateFormatter setDateFormat:@"dd MMMM yyyy"];
    [tfDOB setText:[dateFormatter stringFromDate:mykadData.DOB]];//DOB
    
    [tfCitizen setText:mykadData.citizenship];
    [tfRace setText:mykadData.race];
    
    NSString *address = mykadData.address1;
    
    if ([mykadData.address2 length] > 0)
        address = [address stringByAppendingString:[NSString stringWithFormat:@", %@", mykadData.address2]];
    if ([mykadData.address3 length] > 0)
        address = [address stringByAppendingString:[NSString stringWithFormat:@", %@", mykadData.address3]];
    [tfAddress1 setText:address];
    
    [tfPostCode setText:mykadData.postcode];
    [tfState setText:mykadData.state];
}

-(uint16_t) readCard
{
    NSError *err=nil;
    Boolean isSuccess = false;
    
    isSuccess = [idCard connectWithReaderName: @"iCard Reader" error:&err];
    if(!isSuccess)
    {
        UIAlertView *alert =  [[UIAlertView alloc] initWithTitle:@"Announcement" message:@"Unable connect to reader" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        return STATUS_NOREADER;
    }
    
    NSObject *objData = [idCard readMyIDCardAndReturnError:&err];
    
    if(!objData)
    {
        UIAlertView *alert =  [[UIAlertView alloc] initWithTitle:@"Announcement" message:[NSString stringWithFormat:@"Failed reading card. \n%@", err] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        [idCard disconnectReaderAndReturnError:&err];
        
        return STATUS_NOCARD;
    }
    
    if([objData isKindOfClass:[MYKAD class]] )
    {
        MYKAD *tmp = (MYKAD*)objData;
        [self fillTextFieldData:tmp];
    }
    
    return 0;
}

-(void)showStatus: (uint16_t) status
{
    
    switch(status)
    {
        case STATUS_CARD_INSERTED:
            [timerText invalidate];
            timerText = nil;
            break;
        case STATUS_NOREADER:
            if(!timerText.isValid)
                timerText = [NSTimer scheduledTimerWithTimeInterval:0.6 target:self selector:@selector(blinkText:) userInfo:nil repeats:YES];
            break;
            
        default:
            [timerText invalidate];
            timerText = nil;
            //if(!timerText.isValid)
            //    timerText = [NSTimer scheduledTimerWithTimeInterval:0.4 target:self selector:@selector(blinkText:) userInfo:nil repeats:YES];
            break;
    }
    
}

-(void) blinkText:(NSTimer*)theTimer
{
    
}

-(void) onCardStatusChange:(uint16_t)status
{
    uint16_t ret;
    
    if(status == STATUS_CARD_INSERTED)
    {
        [self showStatus:status];
        ret = [self readCard];
        if(ret != 0)
            [self showStatus:ret];
    }
    else
    {
        [self showStatus:status];
    }
}

-(IBAction)readCard:(id)sender
{
    [self readCard];
}

@end
