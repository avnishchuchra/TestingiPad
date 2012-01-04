//
//  HighlightItem.h
//  ROR_Bible
//
//  Created by PangCholJin on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HighlightItem : NSObject <NSCoding> {
	NSString* strHighlightVerse;
	NSString* strHighlightColor;
}

@property(nonatomic, retain) NSString* strHighlightVerse;
@property(nonatomic, retain) NSString* strHighlightColor;
@end
