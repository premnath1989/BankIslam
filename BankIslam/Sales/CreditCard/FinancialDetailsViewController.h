//
//  FinancialDetailsViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientLayer.h"

@protocol FinancialDetailsDelegate;

@interface FinancialDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *BasicSavingValue;
@property (weak, nonatomic) IBOutlet UITextField *Age;
@property (weak, nonatomic) IBOutlet UIButton *GenerateSum;
- (IBAction)GenerateSumFunc:(id)sender;

@property (nonatomic, weak) id<FinancialDetailsDelegate> delegate;

@end


@protocol FinancialDetailsDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end
