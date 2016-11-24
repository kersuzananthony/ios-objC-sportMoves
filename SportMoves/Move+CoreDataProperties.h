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

@property (nonatomic) int32_t id;
@property (nullable, nonatomic, copy) NSString *localURL;
@property (nullable, nonatomic, copy) NSString *moveName;
@property (nullable, nonatomic, copy) NSString *remoteURL;

@end

NS_ASSUME_NONNULL_END
