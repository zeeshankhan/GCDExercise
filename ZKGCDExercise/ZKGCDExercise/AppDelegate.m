//
//  AppDelegate.m
//  ZKGCDExercise
//
//  Created by Zeeshan Khan on 03/09/14.
//  Copyright (c) 2014 Zeeshan Khan. All rights reserved.
//

#import "AppDelegate.h"
#import "DocumentManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] init];
    [self.window makeKeyAndVisible];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [DocumentManager sharedManager];
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [DocumentManager sharedManager];
    });
    
    
    return YES;
}

@end
