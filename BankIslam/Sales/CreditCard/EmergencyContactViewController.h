//
//  EmergencyContactViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientLayer.h"

@protocol EmergencyContactDelegate;

@interface EmergencyContactViewController : UIViewController

@property (nonatomic, weak) id<EmergencyContactDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *TotalBasicSalarytxt;
@property (weak, nonatomic) IBOutlet UITextField *TotalFixAllwnceTxt;

@property (weak, nonatomic) IBOutlet UITextField *TotalIncTxt;

@property (weak, nonatomic) IBOutlet UITextField *TotalNetIncomeStatutoryTxt;

@property (weak, nonatomic) IBOutlet UITextField *TotalNetIncome;


@end


@protocol EmergencyContactDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end