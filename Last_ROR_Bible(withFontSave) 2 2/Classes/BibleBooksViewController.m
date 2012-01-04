//
//  BibleBooksViewController.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "BibleBooksViewController.h"


@implementation BibleBooksViewController
@synthesize chapWord; //theWord;
@synthesize rotate;
//@synthesize  stateZips, states;

#pragma mark -
#pragma mark Initialization

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
//    [bookMarksItems addObject:@"Genesis"];
//    [bookMarksItems addObject:@"Exodus"];
//    [bookMarksItems addObject:@"Leviticus"];
//    [bookMarksItems addObject:@"Numbers"];    
//    [bookMarksItems addObject:@"Deuteronomy"];
//    [bookMarksItems addObject:@"Joshua"];
//    [bookMarksItems addObject:@"Judges"];
//	[bookMarksItems addObject:@"Ruth"];
//	[bookMarksItems addObject:@"1 Samuel"];
//	[bookMarksItems addObject:@"2 Samuel"];
//	[bookMarksItems addObject:@"1 Kings"];
//	[bookMarksItems addObject:@"2 Kings"];
//	[bookMarksItems addObject:@"1 Chronicles"];
//	[bookMarksItems addObject:@"2 Chronicles"];
//	[bookMarksItems addObject:@"Ezra"];
//	[bookMarksItems addObject:@"Nehemiah"];
//	[bookMarksItems addObject:@"Esther"];
//	[bookMarksItems addObject:@"Job"];
//	[bookMarksItems addObject:@"Psalm"];
//	[bookMarksItems addObject:@"Proverbs"];
//	[bookMarksItems addObject:@"Ecclesiastes"];
//	[bookMarksItems addObject:@"Song of Solomon"];
//	[bookMarksItems addObject:@"Isaiah"];
//	[bookMarksItems addObject:@"Jeremiah"];
//	[bookMarksItems addObject:@"Lamentations"];
//	[bookMarksItems addObject:@"Ezekiel"];
//	[bookMarksItems addObject:@"Daniel"];
//	[bookMarksItems addObject:@"Hosea"];
//	[bookMarksItems addObject:@"Joel"];
//	[bookMarksItems addObject:@"Amos"];
//	[bookMarksItems addObject:@"Obadiah"];
//	[bookMarksItems addObject:@"Jonah"];
//	[bookMarksItems addObject:@"Micah"];
//	[bookMarksItems addObject:@"Nahum"];
//	[bookMarksItems addObject:@"Habakkuk"];
//	[bookMarksItems addObject:@"Zephaniah"];
//	[bookMarksItems addObject:@"Haggai"];
//	[bookMarksItems addObject:@"Zechariah"];
//	[bookMarksItems addObject:@"Malachi"];
//	[bookMarksItems addObject:@"Matthew"];
//	[bookMarksItems addObject:@"Mark"];
//	[bookMarksItems addObject:@"Luke"];
//	[bookMarksItems addObject:@"John"];
//	[bookMarksItems addObject:@"Acts"];
//	[bookMarksItems addObject:@"Romans"];
//	[bookMarksItems addObject:@"1 Corinthians"];
//	[bookMarksItems addObject:@"2 Corinthians"];
//	[bookMarksItems addObject:@"Galatians"];
//	[bookMarksItems addObject:@"Ephesians"];
//	[bookMarksItems addObject:@"Philippians"];
//	[bookMarksItems addObject:@"Colossians"];
//	[bookMarksItems addObject:@"1 Thessalonians"];
//	[bookMarksItems addObject:@"2 Thessalonians"];
//	[bookMarksItems addObject:@"1 Timothy"];
//	[bookMarksItems addObject:@"2 Timothy"];
//	[bookMarksItems addObject:@"Titus"];
//	[bookMarksItems addObject:@"Philemon"];
//	[bookMarksItems addObject:@"Hebrews"];
//	[bookMarksItems addObject:@"James"];
//	[bookMarksItems addObject:@"1 Peter"];
//	[bookMarksItems addObject:@"2 Peter"];
//	[bookMarksItems addObject:@"1 John"];
//	[bookMarksItems addObject:@"2 John"];
//	[bookMarksItems addObject:@"3 John"];
//	[bookMarksItems addObject:@"Jude"];
//	[bookMarksItems addObject:@"Revelation"];
	
    
    bookMarksItems=[[NSMutableArray alloc] initWithArray:[[NSArray alloc] initWithObjects:@"Genesis",@"Exodus",@"Leviticus",@"Numbers",@"Deuteronomy",@"Joshua",@"Judges",@"Ruth",@"1 Samuel",@"2 Samuel",@"1 Kings",@"2 Kings",@"1 Chronicles",@"2 Chronicles",@"Ezra",@"Nehemiah",@"Esth",@"Job",@"Psalm",@"Proverbs",@"Ecclesiastes",@"Song of Solomon",@"Isaiah",@"Jeremiah",@"Lamentations",@"Ezekiel",@"Daniel",@"Hosea",@"Joel",@"Amos",@"Obadiah",@"Jonah",@"Micah",@"Nahum",@"Habakkuk",@"Zephaniah",@"Haggai",@"Zechariah",@"Malachi",@"Matthew",@"Mark",@"Luke",@"John",@"Acts",@"Romans",@"1 Corinthians",@"2 Corinthians",@"Galatians",@"Ephesians",@"Philippians",@"Colossians",@"1 Thessalonians",@"2 Thessalonians",@"1 Timothy",@"2 Timothy",@"Titus",@"Philemon",@"Hebrews",@"James",@"1 Peter",@"2 Peter",@"1 John",@"2 John",@"3 John",@"Jude",@"Revelation" ,nil]];
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
	self.contentSizeForViewInPopover = CGSizeMake(400, 400);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLandscape) name:@"rotateL" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changePortrait) name:@"rotateP" object:nil];
}
-(void)changeLandscape{
    rotate = YES;
    [[self tableView] reloadData];
}
-(void)changePortrait{
    rotate = NO;
    [[self tableView] reloadData];
}
/*
 - (void)viewDidLoad {
 [super viewDidLoad];
 
 // Uncomment the following line to preserve selection between presentations.
 // self.clearsSelectionOnViewWillAppear = NO;
 
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem;
 }
 */

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
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (rotate) {
        if (section == 0)
            return 7;
        
        return 5;
    }else{
        if (section == 0)
            return 10;
        
        return 7;
    }	
}

//39 27

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (rotate) {
        int index = indexPath.row * 6;
        if (indexPath.section == 1)
            index += 39;
        
        NSString *title;
        int i;
        
        static NSString *CellIdentifier = @"BibleBooksCell";
        
        UITableViewCell *cell = 
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] 
                     initWithStyle:UITableViewCellStyleDefault 
                     reuseIdentifier:CellIdentifier] autorelease];
        }
        
        NSArray *subviews = cell.contentView.subviews;
        for (UIView *subview in subviews) {
            if ([subview isKindOfClass:[UIButton class]] && subview.frame.size.width > 99 && subview.frame.size.width < 101)
                [subview removeFromSuperview];
        }
        
        // Configure the cell...
        //---add this---
        cell.textLabel.text = [bookMarksItems objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Cambria" size:20];
        
        btnBooks=[UIButton buttonWithType:UIButtonTypeCustom];
        btnBooks.frame=CGRectMake(0, 0, 100, 35);
        [btnBooks setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
        [btnBooks addTarget:self action:@selector(btnBooksAction:) forControlEvents:UIControlEventTouchUpInside];
        [btnBooks.titleLabel adjustsFontSizeToFitWidth];
        i = 3;
        while (TRUE) {
            title = [[bookMarksItems objectAtIndex:index] substringToIndex:i];
            
            if ([title stringByReplacingOccurrencesOfString:@" " withString:@""].length < 3) {
                i ++;
            }
            else {
                break;
            }			
        }
        [btnBooks setTitle:title forState:UIControlStateNormal];
        
        btnBooks.tag=index;
        [cell.contentView addSubview:btnBooks];
        index ++;
        
        btnBooks1=[UIButton buttonWithType:UIButtonTypeCustom];
        btnBooks1.frame=CGRectMake(101, 0, 100, 35);
        [btnBooks1 setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
        [btnBooks1 addTarget:self action:@selector(btnBooksAction:) forControlEvents:UIControlEventTouchUpInside];
        [btnBooks1.titleLabel adjustsFontSizeToFitWidth];
        i = 3;
        while (TRUE) {
            title = [[bookMarksItems objectAtIndex:index] substringToIndex:i];
            
            if ([title stringByReplacingOccurrencesOfString:@" " withString:@""].length < 3) {
                i ++;
            }
            else {
                break;
            }			
        }
        [btnBooks1 setTitle:title forState:UIControlStateNormal];
        
        btnBooks1.tag=index;
        [cell.contentView addSubview:btnBooks1];
        index ++;
        
        if ((indexPath.section == 0 && index < 39) || 
            (indexPath.section == 1 && index < 66)) {
            btnBooks2=[UIButton buttonWithType:UIButtonTypeCustom];
            btnBooks2.frame=CGRectMake(202, 0, 100, 35);
            [btnBooks2 setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
            [btnBooks2 addTarget:self action:@selector(btnBooksAction:) forControlEvents:UIControlEventTouchUpInside];
            [btnBooks2.titleLabel adjustsFontSizeToFitWidth];
            i = 3;
            while (TRUE) {
                title = [[bookMarksItems objectAtIndex:index] substringToIndex:i];
                
                if ([title stringByReplacingOccurrencesOfString:@" " withString:@""].length < 3) {
                    i ++;
                }
                else {
                    break;
                }			
            }
            [btnBooks2 setTitle:title forState:UIControlStateNormal];
            
            btnBooks2.tag=index;
            [cell.contentView addSubview:btnBooks2];
        }
        index ++;

        if ((indexPath.section == 0 && index < 39) || 
            (indexPath.section == 1 && index < 65)) {
            btnBooks3=[UIButton buttonWithType:UIButtonTypeCustom];
            btnBooks3.frame=CGRectMake(303, 0, 100, 35);
            [btnBooks3 setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
            [btnBooks3 addTarget:self action:@selector(btnBooksAction:) forControlEvents:UIControlEventTouchUpInside];
            [btnBooks3.titleLabel adjustsFontSizeToFitWidth];
            i = 3;
            while (TRUE) {
                title = [[bookMarksItems objectAtIndex:index] substringToIndex:i];
                
                if ([title stringByReplacingOccurrencesOfString:@" " withString:@""].length < 3) {
                    i ++;
                }
                else {
                    break;
                }			
            }
            [btnBooks3 setTitle:title forState:UIControlStateNormal];
            
            btnBooks3.tag=index;
            [cell.contentView addSubview:btnBooks3];
        }
        index ++;

        if ((indexPath.section == 0 && index < 39) || 
            (indexPath.section == 1 && index < 65)) {
            btnBooks4=[UIButton buttonWithType:UIButtonTypeCustom];
            btnBooks4.frame=CGRectMake(404, 0, 100, 35);
            [btnBooks4 setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
            [btnBooks4 addTarget:self action:@selector(btnBooksAction:) forControlEvents:UIControlEventTouchUpInside];
            [btnBooks4.titleLabel adjustsFontSizeToFitWidth];
            i = 3;
            while (TRUE) {
                title = [[bookMarksItems objectAtIndex:index] substringToIndex:i];
                
                if ([title stringByReplacingOccurrencesOfString:@" " withString:@""].length < 3) {
                    i ++;
                }
                else {
                    break;
                }			
            }
            [btnBooks4 setTitle:title forState:UIControlStateNormal];
            
            btnBooks4.tag=index;
            [cell.contentView addSubview:btnBooks4];
        }
        index ++;

        if ((indexPath.section == 0 && index < 39) || 
            (indexPath.section == 1 && index < 65)) {
            btnBooks5=[UIButton buttonWithType:UIButtonTypeCustom];
            btnBooks5.frame=CGRectMake(505, 0, 100, 35);
            [btnBooks5 setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
            [btnBooks5 addTarget:self action:@selector(btnBooksAction:) forControlEvents:UIControlEventTouchUpInside];
            [btnBooks5.titleLabel adjustsFontSizeToFitWidth];
            i = 3;
            while (TRUE) {
                title = [[bookMarksItems objectAtIndex:index] substringToIndex:i];
                
                if ([title stringByReplacingOccurrencesOfString:@" " withString:@""].length < 3) {
                    i ++;
                }
                else {
                    break;
                }			
            }
            [btnBooks5 setTitle:title forState:UIControlStateNormal];
            
            btnBooks5.tag=index;
            [cell.contentView addSubview:btnBooks5];
        }

               
        
//        [cell.contentView addSubview:btnBooks];
//        [cell.contentView addSubview:btnBooks1];
//        [cell.contentView addSubview:btnBooks2];
//        if ((indexPath.section == 0 && index < 39) || 
//            (indexPath.section == 1 && index < 65)) {
//            [cell.contentView addSubview:btnBooks3];
//        }
        return cell;
    }else{
        int index = indexPath.row * 4;
        if (indexPath.section == 1)
            index += 39;
        
        NSString *title;
        int i;
        
        static NSString *CellIdentifier = @"BibleBooksCell";
        btnBooks=[UIButton buttonWithType:UIButtonTypeCustom];
        btnBooks.frame=CGRectMake(0, 0, 100, 35);
        [btnBooks setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
        [btnBooks addTarget:self action:@selector(btnBooksAction:) forControlEvents:UIControlEventTouchUpInside];
        [btnBooks.titleLabel adjustsFontSizeToFitWidth];
        i = 3;
        while (TRUE) {
            title = [[bookMarksItems objectAtIndex:index] substringToIndex:i];
            
            if ([title stringByReplacingOccurrencesOfString:@" " withString:@""].length < 3) {
                i ++;
            }
            else {
                break;
            }			
        }
        [btnBooks setTitle:title forState:UIControlStateNormal];
        
        btnBooks.tag=index;
        index ++;
        
        btnBooks1=[UIButton buttonWithType:UIButtonTypeCustom];
        btnBooks1.frame=CGRectMake(101, 0, 100, 35);
        [btnBooks1 setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
        [btnBooks1 addTarget:self action:@selector(btnBooksAction:) forControlEvents:UIControlEventTouchUpInside];
        [btnBooks1.titleLabel adjustsFontSizeToFitWidth];
        i = 3;
        while (TRUE) {
            title = [[bookMarksItems objectAtIndex:index] substringToIndex:i];
            
            if ([title stringByReplacingOccurrencesOfString:@" " withString:@""].length < 3) {
                i ++;
            }
            else {
                break;
            }			
        }
        [btnBooks1 setTitle:title forState:UIControlStateNormal];
        
        btnBooks1.tag=index;
        index ++;
        
        btnBooks2=[UIButton buttonWithType:UIButtonTypeCustom];
        btnBooks2.frame=CGRectMake(202, 0, 100, 35);
        [btnBooks2 setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
        [btnBooks2 addTarget:self action:@selector(btnBooksAction:) forControlEvents:UIControlEventTouchUpInside];
        [btnBooks2.titleLabel adjustsFontSizeToFitWidth];
        i = 3;
        while (TRUE) {
            title = [[bookMarksItems objectAtIndex:index] substringToIndex:i];
            
            if ([title stringByReplacingOccurrencesOfString:@" " withString:@""].length < 3) {
                i ++;
            }
            else {
                break;
            }			
        }
        [btnBooks2 setTitle:title forState:UIControlStateNormal];
        
        btnBooks2.tag=index;
        index ++;
        
        if ((indexPath.section == 0 && index < 39) || 
            (indexPath.section == 1 && index < 65)) {
            btnBooks3=[UIButton buttonWithType:UIButtonTypeCustom];
            btnBooks3.frame=CGRectMake(303, 0, 100, 35);
            [btnBooks3 setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
            [btnBooks3 addTarget:self action:@selector(btnBooksAction:) forControlEvents:UIControlEventTouchUpInside];
            [btnBooks3.titleLabel adjustsFontSizeToFitWidth];
            i = 3;
            while (TRUE) {
                title = [[bookMarksItems objectAtIndex:index] substringToIndex:i];
                
                if ([title stringByReplacingOccurrencesOfString:@" " withString:@""].length < 3) {
                    i ++;
                }
                else {
                    break;
                }			
            }
            [btnBooks3 setTitle:title forState:UIControlStateNormal];
            
            btnBooks3.tag=index;
        }
        
        UITableViewCell *cell = 
        [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] 
                     initWithStyle:UITableViewCellStyleDefault 
                     reuseIdentifier:CellIdentifier] autorelease];
        }
        
        NSArray *subviews = cell.contentView.subviews;
        for (UIView *subview in subviews) {
            if ([subview isKindOfClass:[UIButton class]] && subview.frame.size.width > 99 && subview.frame.size.width < 101)
                [subview removeFromSuperview];
        }
        
        // Configure the cell...
        //---add this---
        cell.textLabel.text = [bookMarksItems objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Cambria" size:20];
        [cell.contentView addSubview:btnBooks];
        [cell.contentView addSubview:btnBooks1];
        [cell.contentView addSubview:btnBooks2];
        if ((indexPath.section == 0 && index < 39) || 
            (indexPath.section == 1 && index < 65)) {
            [cell.contentView addSubview:btnBooks3];
        }
        return cell;
    }
	
	
}
- (void) btnBooksAction:(id)sender {
    
    btn=(UIButton *)sender;
    ROR_BibleAppDelegate *appDelegate = 
	[[UIApplication sharedApplication] delegate];
    appDelegate.viewController.detailItem =[bookMarksItems objectAtIndex:[sender tag]];
	
	//appDelegate.ReferencesViewController.detailItem2 = [bookMarksItems objectAtIndex:indexPath.row];
	NSLog(@"%d",[sender tag]);
	ChaptersViewController *chapterViewController = 
	[[ChaptersViewController alloc] 
	 initWithNibName:@"ChaptersViewController" bundle:nil];
	chapterViewController.word = [bookMarksItems objectAtIndex:[sender tag]];
	[self.navigationController 
	 pushViewController:chapterViewController animated:YES];
	chapterViewController.navigationItem.title = chapterViewController.word;
	[chapterViewController release];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0)
		return @"Old Testament";
	
	return @"New Testament";
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
	//---add this---
    //switch (indexPath.row) { 
	//case 0: {
	ROR_BibleAppDelegate *appDelegate = 
	[[UIApplication sharedApplication] delegate];
	
	appDelegate.viewController.detailItem = 
	[bookMarksItems objectAtIndex:indexPath.row];
	
	//appDelegate.ReferencesViewController.detailItem2 = [bookMarksItems objectAtIndex:indexPath.row];
	
	ChaptersViewController *chapterViewController = 
	[[ChaptersViewController alloc] 
	 initWithNibName:@"ChaptersViewController" bundle:nil];
	chapterViewController.word = [bookMarksItems objectAtIndex:indexPath.row];
	[self.navigationController 
	 pushViewController:chapterViewController animated:YES];
	chapterViewController.navigationItem.title = chapterViewController.word;
	[chapterViewController release];
	
	// break;
	//}
	//case 1:
	//break;
	//}
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
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[bookMarksItems release];
    [super dealloc];
}


@end

