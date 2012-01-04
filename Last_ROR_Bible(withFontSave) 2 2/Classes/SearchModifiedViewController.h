//
//  SearchModifiedViewController.h
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 4/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdvancedSearchViewController.h"
#import "PredictSearchViewController.h"
#import "ROR_BibleAppDelegate.h"
#import "ROR_BibleViewController.h"


@interface SearchModifiedViewController : UIViewController<UISearchBarDelegate, UIWebViewDelegate>{

	NSMutableArray *searchItems;
	IBOutlet UISearchBar* search;
	IBOutlet UIWebView *displaySearch;
	NSArray *booksOfTheBible;
	NSData *data;
	NSData *data2;
	NSData *data3;
	IBOutlet UITableView* searchConditionTable;
	NSMutableArray *searchResult;
}
@property (nonatomic, retain) UISearchBar* search;
@property (nonatomic, retain) UITableView* searchConditionTable;
-(void)doTheSearch;
-(IBAction)buttonSearch:(id)sender;
//- (NSString *)flattenHTML:(NSString *)html ;

@end
