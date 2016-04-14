//
//  DeclarationViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GradientLayer.h"

@protocol DeclarationDelegate;

@interface DeclarationViewController : UIViewController

@property (nonatomic, weak) id<DeclarationDelegate> delegate;


-(IBAction)btnClicked:(id)sender;

@end


@protocol DeclarationDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end
