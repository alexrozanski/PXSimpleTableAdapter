//
//  PXSimpleTableAdapter.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "PXSimpleTableAdapter.h"


@implementation PXSimpleTableAdapter

@synthesize tableView;
@synthesize sections = _sections;

#pragma mark - Init/Dealloc

- (id)init
{
    if((self = [super init])) {
        _sections = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [_sections release], _sections=nil;
    
    [super dealloc];
}

#pragma mark - Custom Accessors

- (void)setTableView:(UITableView*)newTableView
{
    [tableView setDelegate:nil];
    [tableView setDataSource:nil];
    
    tableView = newTableView;
    
    [newTableView setDelegate:self];
    [newTableView setDataSource:self];
}

- (void)setSections:(NSArray*)newSections
{
    NSMutableArray *s = [newSections mutableCopy];
    
    [_sections release];
    _sections = s;
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SimpleTableCellIdentifier";
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellIdentifier] autorelease];
    }
    
    return cell;
}

@end
