//
//  SpouseDetailsViewController.m
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import "SpouseDetailsViewController.h"

@interface SpouseDetailsViewController ()

@end

@implementation SpouseDetailsViewController
@synthesize delegate;
@synthesize dobPopover = _dobPopover;
@synthesize LADate = _LADate;

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

-(void)datePick:(DateViewController *)inController strDate:(NSString *)aDate strAge:(NSString *)aAge intAge:(int)bAge intANB:(int)aANB
{
    NSLog(@"date %@ age %@ bAge %i anb %i",aDate,aAge,bAge,aANB);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *selectDate = aDate;
    
    [self.StartDate setTitle:aDate forState:UIControlStateNormal];
    NSDate *startDate = [dateFormatter dateFromString:selectDate];
    
    
    
    NSString *todayDate = [dateFormatter stringFromDate:[NSDate date]];
    NSDate *endDate = [dateFormatter dateFromString:todayDate];
    
    [self.datePopover dismissPopoverAnimated:YES];
    
//    unsigned flags = NSDayCalendarUnit;
//    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:endDate options:0];
//    int diffDays = [difference day];
//    if (diffDays >180)
//    {
//        AgeExceed189Days = true;
//    }
//    else
//    {
//        AgeExceed189Days = false;
//    }
    
    
//    if (date1)
//    {
//        if (aDate == NULL) {
//            [btnDOB setTitle:dobtemp forState:UIControlStateNormal];
//            DOB = dobtemp;
//            [self calculateAge];
//            LAAgeField.text = [[NSString alloc] initWithFormat:@"%d",age];
//            
//        } else {
//            [btnDOB setTitle:aDate forState:UIControlStateNormal];
//            DOB = aDate;
//            [self calculateAge];
//            LAAgeField.text = [[NSString alloc] initWithFormat:@"%d",bAge];
//        }
//        
//        self.btnDOB.titleLabel.textColor = [UIColor blackColor];
//        [self.dobPopover dismissPopoverAnimated:YES];
//        date1 = NO;
//    } else if (date2)
//    {
//        if (aDate == NULL) {
//            [TanggalIllustrasi setTitle:aDate forState:UIControlStateNormal];
//            DOB = dobtemp;
//            //  [self calculateAge];
//            //  LAAgeField.text = [[NSString alloc] initWithFormat:@"%d",age];
//            
//        } else {
//            [TanggalIllustrasi setTitle:aDate forState:UIControlStateNormal];
//            DOB = aDate;
//            // [self calculateAge];
//            // LAAgeField.text = [[NSString alloc] initWithFormat:@"%d",bAge];
//        }
//        
//        self.btnDOB.titleLabel.textColor = [UIColor blackColor];
//        [self.dobPopover dismissPopoverAnimated:YES];
//        date1 = NO;
//    }
    
    // if (DAteTanggal)
    //    {
    //        [self.TanggalIllustrasi setTitle:aDate forState:UIControlStateNormal];
    //
    //
    //        [self.datePopover dismissPopoverAnimated:YES];
    //
    
    //    }
    
//    [_delegate LAIDPayor:lastIdPayor andIDProfile:lastIdProfile andAge:age andOccpCode:occuCode andOccpClass:occuClass andSex:sex andIndexNo:IndexNo
//             andCommDate:commDate andSmoker:smoker DiffClient:DiffClient bEDDCase:EDDCase];
}

- (IBAction)btnStartDatePressed:(UIButton *)sender {
    
    BOOL date1 = NO;
    BOOL date2 = YES;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:9001 forKey:@"Illustrasi"];
    [defaults synchronize];
    
    UIStoryboard *sharedStoryboard = [UIStoryboard storyboardWithName:@"SharedStoryboard" bundle:Nil];
    self.LADate = [sharedStoryboard instantiateViewControllerWithIdentifier:@"showDate"];
    _LADate.delegate = self;
    _LADate.msgDate = sender.titleLabel.text;
    _LADate.btnSender = 1;
    self.dobPopover = [[UIPopoverController alloc] initWithContentViewController:_LADate];
    
    
    [self.dobPopover setPopoverContentSize:CGSizeMake(100.0f, 100.0f)];
    
    //    CGRect rect = [sender frame];
    //    rect.origin.y = [sender frame].origin.y;
    
    [self.dobPopover presentPopoverFromRect:[sender frame]  inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
//appDelegate.isNeedPromptSaveMsg = YES;
    
}


@end
