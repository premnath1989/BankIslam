//
//  CreditCardViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 13/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardChoiceViewController.h"
#import "PersonalDetailsViewController.h"
#import "EmploymentDetailsViewController.h"
#import "FinancialDetailsViewController.h"
#import "EmergencyContactViewController.h"
#import "SpouseDetailsViewController.h"
#import "SupplementaryCardViewController.h"
#import "DeclarationViewController.h"
#import "SupportingDocumentViewController.h"
#import "SignatureViewController.h"

@interface CreditCardViewController : UIViewController <CardChoiceDelegate, PersonalDetailsDelegate, EmploymentDetailsDelegate, FinancialDetailsDelegate, EmergencyContactDelegate, SpouseDetailsDelegate, SupplementaryCardDelegate, DeclarationDelegate, SupportingDocumentDelegate, SignatureDelegate>
{
    IBOutlet UISegmentedControl *segmentedControl;
    IBOutlet UIView *bgView;
    IBOutlet UIView *containerView;
    int pos;
    BOOL isNext;
}
@property (nonatomic, strong) UINavigationController *nav;

@property (nonatomic, strong) CardChoiceViewController *ccVC;
@property (nonatomic, strong) PersonalDetailsViewController *pdVC;
@property (nonatomic, strong) EmploymentDetailsViewController *edVC;
@property (nonatomic, strong) FinancialDetailsViewController *fdVC;
@property (nonatomic, strong) EmergencyContactViewController *ecVC;
@property (nonatomic, strong) SpouseDetailsViewController *sdVC;
@property (nonatomic, strong) SupplementaryCardViewController *scVC;
@property (nonatomic, strong) DeclarationViewController *dVC;
@property (nonatomic, strong) SupportingDocumentViewController *sdocVC;
@property (nonatomic, strong) SignatureViewController *sVC;

-(IBAction)segmentedControlChanged:(id)sender;

@end

