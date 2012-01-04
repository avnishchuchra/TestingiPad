//
//  ChaptersforPredictSearchViewController.h
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 5/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PredictSearchViewController;

@interface ChaptersforPredictSearchViewController : UITableViewController {
NSMutableArray *bookMarksItems;
	PredictSearchViewController *parentTable;
}
@property (nonatomic, retain) PredictSearchViewController *parentTable;
@end
