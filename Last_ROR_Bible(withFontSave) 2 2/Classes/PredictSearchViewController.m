//
//  PredictSearchViewController.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PredictSearchViewController.h"


@implementation PredictSearchViewController
//@synthesize pathToChange;


#pragma mark -
#pragma mark View lifecycle

-(void)updateTable: (NSString *) newValue {
	[predictSearchItems replaceObjectAtIndex:pathToChange withObject:newValue];
	[self.tableView reloadData];
}


- (void)viewDidLoad {
	
    predictSearchItems = [[NSMutableArray alloc] init];
    [predictSearchItems addObject:@"Book"];
    [predictSearchItems addObject:@"Genesis"];
	[predictSearchItems addObject:@"To"];
	[predictSearchItems addObject:@"Revelation"];
	[predictSearchItems addObject:@"Chapter"];
	[predictSearchItems addObject:@"1"];
	[predictSearchItems addObject:@"To"];
	[predictSearchItems addObject:@"4"];
	[predictSearchItems addObject:@"Verse"];
	[predictSearchItems addObject:@"1"];
	[predictSearchItems addObject:@"To"];
	[predictSearchItems addObject:@"2"];
	
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
	self.contentSizeForViewInPopover = CGSizeMake(350.0, 520.0);
}



 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 
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
	return [predictSearchItems count];
	
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
    cell.textLabel.text = [predictSearchItems objectAtIndex:indexPath.row];
	cell.textLabel.textAlignment = UITextAlignmentCenter;
	cell.textLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:20];
	if (indexPath.row == 0 || indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 6 || indexPath.row == 8 || indexPath.row == 10){
		cell.textLabel.textColor = [UIColor redColor];
		cell.textLabel.font = [UIFont boldSystemFontOfSize:20.0];
    }
	return cell;
	
}



 // Override to support conditional editing of the table view.
/** - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
	if (indexPath.row == 1 || indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 7 || indexPath.row == 9 || indexPath.row == 11) {
		return YES;
	}
	 else
    return NO;

 }**/

 // Override to support editing the table view.
/** - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 //[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
	 [predictSearchItems replaceObjectAtIndex:indexPath.row withObject:[predictSearchItems objectAtIndex:indexPath.row]];
	 [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 }**/
 

/**-(UITableViewCellEditingStyle) tableView:(UITableView *)
tableView editingStyleForRowAtIndexPath: (NSIndexPath *) indexPath {
	return UITableViewCellEditingStyleInsert;	
}**/



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
	if (indexPath.row == 1){
	   pathToChange = indexPath.row;
		ChaptersforPredictSearchViewController *chaptersforpredictSearchViewController = 
		[[ChaptersforPredictSearchViewController alloc] 
		 initWithNibName:@"ChaptersforPredictSearchViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:chaptersforpredictSearchViewController animated:YES];
		chaptersforpredictSearchViewController.parentTable = self;
		//predictSearchViewController.navigationItem.rightBarButtonItem = predictSearchViewController.editButtonItem;
		chaptersforpredictSearchViewController.navigationItem.title = @"Select Book";
		[chaptersforpredictSearchViewController release];
	}
	
	if (indexPath.row == 3){
		pathToChange = indexPath.row;
		ChaptersforPredictSearchViewController *chaptersforpredictSearchViewController = 
		[[ChaptersforPredictSearchViewController alloc] 
		 initWithNibName:@"ChaptersforPredictSearchViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:chaptersforpredictSearchViewController animated:YES];
		chaptersforpredictSearchViewController.parentTable = self;
		//predictSearchViewController.navigationItem.rightBarButtonItem = predictSearchViewController.editButtonItem;
		chaptersforpredictSearchViewController.navigationItem.title = @"Select Book";
		[chaptersforpredictSearchViewController release];
	}
	
	if (indexPath.row == 5){
		pathToChange = indexPath.row;
		VersesforPredictSearchViewController *versesforpredictSearchViewController = 
		[[VersesforPredictSearchViewController alloc] 
		 initWithNibName:@"VersesforPredictSearchViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:versesforpredictSearchViewController animated:YES];
		versesforpredictSearchViewController.parentTable = self;
		//predictSearchViewController.navigationItem.rightBarButtonItem = predictSearchViewController.editButtonItem;
		versesforpredictSearchViewController.navigationItem.title = @"Select Chapter";
		[versesforpredictSearchViewController release];
	}
	
	if (indexPath.row == 7){
		pathToChange = indexPath.row;
		VersesforPredictSearchViewController *versesforpredictSearchViewController = 
		[[VersesforPredictSearchViewController alloc] 
		 initWithNibName:@"VersesforPredictSearchViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:versesforpredictSearchViewController animated:YES];
		versesforpredictSearchViewController.parentTable = self;
		//predictSearchViewController.navigationItem.rightBarButtonItem = predictSearchViewController.editButtonItem;
		versesforpredictSearchViewController.navigationItem.title = @"Select Chapter";
		[versesforpredictSearchViewController release];
	}
	
	
	
	if (indexPath.row == 9){
		pathToChange = indexPath.row;
		VersesforPredictSearchViewController *versesforpredictSearchViewController = 
		[[VersesforPredictSearchViewController alloc] 
		 initWithNibName:@"VersesforPredictSearchViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:versesforpredictSearchViewController animated:YES];
		versesforpredictSearchViewController.parentTable = self;
		//predictSearchViewController.navigationItem.rightBarButtonItem = predictSearchViewController.editButtonItem;
		versesforpredictSearchViewController.navigationItem.title = @"Select Verse";
		[versesforpredictSearchViewController release];
	}
	
	if (indexPath.row == 11){
		pathToChange = indexPath.row;
		VersesforPredictSearchViewController *versesforpredictSearchViewController = 
		[[VersesforPredictSearchViewController alloc] 
		 initWithNibName:@"VersesforPredictSearchViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:versesforpredictSearchViewController animated:YES];
		versesforpredictSearchViewController.parentTable = self;
		//predictSearchViewController.navigationItem.rightBarButtonItem = predictSearchViewController.editButtonItem;
		versesforpredictSearchViewController.navigationItem.title = @"Select Chapter";
		[versesforpredictSearchViewController release];
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
	[predictSearchItems release];
    [super dealloc];
}


@end

