//
//  MediaObject.m
//  TestApp
//
//  Created by Jorge Colindres on 2/23/14.
//  Copyright (c) 2014 Jorge Colindres. All rights reserved.
//

#import "MediaObject.h"

@implementation MediaObject

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        self.username = [self parseUsername:dictionary];
        self.imgURL = [self parseImageURL:dictionary];
    }
    return self;
}

- (NSString *)parseUsername:(NSDictionary *)dictionary
{
    NSString *username = @"-";
    
    // Extract the username string value from the dictionary
    NSDictionary *userDictionary = [dictionary valueForKey:@"user"];
    
    if ([self isValidElement:userDictionary])
    {
        NSString * tempUsername = [userDictionary valueForKey:@"username"];
        if ([self isValidElement:tempUsername])
        {
            username = tempUsername;
        }
    }
    
    return username;
}

- (NSURL *)parseImageURL:(NSDictionary *)dictionary
{
    NSString *URLString = @"";
    
    // Extract the standard_resolution url string value from the dictionary
    NSDictionary *images = [dictionary valueForKey:@"images"];
    if ([self isValidElement:images])
    {
        NSDictionary *imageDictionary = [images valueForKey:@"standard_resolution"];
        if ([self isValidElement:imageDictionary])
        {
            NSString *tempURLString = [imageDictionary valueForKey:@"url"];
            if ([self isValidElement:tempURLString])
            {
                URLString = tempURLString;
            }
        }
    }

    return [NSURL URLWithString:URLString];
}

- (BOOL)isValidElement:(id)element
{
    // Use this method to check that each relevant JSON element exists (is not nil) and is not null
    if (element && (NSNull *)element != [NSNull null])
    {
        return YES;
    } else {
        return NO;
    }
}

@end
