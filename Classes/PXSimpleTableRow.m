//
//  PXSimpleTableRow.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "PXSimpleTableRow.h"


@implementation PXSimpleTableRow

@synthesize title = _title;
@synthesize icon = _icon;

+ (id)rowWithTitle:(NSString*)title
{
    return [self rowWithTitle:title icon:nil];
}

+ (id)rowWithTitle:(NSString*)title icon:(UIImage*)icon
{
    return [[[self alloc] initWithTitle:title icon:icon] autorelease];
}

#pragma mark - Init/Dealloc

- (id)initWithTitle:(NSString*)title
{
    return [self initWithTitle:title icon:nil];
}

- (id)initWithTitle:(NSString*)title icon:(UIImage*)icon
{
    if((self = [super init])) {
        _title = [title copy];
        _icon = [icon retain];
    }
    
    return self;
}

@end
