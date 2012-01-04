//
//  MyStuffViewController.m
//  ROR_Bible
//
//  Created by Christian Isaac on 4/9/11.
//  Copyright 2011 Emerging Technologies & Re-engineering. All rights reserved.
//

#import "MyStuffViewController.h"


@implementation MyStuffViewController


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	/**NSBundle *bundle = [NSBundle mainBundle];
	 NSString *plistPath = [bundle pathForResource:@"Bibleresources" ofType:@"plist"];
	 NSDictionary *dictionary = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
	 self.stateZips = dictionary;
	 [dictionary release];
	 
	 NSArray *components = [self.stateZips allKeys];
	 NSArray *sorted = [components performSelector:@selector(compare:)];
	 self.states = sorted;**/
	
	
	//---add this---
	//---initialize the array---
	myStuffMarksItems = [[NSMutableArray alloc] init];
	[myStuffMarksItems addObject:@"My Notes"];
	[myStuffMarksItems addObject:@"Bookmarks"];
	[myStuffMarksItems addObject:@"Bible Study Planner"];    
	[myStuffMarksItems addObject:@"Help"];
	
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
    return [myStuffMarksItems count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
        cell = [[[UITableViewCell alloc] 
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.textLabel.text = [myStuffMarksItems objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont fontWithName:@"Cambria" size:20];
    if (indexPath.row >= 0)
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
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
    /*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
	 // ...
	 // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	
	
	if (indexPath.row == 0){
		
		MyNotesViewController *myNotesViewController = 
		[[MyNotesViewController alloc] 
		 initWithNibName:@"MyNotesViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:myNotesViewController animated:YES];
		myNotesViewController.navigationItem.title = @"My Notes";
		[myNotesViewController release];
	}
	
	if (indexPath.row == 1){
		
		MyBookmarkViewController *myBookmarkViewController = 
		[[MyBookmarkViewController alloc] 
		 initWithNibName:@"MyBookmarkViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:myBookmarkViewController animated:YES];
		myBookmarkViewController.navigationItem.title = @"My Bookmarks";
		[myBookmarkViewController release];
	}
	
	if (indexPath.row == 2){
		
		BiblePlanner *biblePlanner = 
		[[BiblePlanner alloc] 
		 initWithNibName:@"BiblePlanner" bundle:nil];
		
		[self.navigationController 
		 pushViewController:biblePlanner animated:YES];
		biblePlanner.navigationItem.title = @"Bible Study Planner";
		[biblePlanner release];
	}
	
	if (indexPath.row == 3){
		
		HelpViewController *helpViewController = 
		[[HelpViewController alloc] 
		 initWithNibName:@"HelpViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:helpViewController animated:YES];
		helpViewController.navigationItem.title = @"Help";
		[helpViewController release];
	
	}
	
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
    [super dealloc];
}


@end

