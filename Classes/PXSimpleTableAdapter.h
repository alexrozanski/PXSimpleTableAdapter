//
//  PXSimpleTableAdapter.h
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PXSimpleTableSection.h"
#import "PXSimpleTableRow.h"
#import "PXSimpleTableAdapterDelegate.h"


@interface PXSimpleTableAdapter : NSObject <UITableViewDelegate, UITableViewDataSource> {
    UITableView *tableView;
    id <PXSimpleTableAdapterDelegate> _delegate;
    
    NSMutableArray *_sections;
}

@property (nonatomic, assign) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSArray *sections;

@property (nonatomic, assign) IBOutlet id<PXSimpleTableAdapterDelegate> delegate;

- (void)addSection:(PXSimpleTableSection*)section;
- (void)addRow:(PXSimpleTableRow*)row toSection:(PXSimpleTableSection*)section;

- (void)deselectRow:(PXSimpleTableRow*)row inSection:(PXSimpleTableSection*)section;

@end
