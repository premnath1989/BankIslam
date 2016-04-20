//
//  FinancialDetailsViewController.m
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import "FinancialDetailsViewController.h"

@interface FinancialDetailsViewController ()

@end

@implementation FinancialDetailsViewController
@synthesize delegate;
@synthesize BasicSavingValue,Age;

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

- (IBAction)GenerateSumFunc:(id)sender
{
    
    if([Age.text isEqualToString:@"18"])
    {
        BasicSavingValue.text =@"1,000.00";
    }
    else if([Age.text isEqualToString:@"19"])

    {
        BasicSavingValue.text =@"2,000.00";
    }
    else if([Age.text isEqualToString:@"20"])

    {
        BasicSavingValue.text =@"4,000.00";
    }
    else if([Age.text isEqualToString:@"21"])

    {
        BasicSavingValue.text =@"5,000.00";
        
    }
    else if([Age.text isEqualToString:@"22"])

    {
        BasicSavingValue.text =@"7,000.00";
    }
    else if([Age.text isEqualToString:@"23"])
    {
        BasicSavingValue.text =@"9,000.00";
    }
    else if([Age.text isEqualToString:@"24"])

    {
        BasicSavingValue.text =@"11,000.00";
    }
    else if([Age.text isEqualToString:@"25"])

    {
        BasicSavingValue.text =@"13,000.00";
        
    }
    else if([Age.text isEqualToString:@"26"])

    {
        BasicSavingValue.text =@"15,000.00";
    }
    else if([Age.text isEqualToString:@"27"])

    {
        BasicSavingValue.text =@"18,000.00";
    }
    else if([Age.text isEqualToString:@"28"])

    {
        BasicSavingValue.text =@"21,000.00";
    }
    else if([Age.text isEqualToString:@"29"])

    {
        BasicSavingValue.text =@"24,000.00";
    }
    else if([Age.text isEqualToString:@"30"])

    {
        BasicSavingValue.text =@"27,000.00";
    }
    else if([Age.text isEqualToString:@"31"])

    {
        BasicSavingValue.text =@"30,000.00";
    }
    else if([Age.text isEqualToString:@"32"])
    {
        BasicSavingValue.text =@"34,000.00";
    }
    else if([Age.text isEqualToString:@"33"])
    {
        BasicSavingValue.text =@"37,000.00";
    }
    else if([Age.text isEqualToString:@"34"])
    {
        BasicSavingValue.text =@"41,000.00";
    }
    else if([Age.text isEqualToString:@"35"])
    {
        BasicSavingValue.text =@"46,000.00";
    }
    else if([Age.text isEqualToString:@"36"])

    {
        BasicSavingValue.text =@"50,000.00";
    }
    else if([Age.text isEqualToString:@"37"])

    {
        BasicSavingValue.text =@"54,000.00";
    }
    else if([Age.text isEqualToString:@"38"])

    {
        BasicSavingValue.text =@"59,000.00";
    }
    else if([Age.text isEqualToString:@"39"])

    {
        BasicSavingValue.text =@"64,000.00";
    }
    else if([Age.text isEqualToString:@"40"])

    {
        BasicSavingValue.text =@"69,000.00";
    }
    else if([Age.text isEqualToString:@"41"])

    {
        BasicSavingValue.text =@"76,000.00";
    }
    else if([Age.text isEqualToString:@"42"])

    {
        BasicSavingValue.text =@"81,000.00";
    }
    else if([Age.text isEqualToString:@"43"])
    {
        BasicSavingValue.text =@"88,000.00";
    }
    else if([Age.text isEqualToString:@"44"])
    {
        BasicSavingValue.text =@"95,000.00";
    }
    else if([Age.text isEqualToString:@"45"])
    {
        BasicSavingValue.text =@"102,000.00";
    }
    else if([Age.text isEqualToString:@"46"])
    {
        BasicSavingValue.text =@"109,000.00";
    }
    else if([Age.text isEqualToString:@"47"])
    {
       BasicSavingValue.text =@"117,000.00";
    }
    else if([Age.text isEqualToString:@"48"])
    {
       BasicSavingValue.text =@"125,000.00";
    }
    else if([Age.text isEqualToString:@"49"])
    {
        BasicSavingValue.text =@"134,000.00";
    }
    else if([Age.text isEqualToString:@"50"])
    {
        BasicSavingValue.text =@"143,000.00";
    }
    else if([Age.text isEqualToString:@"51"])
    {
        BasicSavingValue.text =@"153,000.00";
    }
    else if([Age.text isEqualToString:@"52"])
    {
        BasicSavingValue.text =@"163,000.00";
    }
    else if([Age.text isEqualToString:@"53"])
    {
        BasicSavingValue.text =@"174,000.00";
    }
    else if([Age.text isEqualToString:@"54"])
    {
        BasicSavingValue.text =@"185,000.00";
    }
    else if([Age.text isEqualToString:@"55"])
    {
        BasicSavingValue.text =@"196,000.00";
    }
    

}
@end
