//
//  MediaController.m
//  TestApp
//
//  Created by Jorge Colindres on 2/22/14.
//  Copyright (c) 2014 Jorge Colindres. All rights reserved.
//

#import "MediaController.h"

@implementation MediaController

- (id)init
{
    self = [super init];
    if (self)
    {
        self.mediaObjects = [NSArray array];
    }
    return self;
}

- (void)fetchPopularMediaWithCompletionBlock:(void (^)(BOOL))completionBlock
{
    NSLog(@"inside the fetchPopularMediaWithCompletionBlock method!");
    completionBlock(NO);
}

@end
