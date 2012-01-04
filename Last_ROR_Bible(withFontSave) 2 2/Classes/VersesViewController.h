//
//  VersesViewController.h
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ROR_BibleAppDelegate.h"
#import "ROR_BibleViewController.h"

//@protocol VersePickerDelegate
//- (void)verseSelected;
//@end


@interface VersesViewController : UITableViewController {
	
	NSMutableArray *verseItems;
	//id<VersePickerDelegate> _delegate;
    UIButton *btnOneTable;
    UIButton *btnSecondTable;
    UIButton *btnThirdTable;
    UIButton *btnFourthTable;
	
}
@property (nonatomic, retain) NSMutableArray *_verseItems;
//@property (nonatomic, assign) id<VersePickerDelegate> delegate;

@end
