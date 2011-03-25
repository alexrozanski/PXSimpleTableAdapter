//
//  PXSimpleTableSection.h
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PXSimpleTableSection : NSObject {
    NSMutableArray *_rows;
}

@property (nonatomic, retain) NSArray *rows;

@end
