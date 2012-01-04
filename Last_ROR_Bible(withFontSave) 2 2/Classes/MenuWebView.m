//
//  MenuWebView.m
//  ROR_Bible
//
//  Created by PangCholJin on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MenuWebView.h"
#import "UserDataManager.h"
#import "ROR_BibleViewController.h"


@implementation MenuWebView

@synthesize bibleViewController;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
		// Jinlong: MenuWebView is non-scrollabel webview.
		for (UIView *subview in self.subviews)
		{
			if ([subview isKindOfClass:[UIScrollView class]] == YES)
			{
				[(UIScrollView*)subview setScrollEnabled:FALSE];
			}
		}
    }
    return self;
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender 
{
	BOOL can = [super canPerformAction:action withSender:sender];    
	if (action == @selector(HighlightClicked:)
		|| action == @selector(onCopy:))
	{
		can = YES; 
	} 
	else {
		can = NO;
	}	
	
	return can;
}

-(void)HighlightClicked:(id)sender
{
	NSLog(@"HighlightClicked");
	ColorSelectDialog * pController = 
	[[ColorSelectDialog alloc] init];
	pController.contentSizeForViewInPopover = CGSizeMake(320.0, 240);
	
	pController.navigationItem.title = @"Select Highlight Color";
	UINavigationController *navController = 
	[[UINavigationController alloc] 
	 init];	
	[navController pushViewController:pController animated:YES];
	
	UIPopoverController *popover = 
	[[UIPopoverController alloc] 
	 initWithContentViewController:navController]; 
	
	[pController release];
	[navController release];
	
	[popover presentPopoverFromRect:self.bounds inView:self permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
	pController.parentPopup = popover;
	pController.colordelegate = self;
	[popover release];
	//	[self webviewGetSelection];
}

-(NSString*) RGBToHexString:(int) r :(int) g:(int) b
{
	NSString* sRed = [NSString stringWithFormat:@"%x",r];
	if (sRed.length == 1)
		sRed = [@"0" stringByAppendingString: sRed];
	
	NSString* sGreen = [NSString stringWithFormat:@"%x",g];
	if (sGreen.length == 1)
		sGreen = [@"0" stringByAppendingString: sGreen];
	
	NSString* sBlue = [NSString stringWithFormat:@"%x",b];
	if (sBlue.length == 1)
		sBlue = [@"0" stringByAppendingString: sBlue];
	
	NSString * strcolor = [NSString stringWithFormat:@"#%@%@%@", sRed, sGreen, sBlue];
	return strcolor;
}

-(void) colorSelected: (UIColor*) color
{
	CGColorRef colorRef = [color CGColor];
	int numComponents = CGColorGetNumberOfComponents( colorRef);
	
	if (numComponents == 4) {
		const CGFloat* components = CGColorGetComponents( colorRef );
		int red = (int)(components[0]*255);
		int green = (int)(components[1]*255);
		int blue = (int)(components[2]*255);	
		
		NSString* strcolor = [self RGBToHexString: red : green : blue];
		[self selectWithColor:(NSString*) strcolor];
	}
}

- (void) selectWithColor:(NSString*) strcolor
{
	NSString *path = [[NSBundle mainBundle] pathForResource:@"SearchSelection" ofType:@"js"];
    NSString *jsCode = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	[self stringByEvaluatingJavaScriptFromString:jsCode];
	
	NSString* startSearch = [NSString stringWithFormat:@"highlightselectedstring('%@')", strcolor];
    NSString *result=[self stringByEvaluatingJavaScriptFromString:startSearch];
	
	[UserDataManager addHighlightItem: result withColor: strcolor];
	NSLog(@"selected: %@", result);
}

-(void)NoteClicked:(id)sender
{
	NSLog(@"NoteClicked");
}

-(void)BookmarkClicked:(id)sender
{
	NSLog(@"BookmarkClicked");
	//[ROR_BibleViewController generate];
}

-(void)onCopy:(id)sender
{
	[self copy:sender];
}

-(void) highlightString:(HighlightItem*) item
{	
	if (item == nil) {
		return;
	}
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"SearchSelection" ofType:@"js"];
    NSString *jsCode = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	[self stringByEvaluatingJavaScriptFromString:jsCode];
	
	NSString* startSearch = [NSString stringWithFormat:@"highlightstring('%@','%@')", item.strHighlightVerse, item.strHighlightColor];
    [self stringByEvaluatingJavaScriptFromString:startSearch];	
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code.
 }
 */

- (void)dealloc {
	[requestArray release];
    [super dealloc];
}

- (void)loadRequest:(NSURLRequest *)request {
	if (requestArray == nil) {
		requestArray = [[NSMutableArray alloc] init];
	}
	
	if (self.request) {
		if (![[[self.request URL] absoluteString] isEqualToString:[[request URL] absoluteString]]) {
			[requestArray addObject:self.request];
			bibleViewController.backButton.hidden = NO;
		}
	}
	
	[super loadRequest:request];
}

- (void)onBackButton {
	NSURLRequest *request = [[requestArray lastObject] retain];
	[requestArray removeLastObject];
	[super loadRequest:request];
	[request release];
	
	if (requestArray.count == 0) {
		bibleViewController.backButton.hidden = YES;
	}
}

@end
