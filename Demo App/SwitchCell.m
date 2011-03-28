//
//  SwitchCell.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 28/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "SwitchCell.h"


@implementation SwitchCell

@synthesize toggleSwitch, titleLabel;

- (void)dealloc
{
    [toggleSwitch release], toggleSwitch=nil;
    
    [super dealloc];
}

@end
