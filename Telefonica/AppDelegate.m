//
//  AppDelegate.m
//  Telefonica
//
//  Created by Action-Item on 12/18/15.
//  Copyright © 2015 Action item. All rights reserved.
//

#import "AppDelegate.h"

#define XCODE_COLORS_ESCAPE @"\033["
//
//#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
//#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"

@interface AppDelegate ()

@end

@implementation AppDelegate
{
    UITabBarController *_tabBarCotroller;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    setenv("XcodeColors", "YES", 0);
    char *xcode_colors = getenv("XcodeColors");
    if (xcode_colors && (strcmp(xcode_colors, "YES") == 0))
    {
        NSLog(XCODE_COLORS_ESCAPE @"fg0,0,255;");
        NSLog(@"YES");
        // XcodeColors is installed and enabled!
    }
    
    NSLog(@"vfsv");
    NSLog(@"vsfnv");
    
    NSLog(XCODE_COLORS_RESET);

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UISettingsViewController *setting = [[UISettingsViewController alloc] initWithNibName:@"UISettingsViewController" bundle:[NSBundle mainBundle]];
    
    UINavigationController *settingNavController = [[UINavigationController alloc] initWithRootViewController:setting];
    
    _tabBarCotroller = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
    _tabBarCotroller.viewControllers = [NSArray arrayWithObjects:settingNavController, nil];
    
    settingNavController.tabBarItem = [[UITabBarItem alloc]
                                       initWithTabBarSystemItem:UITabBarSystemItemFeatured
                                       tag:1];
    
    self.window.rootViewController = _tabBarCotroller;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
