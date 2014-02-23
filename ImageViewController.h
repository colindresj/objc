//
//  ImageViewController.h
//  TestApp
//
//  Created by Jorge Colindres on 2/23/14.
//  Copyright (c) 2014 Jorge Colindres. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MediaObject.h"

@interface ImageViewController : UIViewController

@property (nonatomic, strong) IBOutlet MediaObject *mediaObject;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *loader;

@end
