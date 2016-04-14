//
//  EmergencyContactViewController.m
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import "EmergencyContactViewController.h"

@interface EmergencyContactViewController ()

@end

@implementation EmergencyContactViewController
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

@end
