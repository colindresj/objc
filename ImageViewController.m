//
//  ImageViewController.m
//  TestApp
//
//  Created by Jorge Colindres on 2/23/14.
//  Copyright (c) 2014 Jorge Colindres. All rights reserved.
//

#import "ImageViewController.h"
#import "MediaObject.h"

@interface ImageViewController ()

@property (nonatomic, strong) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

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
    
    self.title = self.mediaObject.username;
    
    // Ensure that our UI elements begin just after the navigationBar rather than beneath it
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupImageView
{
    
}

@end
