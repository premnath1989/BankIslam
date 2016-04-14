//
//  MainMenuViewController.m
//  BankIslam
//
//  Created by Danny Raharja on 13/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

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
//    CAGradientLayer *bgLayer = [GradientLayer redGradient];
//    bgLayer.frame = self.view.frame;
//    
//    [containerView.layer insertSublayer:bgLayer atIndex:0];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [[[self navigationController] topViewController] setTitle:@"Main Menu"];
    
    salesView.layer.cornerRadius = 15;
    salesView.layer.masksToBounds = YES;
    
    reportView.layer.cornerRadius = 15;
    reportView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Button action for menu
-(void)hideAllSubmenus
{
    [salesView setHidden:YES];
    [salesView setAlpha:0.0];
    [reportView setHidden:YES];
    [reportView setAlpha:0.0];
}

-(IBAction)btnSales:(id)sender
{
    if ([salesView isHidden]) // if sales sub menu is hidden, lets show it
    {
        [self hideAllSubmenus];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [salesView setHidden:NO];
        [salesView setAlpha:1.0];
        [UIView commitAnimations];
    }
    else // If sales view is visible, lets hide it
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [salesView setHidden:YES];
        [salesView setAlpha:0.0];
        [UIView commitAnimations];
    }
}

-(IBAction)btnReport:(id)sender
{
    if ([reportView isHidden]) // if report sub menu is hidded, lets show it
    {
        [self hideAllSubmenus];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [reportView setHidden:NO];
        [reportView setAlpha:1.0];
        [UIView commitAnimations];
    }
    else // If report view is visible, lets hide it
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        [reportView setHidden:YES];
        [reportView setAlpha:0.0];
        [UIView commitAnimations];
    }
}

-(IBAction)btnBrochure:(id)sender
{
    [self hideAllSubmenus];
}

-(IBAction)btnSettings:(id)sender
{
    [self hideAllSubmenus];
}

-(IBAction)btnHelp:(id)sender
{
    [self hideAllSubmenus];
}

-(IBAction)btnEvents:(id)sender
{
    [self hideAllSubmenus];
}

-(IBAction)btnCalendar:(id)sender
{
    [self hideAllSubmenus];
}

#pragma mark - Button action for Sales menu
-(IBAction)btnCreditCard:(id)sender
{
    [self hideAllSubmenus];
    CreditCardViewController *svc =[self.storyboard instantiateViewControllerWithIdentifier:@"creditCard"];
    svc.nav = [self navigationController];
    [[self navigationController] pushViewController:svc animated:YES];
    [[[self navigationController] topViewController] setTitle:@"Credit Card"];
}

#pragma mark - Button action for report menu
-(IBAction)btnSubmissionReport:(id)sender
{
    [self hideAllSubmenus];
    SubmissionReportViewController *svc;
    NSString *version = [[UIDevice currentDevice] systemVersion];
    int ver = [version intValue];
    if (ver < 7)
    {
        svc = [[SubmissionReportViewController alloc] initWithNibName:@"SubmissionReportVC" bundle:nil];
    }
    else
    {
        svc = [[SubmissionReportViewController alloc] initWithNibName:@"SubmissionReportViewController" bundle:nil];
    }
    [[self navigationController] pushViewController:svc animated:YES];
}

@end
