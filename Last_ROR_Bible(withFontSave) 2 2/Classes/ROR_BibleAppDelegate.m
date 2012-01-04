//
//  ROR_BibleAppDelegate.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 1/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ROR_BibleAppDelegate.h"
#import "ROR_BibleViewController.h"

@implementation ROR_BibleAppDelegate

//@synthesize window;
@synthesize viewController;
@synthesize window;


#pragma mark -
#pragma mark Application lifecycle


- (void) saveState {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];

	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *fileName = [documentsDirectory stringByAppendingPathComponent:@"lastArray.txt"];
	NSString *bookmarks = [documentsDirectory stringByAppendingPathComponent:@"bookmarks.txt"];
	BOOL fileCreationSuccess = [fileManager createFileAtPath:fileName contents:nil attributes:nil];
	BOOL fileCreationSuccess2 = [fileManager createFileAtPath:bookmarks contents:nil attributes:nil];
	if(fileCreationSuccess == YES){
		NSLog(@"Directory %@ created successfully!", fileName);
		[viewController.noteTitleandAuthors writeToFile:fileName atomically:YES];
	}
	
	if(fileCreationSuccess2 == YES){
		NSLog(@"Directory %@ created successfully!", bookmarks);
		[viewController.bookmarkedScriptures writeToFile:bookmarks atomically:YES];
	}
	
	
	
}

- (void)startupAnimationDone:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {  
	[splashView removeFromSuperview];  
	[splashView release];  
}  


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch.
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *fileName = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/lastArray.txt"];
	NSString *bookmarks = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/bookmarks.txt"];
	
	if (![fileManager fileExistsAtPath:bookmarks]) {
	BOOL fileCreationSuccess = [fileManager  createFileAtPath:bookmarks contents:nil attributes:nil];
	initialiser = [[NSMutableArray alloc] init];
	if(fileCreationSuccess == YES){
	//NSLog(@"Directory %@ created successfully!", bookmarks);
	[initialiser writeToFile:bookmarks atomically:YES];
	}
	}
	
	if (![fileManager fileExistsAtPath:fileName]) {
		BOOL fileCreationSuccess = [fileManager  createFileAtPath:fileName contents:nil attributes:nil];
		initialiser = [[NSMutableArray alloc] init];
		if(fileCreationSuccess == YES){
			//NSLog(@"Directory %@ created successfully!", fileName);
			[initialiser writeToFile:fileName atomically:YES];
		}
	}
	
    [self.window addSubview:viewController.view];
    [self.window makeKeyAndVisible];
	
	
    //[window addSubview:viewController.view];
    //[window makeKeyAndVisible];
	
	//[window addViewForTouchPriority:viewController.view];
	
	splashView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 768, 1024)];  
	splashView.image = [UIImage imageNamed:@"e-ror_bible_splashscreen_1.jpg"];  
	[window addSubview:splashView];  
	[window bringSubviewToFront:splashView];  
	[UIView beginAnimations:nil context:nil];  
	[UIView setAnimationDuration:18.0];  
	[UIView setAnimationTransition:UIViewAnimationTransitionNone forView:window cache:YES];  
	[UIView setAnimationDelegate:self];   
	[UIView setAnimationDidStopSelector:@selector(startupAnimationDone:finished:context:)];  
	splashView.alpha = 0.0;  
	splashView.frame = CGRectMake(-60, -85, 888, 1179);  
	[UIView commitAnimations];
	
	
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
	[self saveState];
}

- (void)applicationDidEnterBackground:(UIApplication *) application {
	[self saveState];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [viewController release];
    [window release];
//	[initialiser release];
    [super dealloc];
}


@end
