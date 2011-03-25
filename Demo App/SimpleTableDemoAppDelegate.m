//
//  SimpleTableDemoAppDelegate.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "SimpleTableDemoAppDelegate.h"
#import "MainViewController.h"

@implementation SimpleTableDemoAppDelegate

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window makeKeyAndVisible];
    
    //Add the main view
    MainViewController *controller = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
    self.window.rootViewController = controller;
    [controller release];
    
    return YES;
}

- (void)dealloc
{
    [_window release];
    
    [super dealloc];
}

@end