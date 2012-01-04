//
//  ReferenceViewController2.h
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ROR_BibleAppDelegate.h"
#import "ROR_BibleViewController.h"


@interface ReferenceViewController2 : UIViewController <UIWebViewDelegate>{

	IBOutlet UIWebView *displayRef3;
	int checkLoad;
	int checkRefId2;
	NSString *referenceName2;
}
@property (retain, nonatomic) UIWebView *displayRef3;
@end
