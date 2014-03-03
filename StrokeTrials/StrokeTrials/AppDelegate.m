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
    
    Article *a1 = [[Article alloc] init];
    a1.acro = @"ACTIVE-A";
    a1.title = @"Effect of Clopidogrel Added to Aspirin in Patients with Atrial Fibrillation";
    a1.year = @"2009";
    a1.url = @"http://www.nejm.org/doi/pdf/10.1056/NEJMoa0901301";
    a1.res = @"randomized, double-blind, multi-center, placebo controlled trial";
    a1.lim = @"“unsuitable for coumadin” is not clearly defined and introduces potential selection bias";
    a1.thm = @"In pts w/ Afib not suitable for warfarin, ASA + clopidogrel significantly decreases ischemic stroke risk and significantly increases minor->major bleeding risks compared to ASA monotherapy";
    [_articles addObject:a1];
    
    Article *a2 = [[Article alloc] init];
    a2.acro = @"ACTIVE-W";
    a2.title = @"Clopidogrel plus aspirin versus oral anticoagulation for atrial ﬁbrillation in the Atrial ﬁbrillation Clopidogrel Trial with Irbesartan for prevention of Vascular Events";
    a2.year = @"2006";
    a2.url = @"http://www.ncbi.nlm.nih.gov/pubmed/16765759";
    a2.res = @"randomized, open treatment w/ blinded adjucation of outcomes, controlled trial";
    a2.lim = @"the study was stopped early because of clear benefit of warfarin over ASA + clopidogrel";
    a2.thm = @"Warfarin is significantly superior to ASA + clopidogrel for preventing vascular complications in pts w/ Afib (especially non-disabling strokes in those already on anticoagulation) w/ no significant increase in bleeding complications";
    [_articles addObject:a2];
    
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