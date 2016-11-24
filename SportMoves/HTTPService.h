//
//  HTTPService.h
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CoreDataManager.h"
#import "Move+CoreDataClass.h"

typedef void (^onCompleteLoadData)(NSArray<Move *> * _Nullable moves, NSString  * _Nullable errorMessage);

@interface HTTPService : NSObject

NS_ASSUME_NONNULL_BEGIN
+ (id)sharedInstance;
NS_ASSUME_NONNULL_END

- (NSURLSessionDataTask * _Nonnull)loadDataFromServerWithCoreDataManager:(CoreDataManager * _Nonnull)aCoreDataManager andCompletionHandler:(nullable onCompleteLoadData)completionHandler;
@end
