//
//  MediaController.m
//  TestApp
//
//  Created by Jorge Colindres on 2/22/14.
//  Copyright (c) 2014 Jorge Colindres. All rights reserved.
//

#import "MediaController.h"
#import "MediaObject.h"

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

- (void)fetchPopularMediaWithCompletionBlock:(void (^)(BOOL success))completionBlock
{
    NSString *instagramEndpoint = @"https://api.instagram.com/v1/media/popular?client_id=5609d2fb2bf74d749716bd00a9090e5e";
    NSURL *URL = [NSURL URLWithString:instagramEndpoint];
    
    // Create a shared NSURLSession
    NSURLSession *shared = [NSURLSession sharedSession];
    
    // Invoke the dataTaskWithURL:completionHandler: method on the shared NSURLSession
    NSURLSessionDataTask *dataTask = [shared dataTaskWithURL:URL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        
        // In the completionHandler, check that the response has status code 200. If yes, call completionBlock(YES). If no, call completionBlock(NO).
        
        NSHTTPURLResponse *serverResponse = (NSHTTPURLResponse *)response;
        
        if (serverResponse.statusCode == 200) {
            
            // Create a pointer for a potential error, so we can use it later if it exists
            NSError *jsonError = nil;
            
            NSDictionary *hash = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
            
            if (!jsonError) {
                self.mediaObjects = [self mediaObjectsFromResponse:hash];
                NSLog(@"%@", self.mediaObjects);
                completionBlock(YES);
            } else {
                completionBlock(NO);
            }
            
        } else {
            completionBlock(NO);
        }
        
    }];
    
    // Call the NSURLSessionDataTask method that actually initiates the task
    [dataTask resume];
}

- (NSArray *)mediaObjectsFromResponse:(NSDictionary *)response
{
    // Initialize an empty NSMutableArray to hold the MediaObjects you create
    NSMutableArray * mediaObjects = [[NSMutableArray alloc] init];
    
    // Extract the array value that is keyed to the key "data" in the response dictionary
    NSArray *popularData = [response valueForKey:@"data"];
    
    for (int i = 0; i < [popularData count]; i++) {
        
        // Convert each dictionary it contains into a MediaObject
        MediaObject *mediaObject = [[MediaObject alloc] initWithDictionary:popularData[i]];
        
        // Push each new media object into the mediaObjects array
        [mediaObjects addObject:mediaObject];
    }
    
    return mediaObjects;
}


@end
