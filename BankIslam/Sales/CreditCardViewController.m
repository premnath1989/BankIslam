//
//  CreditCardViewController.m
//  BankIslam
//
//  Created by Danny Raharja on 13/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import "CreditCardViewController.h"

@interface CreditCardViewController ()

@end

@implementation CreditCardViewController
@synthesize ccVC, pdVC, ecVC, fdVC, edVC, sdVC, scVC, sdocVC, sVC, dVC;
@synthesize nav;

-(void) dealloc
{
    ccVC = nil;
    pdVC = nil;
    edVC = nil;
    fdVC = nil;
    ecVC = nil;
    sdVC = nil;
    scVC = nil;
    dVC = nil;
    sdocVC = nil;
    sVC = nil;
    nav = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) adjustSegmentedControlFont
{
    UIFont *font = [UIFont systemFontOfSize:10.0];
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    [segmentedControl setTitleTextAttributes:attributes forState:UIControlStateNormal];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Adjust Segmented Control font size because the wording is too long
    [self adjustSegmentedControlFont];
    
    // Set default selected segment
    [segmentedControl setSelectedSegmentIndex:0];
    for (int i=0; i<[segmentedControl.subviews count]; i++)
    {
        [[segmentedControl.subviews objectAtIndex:i] setBackgroundColor:[UIColor lightGrayColor]];
        if (i == 9)
        {
            UIColor *tintcolor=[UIColor colorWithRed:186.0/255.0 green:0.0/255.0 blue:32.0/255.0 alpha:1.0];
            [[segmentedControl.subviews objectAtIndex:i] setTintColor:tintcolor];
        }
        else
        {
            [[segmentedControl.subviews objectAtIndex:i] setTintColor:[UIColor whiteColor]];
        }
    }
    
    // Allocate all view for selected segment
    NSString *version = [[UIDevice currentDevice] systemVersion];
    int ver = [version intValue];
    if (ver < 7)
    {
        ccVC = [[CardChoiceViewController alloc] initWithNibName:@"CardChoiceVC" bundle:nil];
        pdVC = [[PersonalDetailsViewController alloc] initWithNibName:@"PersonalDetailsVC" bundle:nil];
        edVC = [[EmploymentDetailsViewController alloc] initWithNibName:@"EmploymentDetailsVC" bundle:nil];
        fdVC = [[FinancialDetailsViewController alloc] initWithNibName:@"FinancialDetailsVC" bundle:nil];
        ecVC = [[EmergencyContactViewController alloc] initWithNibName:@"EmergencyContactVC" bundle:nil];
        sdVC = [[SpouseDetailsViewController alloc] initWithNibName:@"SpouseDetailsVC" bundle:nil];
        scVC = [[SupplementaryCardViewController alloc] initWithNibName:@"SupplementaryCardVC" bundle:nil];
        dVC = [[DeclarationViewController alloc] initWithNibName:@"DeclarationVC" bundle:nil];
        sdocVC = [[SupportingDocumentViewController alloc] initWithNibName:@"SupportingDocumentVC" bundle:nil];
        sVC = [[SignatureViewController alloc] initWithNibName:@"SignatureVC" bundle:nil];
    }
    else
    {
    ccVC = [[CardChoiceViewController alloc] init];
    pdVC = [[PersonalDetailsViewController alloc] init];
    edVC = [[EmploymentDetailsViewController alloc] init];
    fdVC = [[FinancialDetailsViewController alloc] init];
    ecVC = [[EmergencyContactViewController alloc] init];
    sdVC = [[SpouseDetailsViewController alloc] init];
    scVC = [[SupplementaryCardViewController alloc] init];
    dVC = [[DeclarationViewController alloc] init];
    sdocVC = [[SupportingDocumentViewController alloc] init];
    sVC = [[SignatureViewController alloc] init];
    }
    
    ccVC.delegate = self;
    pdVC.delegate = self;
    edVC.delegate = self;
    fdVC.delegate = self;
    ecVC.delegate = self;
    sdVC.delegate = self;
    scVC.delegate = self;
    dVC.delegate = self;
    sdocVC.delegate = self;
    sVC.delegate = self;
    
    pdVC.navVC = nav;
    sVC.nav = nav;

    // Add the first view as default
    [bgView addSubview:[ccVC view]];
    
    pos = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) showViewAtIndex:(long) index
{
    int changer;
    
    if (index > pos)
    {
        isNext = YES;
        pos = index;
        changer = 1;
    }
    else
    {
        isNext = NO;
        pos = index;
        changer = -1;
    }
    
    if (index == 0) //Show choice of card
    {
        ccVC.view.frame = CGRectMake(1024 * changer, 0, ccVC.view.frame.size.width, ccVC.view.frame.size.height);
        [bgView addSubview:[ccVC view]];
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             ccVC.view.frame = CGRectMake(0, 0, ccVC.view.frame.size.width, ccVC.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
    }
    else if (index == 1) //Show personal details
    {
        pdVC.view.frame = CGRectMake(1024 * changer, 0, pdVC.view.frame.size.width, pdVC.view.frame.size.height);
        [bgView addSubview:[pdVC view]];
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             pdVC.view.frame = CGRectMake(0, 0, pdVC.view.frame.size.width, pdVC.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
    }
    else if (index == 2) //Show personal details
    {
        edVC.view.frame = CGRectMake(1024 * changer, 0, edVC.view.frame.size.width, edVC.view.frame.size.height);
        [bgView addSubview:[edVC view]];
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             edVC.view.frame = CGRectMake(0, 0, edVC.view.frame.size.width, edVC.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
    }
    else if (index == 3) //Show personal details
    {
        fdVC.view.frame = CGRectMake(1024 * changer, 0, fdVC.view.frame.size.width, fdVC.view.frame.size.height);
        [bgView addSubview:[fdVC view]];
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             fdVC.view.frame = CGRectMake(0, 0, fdVC.view.frame.size.width, fdVC.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
    }
    else if (index == 4) //Show personal details
    {
        ecVC.view.frame = CGRectMake(1024 * changer, 0, ecVC.view.frame.size.width, ecVC.view.frame.size.height);
        [bgView addSubview:[ecVC view]];
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             ecVC.view.frame = CGRectMake(0, 0, ecVC.view.frame.size.width, ecVC.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
    }
    else if (index == 5) //Show personal details
    {
        sdVC.view.frame = CGRectMake(1024 * changer, 0, sdVC.view.frame.size.width, sdVC.view.frame.size.height);
        [bgView addSubview:[sdVC view]];
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             sdVC.view.frame = CGRectMake(0, 0, sdVC.view.frame.size.width, sdVC.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
    }
    else if (index == 6) //Show personal details
    {
        scVC.view.frame = CGRectMake(1024 * changer, 0, scVC.view.frame.size.width, scVC.view.frame.size.height);
        [bgView addSubview:[scVC view]];
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             scVC.view.frame = CGRectMake(0, 0, scVC.view.frame.size.width, scVC.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
    }
    else if (index == 7) //Show personal details
    {
        dVC.view.frame = CGRectMake(1024 * changer, 0, dVC.view.frame.size.width, dVC.view.frame.size.height);
        [bgView addSubview:[dVC view]];
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             dVC.view.frame = CGRectMake(0, 0, dVC.view.frame.size.width, dVC.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
    }
    else if (index == 8) //Show personal details
    {
        sdocVC.view.frame = CGRectMake(1024 * changer, 0, sdocVC.view.frame.size.width, sdocVC.view.frame.size.height);
        [bgView addSubview:[sdocVC view]];
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             sdocVC.view.frame = CGRectMake(0, 0, sdocVC.view.frame.size.width, sdocVC.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
    }
    else if (index == 9) //Show personal details
    {
        sVC.view.frame = CGRectMake(1024 * changer, 0, sVC.view.frame.size.width, sVC.view.frame.size.height);
        [bgView addSubview:[sVC view]];
        
        [UIView animateWithDuration:0.7 delay:0.0 options:UIViewAnimationOptionTransitionNone
                         animations:^{
                             sVC.view.frame = CGRectMake(0, 0, sVC.view.frame.size.width, sVC.view.frame.size.height);
                         }
                         completion:^(BOOL finished){
                         }];
    }
}

-(void) segmentedControlChanged:(id)sender
{
    for (int i=0; i<[segmentedControl.subviews count]; i++)
    {
        [[segmentedControl.subviews objectAtIndex:i] setBackgroundColor:[UIColor lightGrayColor]];
        if ([[segmentedControl.subviews objectAtIndex:i]isSelected] )
        {
            UIColor *tintcolor=[UIColor colorWithRed:186.0/255.0 green:0.0/255.0 blue:32.0/255.0 alpha:1.0];
            [[segmentedControl.subviews objectAtIndex:i] setTintColor:tintcolor];
        }
        else
        {
            NSString *version = [[UIDevice currentDevice] systemVersion];
            int ver = [version intValue];
            if (ver < 7)
            {
                [[segmentedControl.subviews objectAtIndex:i] setTintColor:[UIColor lightGrayColor]];
            }
            else
            {
                [[segmentedControl.subviews objectAtIndex:i] setTintColor:[UIColor whiteColor]];
            }
        }
    }
    
    int changer;
    
    if ([segmentedControl selectedSegmentIndex] > pos)
    {
        changer = -1;
    }
    else
    {
        changer = 1;
    }
    
    // remove any view to be replaced with other view
    if ([[bgView subviews] count] > 0)
    {
        for (UIView *view in [bgView subviews])
        {
            [UIView animateWithDuration:0.7 delay:0.1 options:UIViewAnimationOptionTransitionNone
                             animations:^{
                                 view.frame = CGRectMake(1024 * changer, 0, view.frame.size.width, view.frame.size.height);
                                 [self showViewAtIndex:segmentedControl.selectedSegmentIndex];
                             }
                             completion:^(BOOL finished){
                                 // code to run when animation completes
                                 // (in this case, show related view)
                                 [view removeFromSuperview];
                                 
                             }];
        }
    }
    else
    {
        [self showViewAtIndex:segmentedControl.selectedSegmentIndex];
    }
}


-(void) nextSegment
{
    if ([segmentedControl selectedSegmentIndex] + 1 < [segmentedControl numberOfSegments])
    {
        [segmentedControl setSelectedSegmentIndex:[segmentedControl selectedSegmentIndex] + 1];
        [self segmentedControlChanged:segmentedControl];
    }
}

-(void) prevSegment
{
    if ([segmentedControl selectedSegmentIndex] - 1 >= 0)
    {
        [segmentedControl setSelectedSegmentIndex:[segmentedControl selectedSegmentIndex] - 1];
        [self segmentedControlChanged:segmentedControl];
    }
}

@end
