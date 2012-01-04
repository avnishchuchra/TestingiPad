//
//  MenuWebView.h
//  ROR_Bible
//
//  Created by PangCholJin on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColorSelectDialog.h"
#import "HighlightItem.h"

@class ROR_BibleViewController;

@interface MenuWebView : UIWebView<ColorSelectDelegate> {
	ROR_BibleViewController *bibleViewController;
	
	NSMutableArray *requestArray;
}

@property (nonatomic, assign) ROR_BibleViewController *bibleViewController;

- (void) selectWithColor:(NSString*) strcolor;
-(void) highlightString:(HighlightItem*) item;

- (void)onBackButton;

@end
