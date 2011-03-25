//
//  MainViewController.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "MainViewController.h"


@implementation MainViewController

@synthesize tableAdapter;

#pragma mark - Init/Dealloc

- (void)dealloc 
{
    [tableAdapter release], tableAdapter=nil;
    
    [super dealloc];
}

#pragma mark - View Lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.tableAdapter = nil;
}

@end
