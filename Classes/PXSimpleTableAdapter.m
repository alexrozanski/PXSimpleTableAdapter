//
//  PXSimpleTableAdapter.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "PXSimpleTableAdapter.h"

#import "PXSimpleTableSection+Private.h"

@implementation PXSimpleTableAdapter

@synthesize tableView;
@synthesize sections = _sections;
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
    [section setAdapter:self];
    
    [self.tableView reloadData];
}

- (void)addRow:(PXSimpleTableRow*)row toSection:(PXSimpleTableSection*)section
{
    [(NSMutableArray*)section.rows addObject:row];
    
    [self.tableView reloadData];
}

- (PXSimpleTableRow*)rowAtIndexPath:(NSIndexPath*)indexPath
{
    return [[[self.sections objectAtIndex:indexPath.section] rows] objectAtIndex:indexPath.row];
}

- (NSInteger)indexOfSectionInTable:(PXSimpleTableSection*)section
{
    return [self.sections indexOfObject:section];
}

- (NSInteger)indexOfRowInSection:(PXSimpleTableRow*)row
{
    return [row.section.rows indexOfObject:row];
}

#pragma mark - Selection

- (PXSimpleTableRow*)selectedRow
{
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    if(selectedIndexPath) {
        return [[[self.sections objectAtIndex:selectedIndexPath.section] rows] objectAtIndex:selectedIndexPath.row];
    }
    
    return nil;
}

- (void)deselectRow:(PXSimpleTableRow*)row
{
    NSUInteger sectionIndex = [self.sections indexOfObject:row.section];
    NSUInteger rowIndex = [row.section.rows indexOfObject:row];
    
    [self.tableView deselectRowAtIndexPath:[NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex] animated:YES];
}

#pragma mark - Custom Accessors

- (void)setTableView:(UITableView*)newTableView
{
    tableView.delegate = nil;
    tableView.dataSource = nil;
    
    tableView = newTableView;
    
    tableView.delegate = self;
    tableView.dataSource = self;
}

- (void)setSections:(NSArray*)newSections
{
    NSMutableArray *s = [newSections mutableCopy];

    //Untag ourselves from the sections
    for(PXSimpleTableSection *theSection in _sections) {
        theSection.adapter=nil;
    }
    
    [_sections release];
    _sections = s;
    
    //Tag ourselves to the new sections
    for(PXSimpleTableSection *theSection in _sections) {
        theSection.adapter=self;
    }
    
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
    cell.imageView.image = row.icon;
    
    if([row isDisclosureRow]) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
	PXSimpleTableSection *section = [self.sections objectAtIndex:indexPath.section];
	PXSimpleTableRow *row = [section.rows objectAtIndex:indexPath.row];
	
	row.selectionBlock(row);
	
    if([self.delegate respondsToSelector:@selector(simpleTableAdapter:didSelectRow:)]) {
        [self.delegate simpleTableAdapter:self didSelectRow:row];
    }
}

@end
