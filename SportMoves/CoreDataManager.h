//
//  CoreDataManager.h
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void (^onCompleteWithError)(NSError * _Nullable error);

@interface CoreDataManager : NSObject

@property(nonatomic, strong) NSManagedObjectContext * _Nonnull mainManagedContext;
-(id)initWithCompletion:(nullable onCompleteWithError)completionHandler;
@end
