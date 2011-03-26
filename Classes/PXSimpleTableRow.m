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
@synthesize disclosureRow = _disclosureRow;
@synthesize section = _section;
@synthesize selectionHandler = _selectionHandler;

+ (id)rowWithTitle:(NSString*)title
{
    return [self rowWithTitle:title icon:nil selectionHandler:nil];
}

+ (id)rowWithTitle:(NSString *)title icon:(UIImage*)icon
{
    return [[[self alloc] initWithTitle:title icon:icon selectionHandler:nil] autorelease];
}

+ (id)rowWithTitle:(NSString *)title icon:(UIImage *)icon selectionHandler:(PXSimpleTableRowSelectionHandler)selectionHandler
{
	return [[[self alloc] initWithTitle:title icon:icon selectionHandler:selectionHandler] autorelease];
}

#pragma mark - Init/Dealloc

- (id)initWithTitle:(NSString*)title
{
	return [self initWithTitle:title icon:nil selectionHandler:nil];
}

- (id)initWithTitle:(NSString*)title icon:(UIImage*)icon 
{
	return [self initWithTitle:title icon:icon selectionHandler:nil];
}

- (id)initWithTitle:(NSString *)title icon:(UIImage *)icon selectionHandler:(PXSimpleTableRowSelectionHandler)selectionHandler
{
    if((self = [super init])) {
        _title = [title copy];
        _icon = [icon retain];
		_selectionHandler = [selectionHandler copy];
    }
    
    return self;
}

- (void)dealloc
{
    [_title release], _title=nil;
    [_icon release], _icon=nil;
    [_selectionHandler release], _selectionHandler = nil;
	
    [super dealloc];
}

@end
