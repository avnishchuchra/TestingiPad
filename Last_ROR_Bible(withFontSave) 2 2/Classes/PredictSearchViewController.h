//
//  PredictSearchViewController.h
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 4/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChaptersforPredictSearchViewController.h"
#import "VersesforPredictSearchViewController.h"

@interface PredictSearchViewController : UITableViewController {
NSMutableArray *predictSearchItems;
NSMutableArray *tableDataList;
int pathToChange;
}
//@property (nonatomic, retain) id pathToChange;
-(void)updateTable: (NSString *) newValue;
@end
