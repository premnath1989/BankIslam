//
//  ViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 13/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainMenuViewController.h"
#import "GradientLayer.h"

@interface ViewController : UIViewController
{
    IBOutlet UIView *loginView;
    IBOutlet UIImageView *imgLogo;
}

-(IBAction)doLogin:(id)sender;

@end
