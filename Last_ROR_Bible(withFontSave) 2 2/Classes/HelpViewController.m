//
//  HelpViewController.m
//  ROR_Bible
//
//  Created by Christian Isaac on 4/9/11.
//  Copyright 2011 Emerging Technologies & Re-engineering. All rights reserved.
//

#import "HelpViewController.h"


@implementation HelpViewController


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
	
    helpItems = [[NSMutableArray alloc] init];
    [helpItems addObject:@"About e-Rhapsody Bible"];
        //[helpItems addObject:@"Take a Video Tour"];
    [helpItems addObject:@"Release Notes"];
        // [helpItems addObject:@"Contact Us"];
        //[helpItems addObject:@"Other eBooks by the Authors"];
	
   	
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
	self.contentSizeForViewInPopover = CGSizeMake(320.0, 300.0);
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
	return [helpItems count];
	
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
    cell.textLabel.text = [helpItems objectAtIndex:indexPath.row];
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
    if (indexPath.row == 0){
		AboutImageViewController *aboutImageViewController = 
		[[AboutImageViewController alloc] 
		 init];
		
		[self.navigationController 
		 pushViewController:aboutImageViewController animated:YES];
		 aboutImageViewController.navigationItem.title = @"About e-Rhapsody Bible ";
		 [aboutImageViewController release];
		 
		
	}
	
	
	if (indexPath.row == 1){
		ReleaseNoteViewController *releaseNoteViewController = 
		[[ReleaseNoteViewController alloc] 
		 init];
		
		[self.navigationController 
		 pushViewController:releaseNoteViewController animated:YES];
		releaseNoteViewController.navigationItem.title = @"Release Note";
		[releaseNoteViewController release];
		
		
	}
	/*
	if (indexPath.row == 3){
		ROR_BibleAppDelegate *appDelegateForContactUs = 
		[[UIApplication sharedApplication] delegate];
		appDelegateForContactUs.viewController.contactUs = [helpItems objectAtIndex:indexPath.row];
		
	}
	
	
	
	if (indexPath.row == 4){
		ROR_BibleAppDelegate *appDelegateForOtherBooks = 
		[[UIApplication sharedApplication] delegate];
		appDelegateForOtherBooks.viewController.otherBooks = [helpItems objectAtIndex:indexPath.row];
		
	}
	
	if (indexPath.row == 1){
		ROR_BibleAppDelegate *appDelegateForTour = 
		[[UIApplication sharedApplication] delegate];
		appDelegateForTour.viewController.takeTour = [helpItems objectAtIndex:indexPath.row];
		
	}
	
	
	*/
	
	
	
	/**VersesViewController *verseViewController = 
	 [[VersesViewController alloc] 
	 init];//WithNibName:@"VersesViewController" bundle:nil];**/
	
	/**[self.navigationController 
	 pushViewController:verseViewController animated:YES];
	 verseViewController.navigationItem.title = @"Bible Verses";
	 [verseViewController release];
	 [theMain release];**/
	
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
	[helpItems release];
    [super dealloc];
}


@end

