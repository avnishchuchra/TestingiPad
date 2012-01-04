//
//  TouchCapturingWindow.h
//  WTSWTSTM
//
//  Created by Bruno Nadeau on 10-10-21.
//  Copyright 2010 Wyld Collective Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchCapturingWindow : UIWindow {
    NSMutableArray *views;
	
@private
    UIView *touchView;
}

- (void)addViewForTouchPriority:(UIView*)view;
- (void)removeViewForTouchPriority:(UIView*)view;

@end
