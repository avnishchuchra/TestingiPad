//
//  Autocomplete.h
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 5/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Autocomplete : NSObject
{
	NSMutableArray *candidates;
}

- (Autocomplete *)initWithArray:(NSArray *)initialArray;
- (NSMutableArray *)GetSuggestions:(NSString *)root;
- (void)AddCandidate:(NSString *)candidate;

@end
