//
//  MainViewController.h
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataManager.h"

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, strong) CoreDataManager * _Nonnull coreDataManager;
@end
