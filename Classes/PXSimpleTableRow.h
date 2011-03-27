//
//  PXSimpleTableRow.h
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PXSimpleTableRow;
@class PXSimpleTableSection;

typedef void (^PXSimpleTableRowSelectionHandler) (PXSimpleTableRow *row);

@interface PXSimpleTableRow : NSObject {
    PXSimpleTableSection *_section;
    
    NSString *_title;
    UIImage *_icon;
    PXSimpleTableRowSelectionHandler _selectionHandler;
	PXSimpleTableRowSelectionHandler _accessoryTappedBlock;
	UITableViewCellAccessoryType _accessoryType;
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) UIImage *icon;
@property (nonatomic, copy) PXSimpleTableRowSelectionHandler selectionHandler;
@property (nonatomic, copy) PXSimpleTableRowSelectionHandler accessoryTappedBlock;
@property (nonatomic, assign) UITableViewCellAccessoryType accessoryType;

@property (nonatomic, readonly) PXSimpleTableSection *section;
@property (nonatomic, readonly) NSIndexPath *indexPath;

+ (id)rowWithTitle:(NSString*)title;
+ (id)rowWithTitle:(NSString*)title icon:(UIImage*)icon;
+ (id)rowWithTitle:(NSString *)title icon:(UIImage *)icon selectionHandler:(PXSimpleTableRowSelectionHandler)selectionHandler;

- (id)initWithTitle:(NSString*)title;
- (id)initWithTitle:(NSString*)title icon:(UIImage*)icon;
- (id)initWithTitle:(NSString *)title icon:(UIImage *)icon selectionHandler:(PXSimpleTableRowSelectionHandler)selectionHandler;

@end
