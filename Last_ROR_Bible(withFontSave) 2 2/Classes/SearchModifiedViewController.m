//
//  SearchModifiedViewController.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchModifiedViewController.h"


@implementation SearchModifiedViewController

@synthesize search;
@synthesize searchConditionTable;

- (void)viewDidLoad {
    
    booksOfTheBible = [[NSArray alloc] initWithObjects:@"Genesis", @"Exodus", @"Leviticus", @"Numbers", @"Deuteronomy", @"Joshua", @"Judges",
                          @"Ruth", @"1 Samuel", @"2 Samuel", @"1 Kings", @"2 kings", @"1 Chronicles", @"2 Chronicles",
                          @"Ezra", @"Nehemiah", @"Esther", @"Job", @"Psalm", @"Proverbs", @"Ecclesiastes", @"Song of Solomon", 
                          @"Isaiah", @"Jerremiah", @"Lamentations", @"Ezekiel", @"Daniel", @"Hosea", @"Joel", @"Amos", @"Obadiah", 
                          @"Jonah", @"Micah", @"Nahum", @"Habakkuk", @"Zephaniah", @"Haggai", @"Zechariah", @"Malachi", 
                          @"Matthew", @"Mark", @"Luke", @"John", @"Acts", @"Romans", @"1 Corinthians", @"2 Corinthians", @"Galatians", @"Ephesians", 
                          @"Philippians", @"Colossians", @"1 Thessalonians", @"2 Thessalonians", @"1 Timothy", @"2 Timothy", @"Titus", @"Philemon", 
                          @"Hebrews", @"James", @"1 Peter", @"2 Peter", @"1 John", @"2 John", @"3 John", @"Jude", @"Revelation", nil];
       //---add this---
    //---initialize the array---
    searchItems = [[NSMutableArray alloc] init];
    [searchItems addObject:@"Predict Search"];
   [searchItems addObject:@"Advanced Search"];
   [searchItems addObject:@"Search Results"];
   
   [super viewDidLoad];
    //    self.clearsSelectionOnViewWillAppear = NO;
   self.contentSizeForViewInPopover = CGSizeMake(380.0, 300.0);
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    // You'll probably want to do this on another thread
    // SomeService is just a dummy class representing some 
    // api that you are using to do the search
    //NSArray *results = [SomeService doSearch:searchBar.text];
    
    [searchBar setShowsCancelButton:NO animated:YES];
    [search resignFirstResponder];
    NSLog(@"YOU JUST TAPPED THE SEARCH BUTTON");
    [self doTheSearch];
  
}


-(IBAction)buttonSearch:(id)sender{
    
    [self doTheSearch];
    [search resignFirstResponder];
    
}

-(void)doTheSearch{
    searchResult = [[NSMutableArray alloc] init];
    NSData *output;
    
    
    NSString *compdata = @"";
    
    NSString *startHTML = @"<html>" ;
    //   NSString *startHTML = @"" ;
    
    [searchResult addObject:startHTML];
   NSString *endHTML = @"</html>"; 
    //  NSString *endHTML = @"";
    
   
   //[displaySearch loadHTMLString:startHTML baseURL:nil];
   NSString *filePath = @"Documents/searchResult.htm";
   NSFileManager *fileManager = [NSFileManager defaultManager];
   NSString *fileName = [NSHomeDirectory() stringByAppendingPathComponent:filePath];
  
  data = [startHTML dataUsingEncoding:NSASCIIStringEncoding];
    
   BOOL fileCreationSuccess = [fileManager createFileAtPath:fileName contents:nil attributes:nil];
  if(fileCreationSuccess == YES){
        //NSLog(@"Directory %@ created successfully!", fileName);
       }
  [data writeToFile:fileName atomically:YES];
  for (int j =0; j<[booksOfTheBible count]; j++) {
        NSString *bookSpecific = [[booksOfTheBible objectAtIndex:j] stringByAppendingString:@"Bookxmltrans"];
       //NSString *bookExtension = 
        //  NSLog(@"%@",bookSpecific);
      
       NSString *infoSouceFile = [[NSBundle mainBundle] pathForResource:bookSpecific ofType:@"htm"];
        ROR_BibleAppDelegate *appDelegateForSearch = [[UIApplication sharedApplication] delegate];
   
       NSString *infoText = [NSString stringWithContentsOfFile:infoSouceFile encoding:NSUTF8StringEncoding error:nil];
        NSString *compareRoot = [search text];
       NSString *compare = @"seas";
       
      // NSArray *allLinedStrings = [infoText componentsSeparatedByCharactersInSet:[NSCharacterSet.newlineCharacterSet ]];
        //    [NSCharacterSet.newlineCharacterSet]];
       NSArray *allLinedStrings = [infoText componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        NSString *strsInOneLine;
      for (int i = 0; i < [allLinedStrings count]; i++) {
           strsInOneLine = [allLinedStrings objectAtIndex:i];
          
         NSLog(@"ttttttt=%@",strsInOneLine);
           //break;
            //if ([strsInOneLine rangeOfString:compareRoot options:NSCaseInsensitiveSearch]location != NSNotFound){
          NSRange foundObj=[strsInOneLine rangeOfString:compareRoot options:NSCaseInsensitiveSearch];
           if(foundObj.location!=NSNotFound){
               //[displaySearch loadHTMLString:strsInOneLine baseURL:nil];
               data2 = [strsInOneLine dataUsingEncoding:NSASCIIStringEncoding];
                [data2 writeToFile:fileName atomically:YES];
                [searchResult addObject:strsInOneLine];
               
              compdata = [NSString stringWithFormat:@"%@%@",compdata,strsInOneLine];
              
                //break;
                }
          }
        
         //strsInOneLine = [allLinedStrings objectAtIndex:0];
      
       //[displaySearch loadHTMLString:strsInOneLine baseURL:nil];
      }
   
   data3 = [endHTML dataUsingEncoding:NSASCIIStringEncoding];
    
  [data3 writeToFile:fileName atomically:YES];
    [searchResult addObject:endHTML];
   
    [searchResult writeToFile:fileName atomically:YES];
    output = [fileManager contentsAtPath:fileName];
    NSString *aStr = [[NSString alloc] initWithData:output encoding:NSASCIIStringEncoding];
    [displaySearch copy:aStr];
    
    
    NSURL *url = [NSURL fileURLWithPath:fileName];
    
    NSURLRequest *REQUEST = [[NSURLRequest alloc] initWithURL:url];
    
    
    //[displaySearch loadRequest:REQUEST];
    
    [displaySearch loadHTMLString:[[NSString alloc] initWithFormat:@"<html>%@</html>",compdata] baseURL:nil];

//  NSRange r = NSMakeRange(0, 500);
    // NSString *cup = [aStr substringWithRange: r];
    
    //  NSLog(@"stringShahrukhJggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg:%@",cup);
    
    // [displaySearch loadHTMLString:cup baseURL:[NSURL URLWithString:@"Documents/searchResult.htm"]];
    // aStr=[[NSString alloc]initWithData:output encoding:aStr];
    //NSString *str=[[NSString alloc]initWithFormat:@"%@",output ];
    //NSString *str= [self  flattenHTML:aStr];
     // NSLog(@"%@",str);
    //[displaySearch loadHTMLString:aStr baseURL:nil];
    // [displaySearch copy:cup];
     // NSLog(@"%@",aStr);
     // displaySearch=[[UIWebView alloc]init];
    //NSString *myText = [displaySearch stringByEvaluatingJavaScriptFromString:aStr];
    
}

/*
 - (NSString *)flattenHTML:(NSString *)html {
 
 NSScanner *theScanner;
 NSString *text = nil;
 theScanner = [NSScanner scannerWithString:html];
 
 while ([theScanner isAtEnd] == NO) {
        
        [theScanner scanUpToString:@"<" intoString:NULL] ; 
        
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@""];
    }
    //
    html = [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return html;
 }
 */


- (void)viewDidAppear:(BOOL)animated {
    //[self.search becomeFirstResponder];
    self.contentSizeForViewInPopover = CGSizeMake(400.0, 500.0);
    [super viewDidAppear:animated];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}

// akbar 

#pragma mark -
#pragma mark Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [searchItems count];
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
    tableView.backgroundColor=[UIColor clearColor];
    
    // Configure the cell...
    cell.textLabel.text = [searchItems objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Cambria" size:20];
    if (indexPath.row <= 1)
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
//**/

//akbar 

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
// */



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


//akbar
#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0){

        PredictSearchViewController *predictSearchViewController = 
        [[PredictSearchViewController alloc] 
                initWithNibName:@"PredictSearchViewController" bundle:nil];
        
        [self.navigationController 
            pushViewController:predictSearchViewController animated:YES];
        //predictSearchViewController.navigationItem.rightBarButtonItem = predictSearchViewController.editButtonItem;
        predictSearchViewController.navigationItem.title = @"Predict Search";
        [predictSearchViewController release];
        }
    
    if (indexPath.row == 1){
        
        AdvancedSearchViewController *advancedSearchViewController = 
        [[AdvancedSearchViewController alloc] 
                initWithNibName:@"AdvancedSearchViewController" bundle:nil];
        
        [self.navigationController 
            pushViewController:advancedSearchViewController animated:YES];
       advancedSearchViewController.navigationItem.title = @"Advanced Search";
       [advancedSearchViewController release];
      }
  
    
}
//**/


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
   //[searchConditionTable release];
  [search release];
    [searchResult release];
    //[searchItems release];
   [super dealloc];
}


@end