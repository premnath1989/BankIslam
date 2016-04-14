//
//  SpouseDetailsViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientLayer.h"

@protocol SpouseDetailsDelegate;

@interface SpouseDetailsViewController : UIViewController

@property (nonatomic, weak) id<SpouseDetailsDelegate> delegate;

@end


@protocol SpouseDetailsDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end
