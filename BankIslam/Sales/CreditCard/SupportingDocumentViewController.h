//
//  SupportingDocumentViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GradientLayer.h"

@protocol SupportingDocumentDelegate;

@interface SupportingDocumentViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    long posTag;
    IBOutlet UIImageView *imgA;
    IBOutlet UIImageView *imgB;
    IBOutlet UIImageView *imgC;
    IBOutlet UIImageView *imgD;
    IBOutlet UIImageView *imgE;
    IBOutlet UIImageView *imgF;
}

-(IBAction)takePicture:(id)sender;

@property (nonatomic, weak) id<SupportingDocumentDelegate> delegate;

@end


@protocol SupportingDocumentDelegate <NSObject>

- (void)nextSegment;
- (void)prevSegment;

@end
