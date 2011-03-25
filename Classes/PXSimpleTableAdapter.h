//
//  PXSimpleTableAdapter.h
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PXSimpleTableAdapter : NSObject <UITableViewDelegate, UITableViewDataSource> {
    UITableView *tableView;
    
    NSMutableArray *_sections;
}

@property (nonatomic, assign) UITableView *tableView;

@end
