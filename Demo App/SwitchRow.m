//
//  SwitchRow.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 28/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "SwitchRow.h"
#import "SwitchCell.h"

@implementation SwitchRow

@synthesize switchValue;

#pragma mark - PXSimpleTableRow

+ (NSString*)cellIdentifier
{
    return @"SwitchCell";
}

+ (UITableViewCell*)newCellForRow
{
    UINib *nib = [UINib nibWithNibName:@"SwitchCell" bundle:nil];
    
    NSArray *contents = [nib instantiateWithOwner:nil options:nil];
    SwitchCell *cell = nil;
    
    //Find the cell from the objects in the NIB file
    for(id object in contents) {
        if([object isKindOfClass:[SwitchCell class]]) {
            cell = object;
            break;
        }
    }
    
    //Since our method starts with "new", return a retained object – conforms to the Cocoa Memory Management Guidelines
    return [cell retain];
}

- (void)setUpContentsOfCell:(UITableViewCell *)cell
{
    [[(SwitchCell*)cell toggleSwitch] addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    
    [(SwitchCell*)cell titleLabel].text = self.title;
    [(SwitchCell*)cell toggleSwitch].on = self.switchValue;
}

- (IBAction)switchChanged:(id)sender
{
    self.switchValue = [(UISwitch*)sender isOn];
}

@end
