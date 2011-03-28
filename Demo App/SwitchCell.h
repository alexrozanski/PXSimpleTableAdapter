//
//  SwitchCell.h
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 28/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SwitchCell : UITableViewCell {
    UISwitch *toggleSwitch;
    UILabel *titleLabel;
}

@property (nonatomic, retain) IBOutlet UISwitch *toggleSwitch;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;

@end
