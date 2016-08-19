//
//  AppDelegate.m
//  LiveTweets
//
//  Created by Ajeet N on 11/07/16.
//  Copyright © 2016 AhexTech. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <TwitterKit/TwitterKit.h>
#import <Twitter/Twitter.h>
#import "MBProgressHUD.h"


@interface AppDelegate ()

@end

@implementation AppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    
    [Fabric with:@[[Twitter class]]];
    
//    [Fabric with:@[TwitterKit]];

    
    [[Twitter sharedInstance] startWithConsumerKey:@"rJyy0jYbFqEUuUDR8r6qdnUTU" consumerSecret:@"OXQDdT5NIXotKeXi0ZJLKpxXXBb9rf49RCb66tZGuHuYCuHTgT"];
    [Fabric with:@[[Twitter class]]];
    return YES;
}


#pragma mark----Progressbar code!!!!
- (void)showLoadingView:(BOOL)isShown activityTitle:(NSString*)title
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (isShown)
        {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            hud.mode = MBProgressHUDModeAnnularDeterminate;
            hud.labelText = title;
        }
        else
        {
            [MBProgressHUD hideHUDForView:self.window animated:YES];
        }
    });
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    if ([[Twitter sharedInstance] application:app openURL:url options:options]) {
        return YES;
    }
    
    // If you handle other (non Twitter Kit) URLs elsewhere in your app, return YES. Otherwise
    return NO;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
