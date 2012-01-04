//
//  HighlightItem.m
//  ROR_Bible
//
//  Created by PangCholJin on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HighlightItem.h"


@implementation HighlightItem

@synthesize strHighlightVerse, strHighlightColor;

- (void) encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject: self.strHighlightVerse forKey: @"verse"];
	[aCoder encodeObject: self.strHighlightColor forKey: @"color"];
}

- (id) initWithCoder:(NSCoder*) decoder
{
	if ((self = [super init])) {
		self.strHighlightVerse = [decoder decodeObjectForKey: @"verse"];
		self.strHighlightColor = [decoder decodeObjectForKey: @"color"];
	}
	return self;
}

@end
