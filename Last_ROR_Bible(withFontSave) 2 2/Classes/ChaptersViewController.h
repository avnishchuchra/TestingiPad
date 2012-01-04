//
//  ChaptersViewController.h
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VersesViewController.h"
#import "ROR_BibleAppDelegate.h"
#import "ROR_BibleViewController.h"
#import "ReferencesViewController.h"

@interface ChaptersViewController : UITableViewController {
	NSMutableArray *chapterItems;
	NSString *word;
	id chapter2; 
    UIButton *btnOne;
    UIButton *btnSecond;
    UIButton *btnThird;
    UIButton *btnFourth;
}
@property (nonatomic, copy) NSString *word;
@property (nonatomic, retain) id chapter2;
@end
