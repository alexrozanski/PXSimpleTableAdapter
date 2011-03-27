//
//  PXSimpleTableSection.h
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PXSimpleTableAdapter;
@class PXSimpleTableRow;

@interface PXSimpleTableSection : NSObject {
    PXSimpleTableAdapter *_adapter;
    
    NSString *_sectionHeaderTitle;
    NSString *_sectionFooterTitle;
    
    NSMutableArray *_rows;
}

@property (nonatomic, readonly) PXSimpleTableAdapter *adapter;

@property (nonatomic, copy) NSString *sectionHeaderTitle;
@property (nonatomic, copy) NSString *sectionFooterTitle;
@property (nonatomic, retain) NSArray *rows;
@property (nonatomic, readonly) NSUInteger index;

+ (id)sectionWithRows:(NSArray*)rows;
+ (id)sectionWithSectionHeaderTitle:(NSString*)headerTitle sectionFooterTitle:(NSString*)footerTitle rows:(NSArray*)rows;

- (id)initWithRows:(NSArray*)rows;
- (id)initWithSectionHeaderTitle:(NSString*)headerTitle sectionFooterTitle:(NSString*)footerTitle rows:(NSArray*)rows;

- (void)addRow:(PXSimpleTableRow *)row;
- (void)insertRow:(PXSimpleTableRow *)row atIndex:(NSUInteger)index;
- (void)removeRow:(PXSimpleTableRow *)row;

@end
