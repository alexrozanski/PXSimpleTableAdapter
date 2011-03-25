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
@synthesize rowShouldDeselectWhenSelected = _rowShouldDeselectWhenSelected;
@synthesize delegate = _delegate;

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

#pragma mark - Data Handling

- (void)addSection:(PXSimpleTableSection*)section
{
    [_sections addObject:section];
    
    [self.tableView reloadData];
}

- (void)addRow:(PXSimpleTableRow*)row toSection:(PXSimpleTableSection*)section
{
    [(NSMutableArray*)section.rows addObject:row];
    
    [self.tableView reloadData];
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
    
    [self.tableView reloadData];
}

#pragma mark - UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    PXSimpleTableSection *theSection = [self.sections objectAtIndex:section];
    
    return [theSection.rows count];
}

- (UITableViewCell*)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"SimpleTableCellIdentifier";
    
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:cellIdentifier] autorelease];
    }
    
    
    PXSimpleTableRow *row = [[[self.sections objectAtIndex:indexPath.section] rows] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = row.title;
    
    if([row isDisclosureRow]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureButton;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    PXSimpleTableSection *theSection = [self.sections objectAtIndex:section];
    
    return theSection.sectionHeaderTitle;
}

- (NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    PXSimpleTableSection *theSection = [self.sections objectAtIndex:section];
    
    return theSection.sectionFooterTitle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate conformsToProtocol:@protocol(PXSimpleTableAdapterDelegate)]) {
        PXSimpleTableSection *section = [self.sections objectAtIndex:indexPath.section];
        PXSimpleTableRow *row = [section.rows objectAtIndex:indexPath.row];
        
        [self.delegate simpleTableAdapter:self didSelectRow:row inSection:section];
    }
}

@end
