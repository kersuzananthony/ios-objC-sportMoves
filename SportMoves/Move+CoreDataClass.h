//
//  Move+CoreDataClass.h
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Move : NSManagedObject
-(id)initWithContext:(NSManagedObjectContext *)managedObjectContext moveJson:(NSDictionary<NSString *, id>*)aMoveJson;
@end

NS_ASSUME_NONNULL_END

#import "Move+CoreDataProperties.h"
