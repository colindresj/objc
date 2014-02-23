//
//  MediaObject.h
//  TestApp
//
//  Created by Jorge Colindres on 2/23/14.
//  Copyright (c) 2014 Jorge Colindres. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MediaObject : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSURL *imgURL;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
