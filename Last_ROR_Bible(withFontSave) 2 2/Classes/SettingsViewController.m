    //
//  SettingsViewController.m
//  ROR_Bible
//
//  Created by Christian Isaac on 5/7/11.
//  Copyright 2011 Emerging Technologies & Re-engineering. All rights reserved.
//

#import "SettingsViewController.h"


@implementation SettingsViewController

@synthesize switch1;  
@synthesize switch2;  
@synthesize switch3, theSlider;

-(IBAction) toggleEnabledForSwitch1: (id) sender{
	
	ROR_BibleAppDelegate *appDelegateforSettings = 
	[[UIApplication sharedApplication] delegate];
	
	if (switch1.on){
		appDelegateforSettings.viewController.checkRotation = @"ON";
		
	}
	else {
		appDelegateforSettings.viewController.checkRotation = @"OFF";
	}
	
}

-(IBAction) toggleEnabledForSwitch2: (id) sender{
	
	ROR_BibleAppDelegate *appDelegateforSettings2 = 
	[[UIApplication sharedApplication] delegate];
	
	if (switch2.on){
		appDelegateforSettings2.viewController.rotationSwitch = @"ON";
		
	}
	else {
		appDelegateforSettings2.viewController.rotationSwitch = @"OFF";
	}
	
}


- (IBAction) toggleEnabledForSlider: (UISlider *) sender{
	
	ROR_BibleAppDelegate *appDelegateforSettings3 = 
	[[UIApplication sharedApplication] delegate];
	
	appDelegateforSettings3.viewController.sliderValue = sender.value;
	
	NSLog(@"value: %f", sender.value);
	
	
}



- (void)viewDidLoad {
	
	//---add this---
	//---initialize the array---
	settingsItems = [[NSMutableArray alloc] init];
	[settingsItems addObject:@"Font Options"];
	[settingsItems addObject:@"Night Mode"];
	[settingsItems addObject:@"Allow Rotation"];
	[settingsItems addObject:@"Check for Updates"];
	
	
	[super viewDidLoad];
	theSlider.value = [[NSUserDefaults standardUserDefaults] integerForKey: @"fontsize"];
	//self.clearsSelectionOnViewWillAppear = NO;
	self.contentSizeForViewInPopover = CGSizeMake(350.0, 400.0);
}

/**- (void)viewDidAppear:(BOOL)animated {
	self.contentSizeForViewInPopover = CGSizeMake(350.0, 300.0);
	[super viewDidAppear:animated];
}**/



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
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
    return [settingsItems count];
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
	cell.textLabel.text = [settingsItems objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont fontWithName:@"Cambria" size:20];
    if (indexPath.row == 0)
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
		
		FontOptionsViewController *fontOptionsViewController = 
		[[FontOptionsViewController alloc] 
		 initWithNibName:@"FontOptionsViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:fontOptionsViewController animated:YES];
		//FontOptionsViewController.navigationItem.rightBarButtonItem = FontOptionsViewController.editButtonItem;
		fontOptionsViewController.navigationItem.title = @"Font Options";
		[fontOptionsViewController release];
	}
	
	/**if (indexPath.row == 1){
		
		AdvancedSearchViewController *advancedSearchViewController = 
		[[AdvancedSearchViewController alloc] 
		 initWithNibName:@"AdvancedSearchViewController" bundle:nil];
		
		[self.navigationController 
		 pushViewController:advancedSearchViewController animated:YES];
		advancedSearchViewController.navigationItem.title = @"Advanced Search";
		[advancedSearchViewController release];
	}**/
	
	
}



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[settingsItems release];
	[switch1 release];
	[switch2 release];
	[switch3 release];
	[theSlider release];
    [super dealloc];
}


@end
