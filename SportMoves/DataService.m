//
//  DataService.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "DataService.h"
#import "CoreDataManager.h"
#import "Move+CoreDataClass.h"

@interface DataService()
@property(nonatomic, strong) CoreDataManager * _Nonnull coreDataManager;
@end

@implementation DataService

- (id)initWithCoreDataManager:(CoreDataManager *)coreDataManager {
    if (self = [super init]) {
        self.coreDataManager = coreDataManager;
    }
    
    return self;
}

// MARK: Public methods
- (NSArray<Move *> *)syncRecords:(NSArray<NSDictionary<NSString *,id> *> *)jsonData {
    if (jsonData == nil) {
        return nil;
    } else {
        // Get all the previous moves
        NSArray *previousMoves = [self getAllMoves];
        
        // Delete moves
        [self deleteRecords:previousMoves];
        
        // Insert new records
        NSArray<Move *> *newMoves = [self insertRecords:jsonData];
        return newMoves;
    }
}

// MARK: Private methods
- (NSArray<Move *> *)getAllMoves {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:@"Move"];
    NSError *err; // Error where to store coredata err
    
    NSArray<Move *> *moves = (NSArray<Move *> *) [self.coreDataManager.mainManagedContext executeFetchRequest:fetchRequest error:&err];
    
    NSLog(@"Moves founded: %lu", (unsigned long)moves.count);
    
    return moves;
}

- (void)deleteRecords:(NSArray<NSManagedObject *> *)records {
    for (NSManagedObject *object in records) {
        [self.coreDataManager.mainManagedContext deleteObject:object];
        [self.coreDataManager save];
    }
}

- (NSArray<Move *> *)insertRecords:(NSArray<NSDictionary<NSString *, id> *> *)jsonData {
    NSMutableArray<Move *> *movesToReturn = [[NSMutableArray alloc]init];
    
    for (NSDictionary<NSString *, id> *moveData in jsonData) {
        Move *move = [[Move alloc]initWithContext:self.coreDataManager.mainManagedContext moveJson:moveData];
        
        [movesToReturn addObject:move];
    }
    
    [self.coreDataManager save];
    
    return movesToReturn;
}

@end
