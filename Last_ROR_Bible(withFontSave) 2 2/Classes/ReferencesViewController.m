    //
//  ReferencesViewController.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 6/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ReferencesViewController.h"


@implementation ReferencesViewController
@synthesize detailItem2,chapters2, displayRef2, popoverController; 

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.contentSizeForViewInPopover = CGSizeMake(320.0, 250.0);
	//checkLoad = 1;
	ROR_BibleAppDelegate *appDelegateRef = 
	[[UIApplication sharedApplication] delegate];
	details3 = appDelegateRef.viewController.bookRep2;
	details =  appDelegateRef.viewController.bookRep;
	details2 = appDelegateRef.viewController.extVerse ;
	details4 = appDelegateRef.viewController.checkRefId ;
	
	if([details isEqualToString:@"1"] ||[details isEqualToString:@"2"] || [details isEqualToString:@"3"]){
		NSString *complement2 = [details stringByAppendingString:@" "];
		NSString *thePart2 = [complement2 stringByAppendingString:details3];
		referenceName2 = [thePart2 stringByAppendingString:@"Ref"];
		[displayRef2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															   [[NSBundle mainBundle] pathForResource:
																[[NSString alloc] initWithFormat:@"%@", referenceName2] ofType:@"htm"]isDirectory:NO]]];
	}
	else{
	referenceName2 = [details stringByAppendingString:@"Ref"];
	[displayRef2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
														   [[NSBundle mainBundle] pathForResource:
															[[NSString alloc] initWithFormat:@"%@", referenceName2] ofType:@"htm"]isDirectory:NO]]];
	}

	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:
									  @"Back" style:UIBarButtonItemStylePlain target:self action:@selector(handleRef:)];
	self.navigationItem.rightBarButtonItem = anotherButton;
	[anotherButton release];
	
	}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
	
	if (checkLoad == 1) {
		[self.displayRef2 stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
																   @"document.getElementById('%@').scrollIntoView(true);", extVerse2]];
		checkLoad = 2;
	}
	else{
        
		if(details4 == 1){
		[self.displayRef2 stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
																   @"document.getElementById('%@').scrollIntoView(true);", details2]];
            
			details4 = 2;
            NSLog(@"detail 2 = %@", details2);
		}
    }
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"url : %@", [request URL]);
    if([[[request URL] scheme] isEqualToString:@"myapp"]) { 
		//SEL selector = NSSelectorFromString([[request URL] query]);
		
		NSDictionary *arguments = [self parseQueryString:[[request URL] query]];
		
		NSString *selectorStr = [arguments valueForKey:@"selector"];
		SEL selector = NSSelectorFromString(selectorStr);
		
		NSString *verseID = [arguments valueForKey:@"verseID"];
		
		if([self respondsToSelector:selector]) {
			[self performSelector:selector withObject:verseID];
		} else {
			//alert user of invalid URL
		}
		return NO;
    }
    return YES;
}

- (NSDictionary *)parseQueryString:(NSString *)query {
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6]; //autorelease];
	NSArray *pairs = [query componentsSeparatedByString:@"&"];
	
	for (NSString *pair in pairs) {
		NSArray *elements = [pair componentsSeparatedByString:@"="];
		NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		
		[dict setObject:val forKey:key];
	}
	return dict;
	[dict release];
}


-(void)doTheWork:(id)object{

extVerse2 = object;


NSArray *refBook2=[extVerse2 componentsSeparatedByString:@" "];
bookRep3 = [NSString stringWithFormat:@"%@",[refBook2 objectAtIndex:0]];
bookRep4 = [NSString stringWithFormat:@"%@",[refBook2 objectAtIndex:1]];
	
	
	checkLoad = 1;
	
	if([bookRep3 isEqualToString:@"1"] ||[bookRep3 isEqualToString:@"2"] || [bookRep3 isEqualToString:@"3"]){
		NSString *complement3 = [bookRep3 stringByAppendingString:@" "];
		NSString *thePart3 = [complement3 stringByAppendingString:bookRep4];
		referenceName3 = [thePart3 stringByAppendingString:@"Ref"];
		[displayRef2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															   [[NSBundle mainBundle] pathForResource:
																[[NSString alloc] initWithFormat:@"%@", referenceName3] ofType:@"htm"]isDirectory:NO]]];
	}
	
	else{
	referenceName3 = [bookRep3 stringByAppendingString:@"Ref"];
	[displayRef2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
														   [[NSBundle mainBundle] pathForResource:
															[[NSString alloc] initWithFormat:@"%@", referenceName3] ofType:@"htm"]isDirectory:NO]]];
	}
	
}


- (IBAction)handleRef:(UIBarButtonItem *)sender {
	
	[displayRef2 goBack];
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
	[detailItem2 release];
	[chapters2 release];
	[popoverController release];
}


@end
