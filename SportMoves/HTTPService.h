//
//  HTTPService.h
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "SportMove.h"

@interface HTTPService : NSObject

//@property(nonatomic, strong) NSMutableArray<Post *> *loadedPosts;

+ (id)sharedInstance;
- (id)init;

- (void)getSportMoves;

@end
