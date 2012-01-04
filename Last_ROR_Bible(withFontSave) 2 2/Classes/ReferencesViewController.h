//
//  ReferencesViewController.h
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ROR_BibleAppDelegate.h"
#import "ROR_BibleViewController.h"
#import "ReferenceViewController2.h"


@interface ReferencesViewController : UIViewController <UIWebViewDelegate, UIPopoverControllerDelegate> {
	
	IBOutlet UIWebView *displayRef2;
	NSString *referenceName2;
	NSString *referenceName3;
	UIPopoverController *popoverController;
	
	id detailItem2;
	id chapters2;
	int checkLoad;
	int checkRefId2;
	int details4;
	NSString *details2;
	NSString *bookRep3;
	NSString *bookRep4;
	NSString *details;
	NSString *extVerse2;
	NSString *details3;

}
@property (nonatomic, retain) id detailItem2;
@property (nonatomic, retain) id chapters2;
@property (retain, nonatomic) UIWebView *displayRef2;
@property (nonatomic, retain) UIPopoverController *popoverController;
- (NSDictionary *)parseQueryString:(NSString *)query ;
-(void)doTheWork:(id)object;
//-(void)doTheWork;

@end
