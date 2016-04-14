//
//  SignatureViewController.m
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import "SignatureViewController.h"

@interface SignatureViewController ()

@end

@implementation SignatureViewController
@synthesize signatureA, signatureB;
@synthesize nav;
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
    // Do any additional setup after loading the view from its nib.
    
    signatureA.layer.borderColor = [UIColor blackColor].CGColor;
    signatureA.layer.borderWidth = 1.0f;
    
    signatureB.layer.borderColor = [UIColor blackColor].CGColor;
    signatureB.layer.borderWidth = 1.0f;
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

-(IBAction)clearA:(id)sender
{
    [signatureA clearSignature];
}

-(IBAction)clearB:(id)sender
{
    [signatureB clearSignature];
}

-(IBAction)submitForm:(id)sender
{
    [viewOverlay setFrame:CGRectMake(-20, -116, 1024, 768)];
    [[self view] addSubview:viewOverlay];
    [progressLabel setText:@"0 %"];
    
    [self showWithProgress:nil];
}

-(void) popNavigationController
{
    [nav popViewControllerAnimated:YES];
}

-(void) progressCompleted
{
    [viewOverlay removeFromSuperview];
    [self performSelector:@selector(popNavigationController) withObject:nil afterDelay:0.2f];
}

-(IBAction)showWithProgress:(id)sender {
    progress = 0.0f;
    progressView.progress = progress;
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.02];
}

-(void)increaseProgress {
    progress+=0.015f;
    progressView.progress = progress;
    if(progress < 1.0f)
        [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.03];
    else
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:0.4f];
    int prog = progress * 100;
    [progressLabel setText:[NSString stringWithFormat:@"%d %%", prog]];
}

-(void)dismiss {
    [self progressCompleted];
}

@end
