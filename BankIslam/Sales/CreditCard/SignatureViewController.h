//
//  SignatureViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SmoothedBIView.h"
#import <QuartzCore/QuartzCore.h>
#import "GradientLayer.h"

@protocol SignatureDelegate;

@interface SignatureViewController : UIViewController
{
    IBOutlet SmoothedBIView *signatureA;
    IBOutlet SmoothedBIView *signatureB;
    
    float progress;
    
    IBOutlet UIView *viewOverlay;
    IBOutlet UIProgressView *progressView;
    IBOutlet UILabel *progressLabel;
}

@property (nonatomic, strong) UINavigationController *nav;

@property (nonatomic, strong) IBOutlet SmoothedBIView *signatureA;
@property (nonatomic, strong) IBOutlet SmoothedBIView *signatureB;

-(IBAction)clearA:(id)sender;
-(IBAction)clearB:(id)sender;

-(IBAction)submitForm:(id)sender;

@property (nonatomic, weak) id<SignatureDelegate> delegate;

@end


@protocol SignatureDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end
