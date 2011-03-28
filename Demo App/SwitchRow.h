//
//  SwitchRow.h
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 28/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXSimpleTableAdapter.h"

@interface SwitchRow : PXSimpleTableRow {
    BOOL switchValue;
}

@property (nonatomic, assign) BOOL switchValue;

- (IBAction)switchChanged:(id)sender;

@end
