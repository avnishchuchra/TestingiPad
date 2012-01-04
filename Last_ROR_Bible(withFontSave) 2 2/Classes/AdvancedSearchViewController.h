//
//  AdvancedSearchViewController.h
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AdvancedSearchViewController : UITableViewController {
NSMutableArray *advancedSearchItems;
	NSIndexPath	*lastIndexPath;
}
@property (nonatomic, retain) NSIndexPath * lastIndexPath;
@property (nonatomic, retain) NSMutableArray * advancedSearchItems;
@end
