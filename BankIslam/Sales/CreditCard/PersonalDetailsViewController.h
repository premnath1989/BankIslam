//
//  PersonalDetailsViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MyID/MyID.h>
#import <MyID/MyIDDelegate.h>
#import "GradientLayer.h"

@protocol PersonalDetailsDelegate;

@interface PersonalDetailsViewController : UIViewController <MyIDDelegate>
{
    MyID *idCard;
    
    IBOutlet UITextField *tfName;
    
    IBOutlet UITextField *tfIC;
    IBOutlet UITextField *tfICOld;
    
    IBOutlet UITextField *tfDOB;
    IBOutlet UITextField *tfPOB;
    
    IBOutlet UITextField *tfGender;
    IBOutlet UITextField *tfCitizen;
    IBOutlet UITextField *tfIssueDate;
    IBOutlet UITextField *tfRace;
    IBOutlet UITextField *tfReligion;
    
    IBOutlet UITextField *tfAddress1;
    IBOutlet UITextField *tfAddress2;
    IBOutlet UITextField *tfAddress3;
    IBOutlet UITextField *tfPostCode;
    IBOutlet UITextField *tfCity;
    IBOutlet UITextField *tfState;
    
    NSTimer *timerText;
}

@property (nonatomic, strong) UINavigationController *navVC;

-(uint16_t) readCard;

-(IBAction)readCard:(id)sender;
-(IBAction)genderSelected:(id)sender;

@property (nonatomic, weak) id<PersonalDetailsDelegate> delegate;

@end


@protocol PersonalDetailsDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end
