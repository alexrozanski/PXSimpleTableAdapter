//
//  MainViewController.m
//  PXSimpleTableAdapter
//
//  Created by Alex Rozanski on 25/03/2011.
//  Copyright 2011 Alex Rozanski. All rights reserved.
//

#import "MainViewController.h"
#import "PXSimpleTableAdapter.h"

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
    NSArray *firstSectionRows = [[NSArray alloc] initWithObjects:[PXSimpleTableRow rowWithTitle:@"First Row"],
                                 [PXSimpleTableRow rowWithTitle:@"Another Row"],
                                 [PXSimpleTableRow rowWithTitle:@"Other Row"], nil];
    
    PXSimpleTableSection *firstSection = [[PXSimpleTableSection alloc] initWithSectionHeaderTitle:@"Header"
                                                                               sectionFooterTitle:nil
                                                                                             rows:firstSectionRows];
    [firstSectionRows release];
    
    
    //Set up the second section
    NSArray *secondSectionRows = [[NSArray alloc] initWithObjects:[PXSimpleTableRow rowWithTitle:@"A row"],
                                  [PXSimpleTableRow rowWithTitle:@"Another row"],
                                  [PXSimpleTableRow rowWithTitle:@"Other row"], nil];
    
    PXSimpleTableSection *secondSection = [[PXSimpleTableSection alloc] initWithSectionHeaderTitle:@"Another header"
                                                                                sectionFooterTitle:nil
                                                                                              rows:secondSectionRows];
    [secondSectionRows release];
    
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

@end
