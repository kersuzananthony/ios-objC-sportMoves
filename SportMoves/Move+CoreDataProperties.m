//
//  Move+CoreDataProperties.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import "Move+CoreDataProperties.h"

@implementation Move (CoreDataProperties)

+ (NSFetchRequest<Move *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Move"];
}

@dynamic moveId;
@dynamic localURL;
@dynamic moveName;
@dynamic remoteURL;

@end
