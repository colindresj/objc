//
//  PopularMediaViewController.h
//  TestApp
//
//  Created by Jorge Colindres on 2/22/14.
//  Copyright (c) 2014 Jorge Colindres. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopularMediaViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *loader;
@property (nonatomic, strong) IBOutlet UIRefreshControl *refreshControl;

@end
