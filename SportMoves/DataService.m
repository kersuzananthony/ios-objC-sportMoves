//
//  DataService.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataService.h"
#import "CoreDataManager.h"

@interface DataService()
@property(nonatomic, strong) CoreDataManager * _Nonnull coreDataManager;
@end

@implementation DataService

- (id)init {
    if (self = [super init]) {
        
    }
    
    return self;
}

@end
