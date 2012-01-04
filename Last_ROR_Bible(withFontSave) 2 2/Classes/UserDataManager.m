//
//  UserDataManager.m
//  ROR_Bible
//
//  Created by MacBook on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UserDataManager.h"


@implementation UserDataManager
@synthesize mHighlightItems, mBookmarks;

static UserDataManager * sharedDataManager = nil;

-(id) init
{
	if((self = [super init]))
	{
		if (sharedDataManager == nil) {
			sharedDataManager = self;
		}
	}
	return self;
}

+ (NSMutableArray*) getHighlightItems
{
	return sharedDataManager.mHighlightItems;
}

+ (NSMutableArray*) getBookmarks
{
	return sharedDataManager.mBookmarks;
}

+ (void) saveData
{
	if (!sharedDataManager || sharedDataManager.mHighlightItems == nil) {
		return;
	}
	
	NSMutableArray* encodedItems = [[NSMutableArray alloc] init];
	for (HighlightItem * item in sharedDataManager.mHighlightItems)
	{
		[encodedItems addObject: [NSKeyedArchiver archivedDataWithRootObject: item]];
	}
	
	[[NSUserDefaults standardUserDefaults] setObject:encodedItems forKey:@"highlightwords"];
	[[NSUserDefaults standardUserDefaults] setObject:sharedDataManager.mBookmarks forKey:@"bookmarks"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	[encodedItems release];
}

+ (void) loadData
{
	if (!sharedDataManager) {
		sharedDataManager = [UserDataManager new];
	}
	
	if (sharedDataManager.mHighlightItems) {
		[sharedDataManager.mHighlightItems removeAllObjects];
		[sharedDataManager.mHighlightItems release];
		sharedDataManager.mHighlightItems = nil;
	}
	
	if (sharedDataManager.mBookmarks) {
		[sharedDataManager.mBookmarks removeAllObjects];
		[sharedDataManager.mBookmarks release];
	}
	
	sharedDataManager.mHighlightItems = [[NSMutableArray alloc] init];	
	NSArray * encodedItems = [[NSUserDefaults standardUserDefaults] objectForKey:@"highlightwords"];
	for (NSData * item in encodedItems) {
		[sharedDataManager.mHighlightItems addObject: [NSKeyedUnarchiver unarchiveObjectWithData: item]];
	}

	sharedDataManager.mBookmarks = [NSMutableArray arrayWithArray: [[NSUserDefaults standardUserDefaults] objectForKey: @"bookmarks"]];
}
+ (void) addHighlightItem:(NSString*) word withColor:(NSString*) strcolor
{
	if (!sharedDataManager) {
		sharedDataManager = [UserDataManager new];
	}	
	
	NSMutableArray* highlightWords = sharedDataManager.mHighlightItems;
	
	for (HighlightItem* item in highlightWords)
	{
		if ([item.strHighlightVerse isEqualToString: word]) {
			return;
		}
	}
	
	HighlightItem * newItem = [[HighlightItem alloc] init];
	newItem.strHighlightVerse = word;
	newItem.strHighlightColor = strcolor;
	
	int nCount = [highlightWords count];
	[highlightWords insertObject: newItem atIndex: nCount];
	[UserDataManager saveData];
}

+ (void) addBookmark:(NSString*) sbookmark
{
	if (!sharedDataManager) {
		sharedDataManager = [UserDataManager new];
	}	
	
	NSMutableArray* bookmarks = sharedDataManager.mBookmarks;
	
	for (NSString* str in bookmarks)
	{
		if ([str isEqualToString: sbookmark]) {
			return;
		}
	}
	
	int nCount = [bookmarks count];
	[bookmarks insertObject: sbookmark atIndex: nCount];
	[UserDataManager saveData];
}

@end
