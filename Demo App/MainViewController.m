//
//  MainViewController.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "MainViewController.h"

#import "PXSimpleTableAdapter.h"
#import "OtherViewController.h"

@implementation MainViewController

@synthesize tableAdapter;

#pragma mark - Init/Dealloc

- (void)dealloc 
{
    [tableAdapter release], tableAdapter=nil;
    
    [super dealloc];
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Set up the first section
    PXSimpleTableRow *firstRow = [PXSimpleTableRow rowWithTitle:@"First Row"];
    firstRow.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    PXSimpleTableRow *secondRow = [PXSimpleTableRow rowWithTitle:@"Another Row"];
    secondRow.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    PXSimpleTableRow *thirdRow = [PXSimpleTableRow rowWithTitle:@"Other Row"];
    
    PXSimpleTableSection *firstSection = [[PXSimpleTableSection alloc] initWithSectionHeaderTitle:@"Header"
                                                                               sectionFooterTitle:nil
                                                                                             rows:[NSArray arrayWithObjects:firstRow, secondRow, thirdRow, nil]];
    
    
    //Set up the second section
    PXSimpleTableRow *fourthRow = [PXSimpleTableRow rowWithTitle:@"A Row"];
    PXSimpleTableRow *fifthRow = [PXSimpleTableRow rowWithTitle:@"Another Row"];
    fifthRow.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    PXSimpleTableRow *sixthRow = [PXSimpleTableRow rowWithTitle:@"Other Row"];
    sixthRow.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    PXSimpleTableSection *secondSection = [[PXSimpleTableSection alloc] initWithSectionHeaderTitle:@"Another header"
                                                                                sectionFooterTitle:nil
                                                                                              rows:[NSArray arrayWithObjects:fourthRow, fifthRow, sixthRow, nil]];
    
    //Set the table sections
    NSArray *sections = [[NSArray alloc] initWithObjects:firstSection, secondSection, nil];
    self.tableAdapter.sections = sections;
    
    [sections release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    self.tableAdapter = nil;
}

#pragma mark - View Controllers

- (OtherViewController*)otherViewController
{
    if(!_otherViewController) {
        _otherViewController = [[OtherViewController alloc] initWithNibName:@"OtherView" bundle:nil];
    }
    
    return _otherViewController;
}

#pragma mark - Table Adapter

- (void)simpleTableAdapter:(PXSimpleTableAdapter*)adapter didSelectRow:(PXSimpleTableRow*)row
{
    if(row.accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        self.otherViewController.navigationItem.title = row.title;
        
        [self.navigationController pushViewController:self.otherViewController animated:YES];
        [adapter deselectRow:row];
    }
}

@end
