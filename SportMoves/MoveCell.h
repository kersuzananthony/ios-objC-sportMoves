//
//  MoveCell.h
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Move+CoreDataClass.h"

@interface MoveCell : UITableViewCell

- (void)configureCellWithMove:(Move * _Nonnull)aMove;

@end
