//
//  SupplementaryCardViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientLayer.h"

@protocol SupplementaryCardDelegate;

@interface SupplementaryCardViewController : UIViewController

@property (nonatomic, weak) id<SupplementaryCardDelegate> delegate;

@end


@protocol SupplementaryCardDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end
