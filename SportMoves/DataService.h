//
//  DataService.h
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreDataManager.h"
#import "Move+CoreDataClass.h"

@interface DataService : NSObject

NS_ASSUME_NONNULL_BEGIN
- (id)initWithCoreDataManager:(CoreDataManager *)coreDataManager;
NS_ASSUME_NONNULL_END

- (NSArray<Move *>  * _Nullable)syncRecords:(NSArray<NSDictionary<NSString *, id> *> * _Nullable)jsonData;

@end
