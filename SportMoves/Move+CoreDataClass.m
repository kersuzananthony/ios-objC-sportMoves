//
//  Move+CoreDataClass.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import "Move+CoreDataClass.h"

@implementation Move

-(id)initWithContext:(NSManagedObjectContext *)managedObjectContext moveJson:(NSDictionary<NSString *, id>*)aMoveJson {
    if (self = [super initWithContext:managedObjectContext]) {
        self.moveName = [aMoveJson objectForKey:@"name"];
        self.remoteURL = [aMoveJson objectForKey:@"image_url"];
        self.moveId = [aMoveJson objectForKey:@"id"];
    }
    
    return self;
}

@end
