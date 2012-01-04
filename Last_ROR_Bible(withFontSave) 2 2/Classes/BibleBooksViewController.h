//
//  BibleBooksViewController.h
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ROR_BibleViewController.h"
#import "ChaptersViewController.h"
#import "ROR_BibleAppDelegate.h"
#import "ReferencesViewController.h"


@interface BibleBooksViewController : UITableViewController {
	NSMutableArray *bookMarksItems;
	NSString *chapWord;	
    UIButton *btnBooks;
    UIButton *btnBooks1;
    UIButton *btnBooks2;
    UIButton *btnBooks3;
    UIButton *btnBooks4;
    UIButton *btnBooks5;
	UIButton *btn;
    BOOL rotate;
}
@property (nonatomic, copy) NSString *chapWord;
@property BOOL rotate;
@end
