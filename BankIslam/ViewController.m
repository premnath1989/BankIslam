//
//  ViewController.m
//  BankIslam
//
//  Created by Danny Raharja on 13/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) viewWillAppear:(BOOL)animated
{
    CAGradientLayer *bgLayer = [GradientLayer greyGradient];
    bgLayer.frame = CGRectMake(0, 0, self.view.bounds.size.height, self.view.bounds.size.width);
    
    [self.view.layer insertSublayer:bgLayer atIndex:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    loginView.layer.cornerRadius = 15;
    loginView.layer.masksToBounds = YES;
	// Do any additional setup after loading the view, typically from a nib.
    
    // Call animation to make the UX beautiful
    // call show logo
    [UIView animateWithDuration:1.4 delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         imgLogo.alpha = 1.0;
                     }
                     completion:^(BOOL finished){
                         // code to run when animation completes
                         // (in this case, show login)
                         [self showLogo];
                     }];
}

-(void) showLogo
{
    [UIView animateWithDuration:2.0 delay:0.5 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         imgLogo.alpha = 1.0;
                     }
                     completion:^(BOOL finished){
                         // code to run when animation completes
                         // (in this case, show login)
                         [self showLogin];
                     }];
}

-(void) showLogin
{
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         loginView.frame = CGRectMake(256, 250, loginView.frame.size.width, loginView.frame.size.height);
                     }
                     completion:^(BOOL finished){
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)doLogin:(id)sender
{
    UINavigationController *svc =[self.storyboard instantiateViewControllerWithIdentifier:@"mainMenu"];
    [svc setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [self presentViewController:svc animated:YES completion:nil];
}

@end
