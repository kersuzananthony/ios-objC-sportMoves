//
//  AppDelegate.m
//  SportMoves
//
//  Created by Kersuzan on 24/11/2016.
//  Copyright © 2016 com.kersuzan. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataManager.h"
#import "MainViewController.h"

@interface AppDelegate ()
@property(nonatomic, strong) CoreDataManager * _Nullable coreDataManager;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self launchApplication];
    
    return YES;
}

// AppDelegate custom methods for launching app
-(void)launchApplication {
    AppDelegate * __weak weakSelf = self;
    
    self.coreDataManager = [[CoreDataManager alloc]initWithCompletion:^(NSError * _Nullable error) {
        if (error == nil) {
            [self setApplicationManagerInViews:^(UIViewController *viewController) {
                weakSelf.window.rootViewController = viewController;
            }];
        } else {
            // An error occured while instanciating coreDataManager
            
        }
    }];
}

-(void)setApplicationManagerInViews:(nullable onComplete)completionHandler {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UINavigationController *mainNavigationController = (UINavigationController *) [mainStoryboard instantiateViewControllerWithIdentifier:@"MainNavigationController"];
    MainViewController *mainViewController = (MainViewController *) mainNavigationController.viewControllers.firstObject;
    
    mainViewController.coreDataManager = self.coreDataManager;
    
    completionHandler(mainNavigationController);
}

@end
