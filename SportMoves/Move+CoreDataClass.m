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
        [self setValue:[aMoveJson objectForKey:@"name"] forKey:@"moveName"];
        [self setValue:[aMoveJson objectForKey:@"image_url"] forKey:@"remoteURL"];
        [self setValue:[NSString stringWithFormat:@"%@", [aMoveJson objectForKey:@"id"]] forKey:@"moveId"];
    }
    
    NSLog(@"%@", self.moveName);
    
    return self;
}

@end
