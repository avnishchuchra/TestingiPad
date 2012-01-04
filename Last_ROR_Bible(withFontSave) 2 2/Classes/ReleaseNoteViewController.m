    //
//  ReleaseNoteViewController.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 4/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ReleaseNoteViewController.h"


@implementation ReleaseNoteViewController

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


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIImageView *releaseNoteImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"help_release.jpg"]];
	self.view = releaseNoteImage;
	[releaseNoteImage release];

}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
		self.contentSizeForViewInPopover = CGSizeMake(295.0, 386.0);
	
    [super viewDidLoad];
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
