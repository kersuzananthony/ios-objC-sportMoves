//
//  HTTPService.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPService.h"
#import "DataService.h"
#import "Move+CoreDataClass.h"

@interface HTTPService()
// Constants
#define CLIENT_URL "https://s3-us-west-1.amazonaws.com/fizzup/files/public/sample.json"

// Private variables
@property(nonatomic, strong) NSURLSession *urlSession;
@end

@implementation HTTPService

// Create a singleton of HTTPService
+ (id)sharedInstance {
    static HTTPService *sharedService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedService = [[self alloc] init];
        sharedService.urlSession = [NSURLSession sharedSession];
    });
    return sharedService;
}

// Send a HTTP Request to the server for getting JSON
// Resync local data with the json response
- (NSURLSessionDataTask *)loadDataFromServerWithCoreDataManager:(CoreDataManager *)aCoreDataManager andCompletionHandler:(onCompleteLoadData)completionHandler {
 
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"%s", CLIENT_URL]];
    
    NSURLSessionDataTask *dataTask = [self.urlSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
        if (data != nil) {
            NSError *err;
            NSDictionary *rawJson = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            NSArray *json = [rawJson objectForKey:@"data"];
            
            if (err != nil) {
                completionHandler(nil, @"Data is corrupted, please try again.");
            } else {
                // We have the json data, we can now perform synchronisation with coreData API
                DataService *dataService = [[DataService alloc]initWithCoreDataManager:aCoreDataManager];
                NSArray<Move *> *moves = [dataService syncRecords:json];
                
                completionHandler(moves, nil);
            }
        } else {
            completionHandler(nil, @"Problem connecting to the server");
        }
    }];
    
    // Begin the network request
    [dataTask resume];
    
    return dataTask;
}

@end
