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

#pragma mark - Custom Accessors

- (void)setRows:(NSArray*)rows
{
    NSMutableArray *newRows = [rows mutableCopy];
    
    [rows release];
    _rows = newRows;
}

@end
