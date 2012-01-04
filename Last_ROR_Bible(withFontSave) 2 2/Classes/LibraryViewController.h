//
//  LibraryViewController.h
//  ROR_Bible
//
//  Created by IMM (Emerging Technologies & Re-engineering) on 3/22/11.
//  Copyright 2011 BLW Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChaptersViewController.h"
#import "InspirationArticlesViewController.h"
#import "BibleConcordanceViewController.h"
#import "BiblePlanner.h"
#import "ROR_BibleAppDelegate.h"



@interface LibraryViewController : UITableViewController {
NSMutableArray *libraryMarksItems;
	IBOutlet UITableView *tView;
}
@property (nonatomic, retain) UITableView *tView;
@end
