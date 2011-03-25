//
//  PXSimpleTableRow.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "PXSimpleTableRow.h"


@implementation PXSimpleTableRow

@synthesize title = _title;
@synthesize icon = _icon;
@synthesize viewController = _viewController;

+ (id)rowWithTitle:(NSString*)title
{
    return [self rowWithTitle:title icon:nil viewController:nil];
}

+ (id)rowWithTitle:(NSString*)title icon:(UIImage*)icon
{
    return [self rowWithTitle:title icon:icon viewController:nil];
}

+ (id)rowWithTitle:(NSString *)title icon:(UIImage*)icon viewController:(UIViewController*)controller
{
    return [[[self alloc] initWithTitle:title icon:icon viewController:controller] autorelease];
}

#pragma mark - Init/Dealloc

- (id)initWithTitle:(NSString*)title
{
    return [self initWithTitle:title icon:nil viewController:nil];
}

- (id)initWithTitle:(NSString*)title icon:(UIImage*)icon
{
    return [self initWithTitle:title icon:icon viewController:nil];
}

- (id)initWithTitle:(NSString*)title icon:(UIImage*)icon viewController:(UIViewController*)controller
{
    if((self = [super init])) {
        _title = [title copy];
        _icon = [icon retain];
        _viewController = [controller retain];
    }
    
    return self;
}

- (void)dealloc
{
    [_title release], _title=nil;
    [_icon release], _icon=nil;
    [_viewController release], _viewController=nil;
    
    [super dealloc];
}

@end
