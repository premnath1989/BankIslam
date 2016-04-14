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

@end


@protocol EmergencyContactDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end