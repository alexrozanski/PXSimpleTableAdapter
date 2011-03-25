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

@interface PXSimpleTableAdapter : NSObject <UITableViewDelegate, UITableViewDataSource> {
    UITableView *tableView;
    
    NSMutableArray *_sections;
}

@property (nonatomic, assign) IBOutlet UITableView *tableView;

@property (nonatomic, retain) NSArray *sections;

@end
