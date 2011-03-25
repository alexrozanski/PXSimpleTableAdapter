//
//  PXSimpleTableSection.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "PXSimpleTableSection.h"



@implementation PXSimpleTableSection

@synthesize sectionHeaderTitle = _sectionHeaderTitle;
@synthesize sectionFooterTitle = _sectionFooterTitle;
@synthesize rows = _rows;
@synthesize adapter = _adapter;


+ (id)sectionWithRows:(NSArray*)rows
{
    return [self sectionWithSectionHeaderTitle:nil sectionFooterTitle:nil rows:rows];
}

+ (id)sectionWithSectionHeaderTitle:(NSString*)headerTitle sectionFooterTitle:(NSString*)footerTitle rows:(NSArray*)rows
{
    return [[[self alloc] initWithSectionHeaderTitle:headerTitle sectionFooterTitle:footerTitle rows:rows] autorelease];
}


#pragma mark - Init/Dealloc

- (id)initWithRows:(NSArray*)rows
{
    return [self initWithSectionHeaderTitle:nil sectionFooterTitle:nil rows:rows];
}

- (id)initWithSectionHeaderTitle:(NSString*)headerTitle sectionFooterTitle:(NSString*)footerTitle rows:(NSArray*)rows
{
    if((self = [super init])) {
        _rows = [rows mutableCopy];
        _sectionHeaderTitle = [headerTitle copy];
        _sectionFooterTitle = [footerTitle copy];
    }
    
    return self;
}

- (void)dealloc
{
    [_rows release], _rows=nil;
    [_sectionHeaderTitle release], _sectionHeaderTitle=nil;
    [_sectionFooterTitle release], _sectionFooterTitle=nil;
    
    [super dealloc];
}

#pragma mark - Custom Accessors

- (void)setRows:(NSArray*)rows
{
    NSMutableArray *newRows = [rows mutableCopy];
    
    [rows release];
    _rows = newRows;
}

@end
