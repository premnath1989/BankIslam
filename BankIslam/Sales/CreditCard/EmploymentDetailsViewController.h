//
//  EmploymentDetailsViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientLayer.h"

@protocol EmploymentDetailsDelegate;


@interface EmploymentDetailsViewController : UIViewController
{

}

@property (nonatomic, weak) id<EmploymentDetailsDelegate> delegate;

@end


@protocol EmploymentDetailsDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end
