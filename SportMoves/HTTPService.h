//
//  HTTPService.h
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Move+CoreDataClass.h"

@interface HTTPService : NSObject

NS_ASSUME_NONNULL_BEGIN
@property(nonatomic, strong) NSURLSession *sharedSession;

+ (id)sharedInstance;

NS_ASSUME_NONNULL_END

- (NSArray<Move *>  * _Nullable)synchronizeSportMoves;

@end
