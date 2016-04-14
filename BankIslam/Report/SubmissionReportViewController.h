//
//  SubmissionReportViewController.h
//  BankIslam
//
//  Created by Danny Raharja on 17/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface SubmissionReportViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *tvReport;
    IBOutlet UIView *viewContainer;
}

@end
