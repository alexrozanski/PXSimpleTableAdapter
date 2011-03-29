//
//  PXSimpleTableRow.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "PXSimpleTableRow.h"
#import "PXSimpleTableRow+Private.h"
#import "PXSimpleTableAdapter.h"

@implementation PXSimpleTableRow

@synthesize title = _title;
@synthesize icon = _icon;
@synthesize accessoryType = _accessoryType;
@synthesize section = _section;
@synthesize selectionBlock = _selectionBlock;
@synthesize accessoryTappedBlock = _accessoryTappedBlock;

+ (id)rowWithTitle:(NSString*)title
{
    return [self rowWithTitle:title icon:nil selectionBlock:nil];
}

+ (id)rowWithTitle:(NSString *)title icon:(UIImage*)icon
{
    return [[[self alloc] initWithTitle:title icon:icon selectionBlock:nil] autorelease];
}

+ (id)rowWithTitle:(NSString *)title icon:(UIImage *)icon selectionBlock:(PXSimpleTableRowSelectionBlock)selectionBlock
{
	return [[[self alloc] initWithTitle:title icon:icon selectionBlock:selectionBlock] autorelease];
}

#pragma mark - Init/Dealloc

- (id)initWithTitle:(NSString*)title
{
	return [self initWithTitle:title icon:nil selectionBlock:nil];
}

- (id)initWithTitle:(NSString*)title icon:(UIImage*)icon 
{
	return [self initWithTitle:title icon:icon selectionBlock:nil];
}

- (id)initWithTitle:(NSString *)title icon:(UIImage *)icon selectionBlock:(PXSimpleTableRowSelectionBlock)selectionBlock
{
    if((self = [super init])) {
        _title = [title copy];
        _icon = [icon retain];
		_accessoryType = UITableViewCellAccessoryNone;
		_selectionBlock = [selectionBlock copy];
    }
    
    return self;
}

- (void)dealloc
{
    [_title release], _title=nil;
    [_icon release], _icon=nil;
    [_selectionBlock release], _selectionBlock = nil;
	[_accessoryTappedBlock release], _accessoryTappedBlock = nil;
	
    [super dealloc];
}

#pragma mark - Setters

- (void)setIcon:(UIImage *)icon
{
	id old = _icon;
	_icon = [icon retain];
	[old release];
	
	[self.section.adapter.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:self.indexPath] 
										  withRowAnimation:UITableViewRowAnimationFade];
}

- (void)setTitle:(NSString *)title
{
	id old = _title;
	_title = [title retain];
	[old release];
	
	[self.section.adapter.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:self.indexPath] 
										  withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Getters

- (NSIndexPath *)indexPath
{
	NSUInteger rowIndex = [self.section.rows indexOfObject:self];
	return [NSIndexPath indexPathForRow:rowIndex inSection:self.section.index];
}

- (UITableViewCell *)representedCell
{
	return [self.section.adapter.tableView cellForRowAtIndexPath:self.indexPath];
}

#pragma mark - Cell Handling

+ (NSString*)cellIdentifier
{
    return NSStringFromClass(self);
}

+ (UITableViewCell*)newCellForRow
{
    UITableViewCell *newCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                      reuseIdentifier:[self cellIdentifier]];
    
    return newCell;
}

- (void)setUpContentsOfCell:(UITableViewCell*)cell
{
    cell.textLabel.text = self.title;
    cell.imageView.image = self.icon;
    cell.accessoryType = self.accessoryType;
}

@end
