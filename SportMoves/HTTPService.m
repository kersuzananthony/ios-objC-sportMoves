//
//  HTTPService.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPService.h"
#import "Move+CoreDataClass.h"

@interface HTTPService()
@property(nonatomic, strong) NSURLSession *urlSession;
@end

@implementation HTTPService

// Create a singleton of HTTPService
+(id)sharedInstance {
    static HTTPService *sharedService = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedService = [[self alloc] init];
    });
    return sharedService;
}

// Initialization method
- (id)init {
    if (self = [super init]) {
        self.urlSession = [NSURLSession sharedSession];
    }
    
    return self;
}

// Synchronization of the sport moves
- (NSArray<Move *> *)synchronizeSportMoves {
    NSMutableArray<Move *> *sportMoves = [[NSMutableArray alloc]init];
    
    // Make HTTP Request for getting moves from internet
    
    
    return sportMoves;
}

@end
