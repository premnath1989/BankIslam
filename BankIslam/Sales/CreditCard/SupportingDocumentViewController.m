//
//  SupportingDocumentViewController.m
//  BankIslam
//
//  Created by Danny Raharja on 15/01/2014.
//  Copyright (c) 2014 Danny Raharja. All rights reserved.
//

#import "SupportingDocumentViewController.h"

@interface SupportingDocumentViewController ()

@end

@implementation SupportingDocumentViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated
{
    CAGradientLayer *bgLayer = [GradientLayer greyGradient];
    bgLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view.layer insertSublayer:bgLayer atIndex:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Set border for Image View
    imgA.layer.borderColor = [UIColor blackColor].CGColor;
    imgA.layer.borderWidth = 1.0f;
    
    imgB.layer.borderColor = [UIColor blackColor].CGColor;
    imgB.layer.borderWidth = 1.0f;
    
    imgC.layer.borderColor = [UIColor blackColor].CGColor;
    imgC.layer.borderWidth = 1.0f;
    
    imgD.layer.borderColor = [UIColor blackColor].CGColor;
    imgD.layer.borderWidth = 1.0f;
    
    imgE.layer.borderColor = [UIColor blackColor].CGColor;
    imgE.layer.borderWidth = 1.0f;
    
    imgF.layer.borderColor = [UIColor blackColor].CGColor;
    imgF.layer.borderWidth = 1.0f;
    // End of setting border for image view
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:recognizer];
}

- (void) didSwipe:(UISwipeGestureRecognizer *)recognizer{
    if([recognizer direction] == UISwipeGestureRecognizerDirectionLeft){
        //Swipe from right to left
        //Do your functions here
        [delegate nextSegment];
    }else{
        //Swipe from left to right
        //Do your functions here
        [delegate prevSegment];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)takePicture:(id)sender
{
    posTag = [sender tag];
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    }
    else
    {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(UIImage*) setWatermarkFromImage:(UIImage*) inputImage
{
    
    NSLog(@"detail = %f,%f", inputImage.size.width, inputImage.size.height);
    UIImage *watermarkImage = [UIImage imageNamed:@"watermark.png"];
    
    UIGraphicsBeginImageContext(inputImage.size);
    [inputImage drawInRect:CGRectMake(0, 0, inputImage.size.width, inputImage.size.height)];
    
    [watermarkImage drawInRect:CGRectMake(0, 0, watermarkImage.size.width, watermarkImage.size.height)];
//    [watermarkImage drawInRect:CGRectMake(0, inputImage.size.height - watermarkImage.size.height, watermarkImage.size.width, watermarkImage.size.height)];
//    [watermarkImage drawInRect:CGRectMake(inputImage.size.width - watermarkImage.size.width, 0, watermarkImage.size.width, watermarkImage.size.height)];
//    [watermarkImage drawInRect:CGRectMake(inputImage.size.width - watermarkImage.size.width, inputImage.size.height - watermarkImage.size.height, watermarkImage.size.width, watermarkImage.size.height)];
//    
//    [watermarkImage drawInRect:CGRectMake(inputImage.size.width/2 - watermarkImage.size.width/2, 0, watermarkImage.size.width, watermarkImage.size.height)];
//    [watermarkImage drawInRect:CGRectMake(0, inputImage.size.height/2 - watermarkImage.size.height/2, watermarkImage.size.width, watermarkImage.size.height)];
//    [watermarkImage drawInRect:CGRectMake(inputImage.size.width/2 - watermarkImage.size.width/2, inputImage.size.height/2 - watermarkImage.size.height/2, watermarkImage.size.width, watermarkImage.size.height)];
//    [watermarkImage drawInRect:CGRectMake(inputImage.size.width - watermarkImage.size.width, inputImage.size.height/2 - watermarkImage.size.height/2, watermarkImage.size.width, watermarkImage.size.height)];
//    [watermarkImage drawInRect:CGRectMake(inputImage.size.width/2 - watermarkImage.size.width/2, inputImage.size.height - watermarkImage.size.height, watermarkImage.size.width, watermarkImage.size.height)];
//    
//    [watermarkImage drawInRect:CGRectMake(inputImage.size.width/4 - watermarkImage.size.width/4, inputImage.size.height/4 - watermarkImage.size.height/4, watermarkImage.size.width, watermarkImage.size.height)];
//    [watermarkImage drawInRect:CGRectMake(inputImage.size.width/4 - watermarkImage.size.width/4 + inputImage.size.width/3, inputImage.size.height/4 - watermarkImage.size.height/4, watermarkImage.size.width, watermarkImage.size.height)];
//    [watermarkImage drawInRect:CGRectMake(inputImage.size.width/4 - watermarkImage.size.width/4, inputImage.size.height/4 - watermarkImage.size.height/4 + inputImage.size.height/2 - watermarkImage.size.height/2, watermarkImage.size.width, watermarkImage.size.height)];
//    [watermarkImage drawInRect:CGRectMake(inputImage.size.width/4 - watermarkImage.size.width/4 + inputImage.size.width/3, inputImage.size.height/4 - watermarkImage.size.height/4 + inputImage.size.height/2 - watermarkImage.size.height/2, watermarkImage.size.width, watermarkImage.size.height)];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    image = [self setWatermarkFromImage:image];
    
    if (posTag == 1)
    {
        [imgA setImage:image];
    }
    else if (posTag == 2)
    {
        [imgB setImage:image];
    }
    else if (posTag == 3)
    {
        [imgC setImage:image];
    }
    else if (posTag == 4)
    {
        [imgD setImage:image];
    }
    else if (posTag == 5)
    {
        [imgE setImage:image];
    }
    else if (posTag == 6)
    {
        [imgF setImage:image];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
