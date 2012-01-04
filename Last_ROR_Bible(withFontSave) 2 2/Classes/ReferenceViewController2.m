    //
//  ReferenceViewController2.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ReferenceViewController2.h"


@implementation ReferenceViewController2
@synthesize displayRef3;

- (void)viewDidLoad {
    [super viewDidLoad];
	self.contentSizeForViewInPopover = CGSizeMake(320.0, 300.0);
	checkLoad = 1;
	ROR_BibleAppDelegate *appDelegateRef = 
	[[UIApplication sharedApplication] delegate];
	
	NSString *details =  appDelegateRef.viewController.detailItem;
	if (details == nil) {
		referenceName2 = [@"Genesis" stringByAppendingString:@"Ref"];
		[displayRef3 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															   [[NSBundle mainBundle] pathForResource:
																[[NSString alloc] initWithFormat:@"%@", referenceName2] ofType:@"htm"]isDirectory:NO]]];
	}
	else {
		referenceName2 = [details stringByAppendingString:@"Ref"];
		[displayRef3 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															   [[NSBundle mainBundle] pathForResource:
																[[NSString alloc] initWithFormat:@"%@", referenceName2] ofType:@"htm"]isDirectory:NO]]];
	}
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:
									  @"Back" style:UIBarButtonItemStylePlain target:self action:@selector(handleRef:)];
	self.navigationItem.rightBarButtonItem = anotherButton;
	[anotherButton release];
	
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
	ROR_BibleAppDelegate *appDelegateRef2 = [[UIApplication sharedApplication] delegate];
	NSString *strRef = appDelegateRef2.viewController.forRef;
	//NSString *strRef2 = @"Genesis 40";
	//NSString *strRef2 = appDelegateRef2.viewController.extVerse;
	checkRefId2 = appDelegateRef2.viewController.checkRefId ;
	if(checkLoad == 1) {
		[self.displayRef3 stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
																   @"document.getElementById('%@').scrollIntoView(true);", strRef]];
		checkLoad = 2;
	}
	
}


-(IBAction)handleRef:(UIBarButtonItem *)sender {
	
	[displayRef3 goBack];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


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
    [super dealloc];
}


@end
