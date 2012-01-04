//
//  BibleConcordanceViewController.m
//  ROR_Bible
//
//  Created by Christian Isaac on 4/8/11.
//  Copyright 2011 Emerging Technologies & Re-engineering. All rights reserved.
//

#import "BibleConcordanceViewController.h"

@implementation BibleConcordanceViewController


#pragma mark -
#pragma mark View lifecycle
/*
 - (id)initWithStyle:(UITableViewStyle)style {
 // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 self = [super initWithStyle:style];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */
#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	
    plannerItems = [[NSMutableArray alloc] init];
    [plannerItems addObject:@"A-Concordance"];
    [plannerItems addObject:@"B-Concordance"];
    [plannerItems addObject:@"C-Concordance"];
	[plannerItems addObject:@"D-Concordance"];
    [plannerItems addObject:@"E-Concordance"];
	[plannerItems addObject:@"F-Concordance"];
	[plannerItems addObject:@"G-Concordance"];
	[plannerItems addObject:@"H-Concordance"];
	[plannerItems addObject:@"I-Concordance"];
	[plannerItems addObject:@"J-Concordance"];
	[plannerItems addObject:@"K-Concordance"];
	[plannerItems addObject:@"L-Concordance"];
	[plannerItems addObject:@"M-Concordance"];
	[plannerItems addObject:@"N-Concordance"];
	[plannerItems addObject:@"O-Concordance"];
	[plannerItems addObject:@"P-Concordance"];
	[plannerItems addObject:@"Q-Concordance"];
	[plannerItems addObject:@"R-Concordance"];
	[plannerItems addObject:@"S-Concordance"];
	[plannerItems addObject:@"T-Concordance"];
	[plannerItems addObject:@"U-Concordance"];
	[plannerItems addObject:@"V-Concordance"];
	[plannerItems addObject:@"W-Concordance"];
	[plannerItems addObject:@"X-Concordance"];
	[plannerItems addObject:@"Y-Concordance"];
	[plannerItems addObject:@"Z-Concordance"];
		
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
	self.contentSizeForViewInPopover = CGSizeMake(300.0, 300.0);
}


/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	return [plannerItems count];
	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = 
	[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] 
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:CellIdentifier] autorelease];
    }
	
    // Configure the cell...
    //---add this---
    cell.textLabel.text = [plannerItems objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont fontWithName:@"Cambria" size:20];
	/**if (indexPath.row >= 0)
	 cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;**/
    
	return cell;
	
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    ROR_BibleAppDelegate *appDelegateForConcordance = 
	[[UIApplication sharedApplication] delegate];
	appDelegateForConcordance.viewController.concordance = [plannerItems objectAtIndex:indexPath.row];
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[plannerItems release];
    [super dealloc];
}


@end

