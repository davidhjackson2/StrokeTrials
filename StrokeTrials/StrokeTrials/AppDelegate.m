//
//  AppDelegate.m
//  StrokeTrials
//
//  Created by David Jackson on 2/15/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "AppDelegate.h"
#import "Article.h"
#import "ArticlesViewController.h"

@implementation AppDelegate
{
    NSMutableArray *_articles;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _articles = [NSMutableArray arrayWithCapacity:100];
    
    Article *article = [[Article alloc] init];
    article.acro = @"ACTIVE-A";
    article.title = @"Effect of Clopidogrel Added to Aspirin in Patients with Atrial Fibrillation";
    [_articles addObject:article];
    
    article = [[Article alloc] init];
    article.acro = @"ACTIVE-W";
    article.title = @"Clopidogrel plus aspirin versus oral anticoagulation for atrial ﬁbrillation in the Atrial ﬁbrillation Clopidogrel Trial with Irbesartan for prevention of Vascular Events";
    [_articles addObject:article];
    
    // Revise this logic if the storyboard is altered
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = [tabBarController viewControllers][0];
    ArticlesViewController *articlesViewController = [navigationController viewControllers][0];
    articlesViewController.articles = _articles;
    
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