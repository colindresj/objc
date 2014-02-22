//
//  MediaController.h
//  TestApp
//
//  Created by Jorge Colindres on 2/22/14.
//  Copyright (c) 2014 Jorge Colindres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MediaController : NSObject;

@property (nonatomic, strong) NSArray *mediaObjects;

- (void)fetchPopularMediaWithCompletionBlock:(void (^)(BOOL success))completionBlock;

@end