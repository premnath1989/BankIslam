//
//  CardChoiceViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientLayer.h"

@protocol CardChoiceDelegate;

@interface CardChoiceViewController : UIViewController
{
    
}

-(IBAction)btnClicked:(id)sender;

@property (nonatomic, weak) id<CardChoiceDelegate> delegate;

@end


@protocol CardChoiceDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end
