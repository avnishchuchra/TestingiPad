//
//  ChaptersforPredictSearchViewController.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 5/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChaptersforPredictSearchViewController.h"
#import "PredictSearchViewController.h"


@implementation ChaptersforPredictSearchViewController
@synthesize parentTable;

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
    bookMarksItems = [[NSMutableArray alloc] init];
    [bookMarksItems addObject:@"Genesis"];
    [bookMarksItems addObject:@"Exodus"];
    [bookMarksItems addObject:@"Leviticus"];
    [bookMarksItems addObject:@"Numbers"];    
    [bookMarksItems addObject:@"Deuteronomy"];
    [bookMarksItems addObject:@"Joshua"];
    [bookMarksItems addObject:@"Judges"];
	[bookMarksItems addObject:@"Ruth"];
	[bookMarksItems addObject:@"1 Samuel"];
	[bookMarksItems addObject:@"2 Samuel"];
	[bookMarksItems addObject:@"1 Kings"];
	[bookMarksItems addObject:@"2 Kings"];
	[bookMarksItems addObject:@"1 Chronicles"];
	[bookMarksItems addObject:@"2 Chronicles"];
	[bookMarksItems addObject:@"Ezra"];
	[bookMarksItems addObject:@"Nehemiah"];
	[bookMarksItems addObject:@"Esther"];
	[bookMarksItems addObject:@"Job"];
	[bookMarksItems addObject:@"Psalm"];
	[bookMarksItems addObject:@"Proverbs"];
	[bookMarksItems addObject:@"Ecclesiastes"];
	[bookMarksItems addObject:@"Song of Solomon"];
	[bookMarksItems addObject:@"Isaiah"];
	[bookMarksItems addObject:@"Jeremiah"];
	[bookMarksItems addObject:@"Lamentations"];
	[bookMarksItems addObject:@"Ezekiel"];
	[bookMarksItems addObject:@"Daniel"];
	[bookMarksItems addObject:@"Hosea"];
	[bookMarksItems addObject:@"Joel"];
	[bookMarksItems addObject:@"Amos"];
	[bookMarksItems addObject:@"Obadiah"];
	[bookMarksItems addObject:@"Jonah"];
	[bookMarksItems addObject:@"Micah"];
	[bookMarksItems addObject:@"Nahum"];
	[bookMarksItems addObject:@"Habakkuk"];
	[bookMarksItems addObject:@"Zephaniah"];
	[bookMarksItems addObject:@"Haggai"];
	[bookMarksItems addObject:@"Zechariah"];
	[bookMarksItems addObject:@"Malachi"];
	[bookMarksItems addObject:@"Matthew"];
	[bookMarksItems addObject:@"Mark"];
	[bookMarksItems addObject:@"Luke"];
	[bookMarksItems addObject:@"John"];
	[bookMarksItems addObject:@"Acts"];
	[bookMarksItems addObject:@"Romans"];
	[bookMarksItems addObject:@"1 Corinthians"];
	[bookMarksItems addObject:@"2 Corinthians"];
	[bookMarksItems addObject:@"Galatians"];
	[bookMarksItems addObject:@"Ephesians"];
	[bookMarksItems addObject:@"Philippians"];
	[bookMarksItems addObject:@"Colossians"];
	[bookMarksItems addObject:@"1 Thessalonians"];
	[bookMarksItems addObject:@"2 Thessalonians"];
	[bookMarksItems addObject:@"1 Timothy"];
	[bookMarksItems addObject:@"2 Timothy"];
	[bookMarksItems addObject:@"Titus"];
	[bookMarksItems addObject:@"Philemon"];
	[bookMarksItems addObject:@"Hebrews"];
	[bookMarksItems addObject:@"James"];
	[bookMarksItems addObject:@"1 Peter"];
	[bookMarksItems addObject:@"2 Peter"];
	[bookMarksItems addObject:@"1 John"];
	[bookMarksItems addObject:@"2 John"];
	[bookMarksItems addObject:@"3 John"];
	[bookMarksItems addObject:@"Jude"];
	[bookMarksItems addObject:@"Revelation"];
	
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
    return [bookMarksItems count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"BibleBooksCell";
	
    UITableViewCell *cell = 
	[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] 
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:CellIdentifier] autorelease];
    }
	
    // Configure the cell...
    //---add this---
    cell.textLabel.text = [bookMarksItems objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont fontWithName:@"Trebuchet MS" size:20];
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
	[parentTable updateTable:[bookMarksItems objectAtIndex:indexPath.row]];
	[self.navigationController popViewControllerAnimated:YES];

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
	[bookMarksItems release];
    [super dealloc];
}


@end

