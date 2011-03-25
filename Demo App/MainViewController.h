//
//  MainViewController.h
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PXSimpleTableAdapter.h"

@class OtherViewController;


@interface MainViewController : UIViewController <PXSimpleTableAdapterDelegate> {
    PXSimpleTableAdapter *tableAdapter;
    OtherViewController *_otherViewController;
}

@property (nonatomic, retain) IBOutlet PXSimpleTableAdapter *tableAdapter;
@property (nonatomic, readonly) OtherViewController *otherViewController;

@end
