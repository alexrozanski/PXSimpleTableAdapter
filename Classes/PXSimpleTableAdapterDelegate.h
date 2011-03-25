//
//  PXSimpleTableAdapterDelegate.h
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PXSimpleTableAdapter, PXSimpleTableRow, PXSimpleTableSection;

@protocol PXSimpleTableAdapterDelegate <NSObject>
- (void)simpleTableAdapter:(PXSimpleTableAdapter*)adapter didSelectRow:(PXSimpleTableRow*)row inSection:(PXSimpleTableSection*)section;
@end