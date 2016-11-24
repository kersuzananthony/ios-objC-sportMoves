//
//  CoreDataManager.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"

@interface CoreDataManager()
// Private variables
@property(nonatomic, strong) NSPersistentStoreCoordinator *coordinator;
@end

@implementation CoreDataManager

-(id)initWithCompletion:(nullable onCompleteWithError)completionHandler {
    if (self = [super init]) {
        NSURL *modelURL = [[NSBundle mainBundle]URLForResource:@"SportMoves" withExtension:@"momd"];
        NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelURL];
        
        self.coordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:managedObjectModel];
        self.mainManagedContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
        
        self.mainManagedContext.persistentStoreCoordinator = self.coordinator;
        
        dispatch_queue_attr_t qosAttribute = dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_CONCURRENT, QOS_CLASS_UTILITY, 0);
        dispatch_queue_t coreDataManagerQueue = dispatch_queue_create("com.kersuzan.SportMoves.CoreDataQueue", qosAttribute);
        
        dispatch_async(coreDataManagerQueue, ^{
            NSError *error;

            NSDictionary *options = @{
                                      NSMigratePersistentStoresAutomaticallyOption: @YES,
                                      NSInferMappingModelAutomaticallyOption: @YES,
                                      NSSQLitePragmasOption: @{@"journal_mode": @"DELETE"}
                                      };
            
            NSFileManager *fileManager = [NSFileManager defaultManager];
            NSArray<NSURL *> *directory = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
        
            NSURL *storeURL = [[directory firstObject] URLByAppendingPathComponent:@"SportMoves.sqlite"];
            
            [self.coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
            
            NSAssert(storeURL != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(error);
            });
        });
    }
    
    return self;
}

- (void)save {
    if ([self.mainManagedContext hasChanges]) {
        CoreDataManager __weak *weakSelf = self;
        
        
        [self.mainManagedContext performBlockAndWait:^{
            NSError *err;
            [weakSelf.mainManagedContext save:&err];
            
            NSAssert(err == nil, @"Error is not nil");
        }];
    }
}

@end
