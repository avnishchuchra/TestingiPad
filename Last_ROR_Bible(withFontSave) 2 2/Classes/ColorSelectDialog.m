//
//  ColorSelectDialog.m
//  ROR_Bible
//
//  Created by PangCholJin on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ColorSelectDialog.h"
#import "ColorButton.h"

#define		BTNCOUNT_IN_LINE	3
#define		BTN_COUNT			6

@implementation ColorSelectDialog
@synthesize parentPopup, colordelegate;
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
	
	float nBtnWidth = self.contentSizeForViewInPopover.width / BTNCOUNT_IN_LINE;
	int nLineCount = BTN_COUNT/BTNCOUNT_IN_LINE;
	float nBtnHeight = self.contentSizeForViewInPopover.height / nLineCount; 
	
	int r[BTN_COUNT] = {255,0,0,255,255,255};
	int g[BTN_COUNT] = {0,255,0,255,0,255};
	int b[BTN_COUNT] = {0,0,255,0,255,255};
	for (int i=0; i<BTN_COUNT; i++) 
	{
		int nPosX = nBtnWidth * (i%BTNCOUNT_IN_LINE);
		int nPosY = nBtnHeight * (i/BTNCOUNT_IN_LINE);
		UIColor *curColor = [UIColor colorWithRed:r[i]/255.0f green:g[i]/255.0f blue: b[i]/255.0f alpha:1.0f];
		ColorButton* btn = [[ColorButton alloc] initWithFrame: CGRectMake(nPosX, nPosY, nBtnWidth, nBtnHeight) withColor: curColor];
		[btn addTarget: self action:@selector(onColorSelected:) forControlEvents: UIControlEventTouchDown];
		[self.view addSubview: btn];
		[btn release];
	}
}

- (void) onColorSelected:(id) sender
{
	ColorButton* btn = (ColorButton*) sender;
	[self.colordelegate colorSelected: btn.mButtonColor];
	if(self.parentPopup)
	{
		[self.parentPopup dismissPopoverAnimated: YES];
	}
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
