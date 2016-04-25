//
//  SpouseDetailsViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientLayer.h"
#import "DateViewController.h"

@protocol SpouseDetailsDelegate;

@interface SpouseDetailsViewController : UIViewController<DateViewControllerDelegate>{
  UIPopoverController *_datePopover;
    DateViewController *_LADate;
}
@property (nonatomic, retain) DateViewController *LADate;
@property (nonatomic, retain) UIPopoverController *datePopover;
@property (nonatomic, retain) UIPopoverController *dobPopover;


@property (nonatomic, weak) id<SpouseDetailsDelegate> delegate;
- (IBAction)btnStartDatePressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *StartDate;

- (IBAction)btnEndDatePressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *EndDate;

@end


@protocol SpouseDetailsDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end
