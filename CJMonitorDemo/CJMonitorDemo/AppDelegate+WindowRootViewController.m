//
//  AppDelegate+WindowRootViewController.m
//  CJNetworkDemo
//
//  Created by ciyouzen on 6/25/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import "AppDelegate+WindowRootViewController.h"

#import "LogMonitorHomeViewController.h"
#import "SuspendHomeViewController.h"
#import "DataMonitorHomeViewController.h"


@implementation AppDelegate (WindowRootViewController)

- (UIViewController *)getMainRootViewController {
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar_BG"];
    
    LogMonitorHomeViewController *homeViewController = [[LogMonitorHomeViewController alloc] init];
    homeViewController.navigationItem.title = NSLocalizedString(@"LogMonitor首页", nil);
    homeViewController.tabBarItem.title = NSLocalizedString(@"LogMonitor", nil);
    homeViewController.tabBarItem.image = [[UIImage imageNamed:@"icons8-home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //homeViewController. = @"10";
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    [tabBarController addChildViewController:homeNavigationController];
    
    
    SuspendHomeViewController *scrollViewHomeViewController = [[SuspendHomeViewController alloc] init];
    scrollViewHomeViewController.navigationItem.title = NSLocalizedString(@"Suspend首页", nil);
    scrollViewHomeViewController.tabBarItem.title = NSLocalizedString(@"Suspend", nil);
    scrollViewHomeViewController.tabBarItem.image = [[UIImage imageNamed:@"icons8-calendar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *scrollViewHomeNavigationController = [[UINavigationController alloc] initWithRootViewController:scrollViewHomeViewController];
    [tabBarController addChildViewController:scrollViewHomeNavigationController];
    
    
    DataMonitorHomeViewController *viewController4 = [[DataMonitorHomeViewController alloc] init];
    viewController4.view.backgroundColor = [UIColor whiteColor];
    viewController4.navigationItem.title = NSLocalizedString(@"DataMonitor首页", nil);
    viewController4.tabBarItem.title = NSLocalizedString(@"DataMonitor", nil);
    viewController4.tabBarItem.image = [[UIImage imageNamed:@"icons8-settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *navigationController4 = [[UINavigationController alloc] initWithRootViewController:viewController4];
    [tabBarController addChildViewController:navigationController4];
    
//    [tabBarController setViewControllers:@[firstNavigationController, secondNavigationController, navigationController3, navigationController4] animated:YES];
    
    return tabBarController;
}

@end
