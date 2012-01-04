//
//  AdvancedSearchViewController.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AdvancedSearchViewController.h"


@implementation AdvancedSearchViewController
@synthesize lastIndexPath, advancedSearchItems;

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
	
    advancedSearchItems = [[NSMutableArray alloc] init];
    [advancedSearchItems addObject:@"The Entire Bible"];
    [advancedSearchItems addObject:@"The Old Testament"];
	[advancedSearchItems addObject:@"The New Testament"];
	[advancedSearchItems addObject:@"Bible Concordance"];
	[advancedSearchItems addObject:@"Inspirational Articles"];
	[advancedSearchItems addObject:@"My Notes"];
	
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
	self.contentSizeForViewInPopover = CGSizeMake(350.0, 300.0);
}



 - (void)viewWillAppear:(BOOL)animated {
	 self.contentSizeForViewInPopover = CGSizeMake(350.0, 300.0);
 [super viewWillAppear:animated];
 }
 

/** - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
	 self.contentSizeForViewInPopover = CGSizeMake(350.0, 300.0);
 }**/
 
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
	return [advancedSearchItems count];
	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell  = 
	[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] 
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:CellIdentifier] autorelease];
    }
	
    // Configure the cell...
    //---add this---
	//NSUInteger row = [indexPath row]; 
	//NSUInteger oldRow = [lastIndexPath row];
	UIImage *image = [UIImage imageNamed:@"unckecked.jpg"]; 
	cell.imageView.image = image;
    cell.textLabel.text = [advancedSearchItems objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:20];
	/**if (indexPath.row >= 0){
	 //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}**/
    //cell.accessoryType = (row == oldRow && lastIndexPath != nil) ? 
	//UITableViewCellAccessoryCheckmark: UITableViewCellAccessoryNone;
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
	
	UIImage *image = [UIImage imageNamed:@"unckecked.jpg"];
	UIImage *image2 = [UIImage imageNamed:@"checked.jpg"];
    // Navigation logic may go here. Create and push another view controller.
	
 int newRow = [indexPath row]; 
int oldRow = (lastIndexPath != nil) ? [lastIndexPath row] : -1;
	int check = 0;

	if (newRow != oldRow) { UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
		//newCell.accessoryType =UITableViewCellAccessoryCheckmark;
		newCell.imageView.image = image2; 
		UITableViewCell *oldCell = [tableView cellForRowAtIndexPath: lastIndexPath];
		oldCell.accessoryType = UITableViewCellAccessoryNone; 
		lastIndexPath = indexPath;
		//oldCell.imageView.image = image;
	}
	
	if (newRow == oldRow) { UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
		if (check == 0) {
			newCell.imageView.image = image;
			 check = 2;
		}
		else
	     if (check == 2) {
			newCell.imageView.image = image2;
		    check = 0;
	}

		
		
	}
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	self. advancedSearchItems = nil;
	self.lastIndexPath = nil;
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[lastIndexPath release];
	[advancedSearchItems release];
    [super dealloc];
}


@end

