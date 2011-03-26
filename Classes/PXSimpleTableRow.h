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

typedef void (^PXSimpleTableRowSelectedBlock) (PXSimpleTableRow *row);

@interface PXSimpleTableRow : NSObject {
    PXSimpleTableSection *_section;
    
    NSString *_title;
    UIImage *_icon;
    PXSimpleTableRowSelectedBlock _selectionBlock;
    BOOL _disclosureRow;
	
	
}

@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) UIImage *icon;
@property (nonatomic, copy) PXSimpleTableRowSelectedBlock selectionBlock;
@property (nonatomic, assign, getter=isDisclosureRow) BOOL disclosureRow;

@property (nonatomic, readonly) PXSimpleTableSection *section;

+ (id)rowWithTitle:(NSString*)title;
+ (id)rowWithTitle:(NSString*)title icon:(UIImage*)icon;
+ (id)rowWithTitle:(NSString *)title icon:(UIImage *)icon selectionBlock:(PXSimpleTableRowSelectedBlock)selectionBlock;

- (id)initWithTitle:(NSString*)title;
- (id)initWithTitle:(NSString*)title icon:(UIImage*)icon;
- (id)initWithTitle:(NSString *)title icon:(UIImage *)icon selectionBlock:(PXSimpleTableRowSelectedBlock)selectionBlock;

@end
