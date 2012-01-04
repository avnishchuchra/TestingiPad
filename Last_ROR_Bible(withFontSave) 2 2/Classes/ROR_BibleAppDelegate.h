//
//  ROR_BibleAppDelegate.h
//  ROR_Bible
//
//  Created by IMM (Emerging Technologies & Re-engineering) on 3/22/11.
//  Copyright 2011 BLW Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchCapturingWindow.h"

@class ROR_BibleViewController;

@interface ROR_BibleAppDelegate : NSObject <UIApplicationDelegate> {
    ROR_BibleViewController *viewController;
	 //TouchCapturingWindow *window;
	UIWindow *window;  
	UIImageView *splashView;
	NSMutableArray *initialiser;
	//NSString *fileName;
	//NSString *bookmarks;
	
}
- (void) saveState;
- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context;
//@property (nonatomic, retain) IBOutlet TouchCapturingWindow *window;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ROR_BibleViewController *viewController;

@end

