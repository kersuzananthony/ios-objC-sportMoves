//
//  Move+CoreDataProperties.h
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import "Move+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Move (CoreDataProperties)

+ (NSFetchRequest<Move *> *)fetchRequest;

@property (nullable, nonatomic) NSString *moveId;
@property (nullable, nonatomic) NSString *localURL;
@property (nullable, nonatomic) NSString *moveName;
@property (nullable, nonatomic) NSString *remoteURL;

@end

NS_ASSUME_NONNULL_END
