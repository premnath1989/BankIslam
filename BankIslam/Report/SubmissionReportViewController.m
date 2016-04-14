//
//  SubmissionReportViewController.m
//  BankIslam
//
//  Created by Danny Raharja on 17/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import "SubmissionReportViewController.h"

@interface SubmissionReportViewController ()

@end

@implementation SubmissionReportViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    tvReport.layer.borderColor = [UIColor blackColor].CGColor;
    tvReport.layer.borderWidth = 1.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* customView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 984.0, 44.0)];
    customView.backgroundColor = [UIColor grayColor];
    
    UILabel *lblAppID = [[UILabel alloc] initWithFrame:CGRectMake(20, 4, 150, 12)];
    [lblAppID setFont:[UIFont systemFontOfSize:10]];
    [lblAppID setTextColor:[UIColor whiteColor]];
    [lblAppID setBackgroundColor:[UIColor clearColor]];
    [lblAppID setText:@"Application ID"];
    
    UILabel *lblAppType = [[UILabel alloc] initWithFrame:CGRectMake(220, 4, 200, 12)];
    [lblAppType setFont:[UIFont systemFontOfSize:10]];
    [lblAppType setTextColor:[UIColor whiteColor]];
    [lblAppType setBackgroundColor:[UIColor clearColor]];
    [lblAppType setText:@"Application Type"];
    
    UILabel *lblDateSubmission = [[UILabel alloc] initWithFrame:CGRectMake(470, 4, 130, 12)];
    [lblDateSubmission setFont:[UIFont systemFontOfSize:10]];
    [lblDateSubmission setTextColor:[UIColor whiteColor]];
    [lblDateSubmission setBackgroundColor:[UIColor clearColor]];
    [lblDateSubmission setText:@"Date Submission"];
    
    UILabel *lblStatus = [[UILabel alloc] initWithFrame:CGRectMake(650, 4, 150, 12)];
    [lblStatus setFont:[UIFont systemFontOfSize:10]];
    [lblStatus setTextColor:[UIColor whiteColor]];
    [lblStatus setBackgroundColor:[UIColor clearColor]];
    [lblStatus setText:@"Status"];
    
    
    [customView addSubview:lblAppID];
    [customView addSubview:lblAppType];
    [customView addSubview:lblDateSubmission];
    [customView addSubview:lblStatus];
    
    return customView;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SettingsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell.textLabel removeFromSuperview];
        
        UIView *bgCell = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 984, 20)];
        [bgCell setTag:1122];
        
        UILabel *lblName = [[UILabel alloc] initWithFrame:CGRectMake(20, 4, 150, 12)];
        [lblName setTag:1];
        [lblName setFont:[UIFont systemFontOfSize:10]];
        [lblName setTextColor:[UIColor colorWithRed:186.0/255.0 green:0.0/255.0 blue:32.0/255.0 alpha:1.0]];
        [lblName setBackgroundColor:[UIColor clearColor]];
        
        UILabel *lblAddress = [[UILabel alloc] initWithFrame:CGRectMake(220, 4, 200, 12)];
        [lblAddress setTag:2];
        [lblAddress setFont:[UIFont systemFontOfSize:10]];
        [lblAddress setTextColor:[UIColor colorWithRed:186.0/255.0 green:0.0/255.0 blue:32.0/255.0 alpha:1.0]];
        [lblAddress setBackgroundColor:[UIColor clearColor]];
        
        UILabel *lblPhone = [[UILabel alloc] initWithFrame:CGRectMake(470, 4, 130, 12)];
        [lblPhone setTag:3];
        [lblPhone setFont:[UIFont systemFontOfSize:10]];
        [lblPhone setTextColor:[UIColor colorWithRed:186.0/255.0 green:0.0/255.0 blue:32.0/255.0 alpha:1.0]];
        [lblPhone setBackgroundColor:[UIColor clearColor]];
        
        UILabel *lblCountry = [[UILabel alloc] initWithFrame:CGRectMake(650, 4, 150, 12)];
        [lblCountry setTag:4];
        [lblCountry setFont:[UIFont systemFontOfSize:10]];
        [lblCountry setTextColor:[UIColor colorWithRed:186.0/255.0 green:0.0/255.0 blue:32.0/255.0 alpha:1.0]];
        [lblCountry setBackgroundColor:[UIColor clearColor]];
        
        [cell addSubview:bgCell];
        [cell addSubview:lblName];
        [cell addSubview:lblAddress];
        [cell addSubview:lblPhone];
        [cell addSubview:lblCountry];
    }
    
    if (indexPath.row % 2 == 1)
    {
        [(UIView*)[cell viewWithTag:1122] setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
    }
    else
    {
        [(UIView*)[cell viewWithTag:1122] setBackgroundColor:[UIColor whiteColor]];
    }
    
    [(UILabel*)[cell viewWithTag:1] setText:[NSString stringWithFormat:@"%u", 10000000 + arc4random() %10000 + (indexPath.row  * 10000)]];
    [(UILabel*)[cell viewWithTag:2] setText:[self getAppType]];
    [(UILabel*)[cell viewWithTag:3] setText:[self getDate]];
    [(UILabel*)[cell viewWithTag:4] setText:[self getAppStatus]];
    
    
    return cell;
}

-(NSString*) getDate
{
    int n = arc4random() % 30;
    NSDate *newDate;
    
    newDate = [[NSDate date] dateByAddingTimeInterval:-60*60*24*n];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd MMMM yyyy"];
    return [dateFormatter stringFromDate:newDate];
}

-(NSString *) getAppType
{
    int rand = arc4random() %4;
    if (rand == 0)
    {
        return @"Credit Card";
    }
    else if (rand == 1)
    {
        return @"Personal Loan";
    }
    else if (rand == 2)
    {
        return @"Housing Loan";
    }
    return @"Car Loan";
}

-(NSString *) getAppStatus
{
    int rand = arc4random() %4;
    if (rand == 0)
    {
        return @"Approved";
    }
    else if (rand == 1)
    {
        return @"Rejected";
    }
    else if (rand == 2)
    {
        return @"Pending";
    }
    return @"On Process";
}

@end
