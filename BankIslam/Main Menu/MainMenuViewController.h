//
//  MainMenuViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 13/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreditCardViewController.h"
#import "SubmissionReportViewController.h"
#import "GradientLayer.h"

@interface MainMenuViewController : UIViewController
{
    IBOutlet UIView *salesView;
    IBOutlet UIView *reportView;
    IBOutlet UIView *containerView;
}

-(IBAction)btnSales:(id)sender;
-(IBAction)btnReport:(id)sender;
-(IBAction)btnBrochure:(id)sender;
-(IBAction)btnSettings:(id)sender;
-(IBAction)btnHelp:(id)sender;
-(IBAction)btnEvents:(id)sender;
-(IBAction)btnCalendar:(id)sender;


-(IBAction)btnCreditCard:(id)sender;
-(IBAction)btnSubmissionReport:(id)sender;

@end
