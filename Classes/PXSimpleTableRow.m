//
//  PXSimpleTableRow.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "PXSimpleTableRow.h"
#import "PXSimpleTableRow+Private.h"


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

- (id)initWithTitle:(NSString*)title icon:(UIImage*)icon selectionBlock:(PXSimpleTableRowSelectionBlock)selectionBlock
{
    if((self = [super init])) {
        _title = [title copy];
        _icon = [icon retain];
		_selectionBlock = [selectionBlock copy];
		_accessoryType = UITableViewCellAccessoryNone;
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

@end
