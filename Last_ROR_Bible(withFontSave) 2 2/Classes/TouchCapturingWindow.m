//
//  TouchCapturingWindow.m
//  WTSWTSTM
//
//  Created by Bruno Nadeau on 10-10-21.
//  Copyright 2010 Wyld Collective Ltd. All rights reserved.
//

#import "TouchCapturingWindow.h"

@implementation TouchCapturingWindow

- (void)dealloc {
    if ( views ) [views release];
    [super dealloc];
}

- (void)addViewForTouchPriority:(UIView*)view {
    if ( !views ) views = [[NSMutableArray alloc] init];
    [views addObject:view];
}

- (void)removeViewForTouchPriority:(UIView*)view {
    if ( !views ) return;
    [views removeObject:view];
}

- (void)sendEvent:(UIEvent *)event {
	//we need to send the message to the super for the
	//text overlay to work (holding touch to show copy/paste)
    [super sendEvent:event];
	
	//get a touch
    UITouch *touch = [[event allTouches] anyObject];
	
	//check which phase the touch is at, and process it
    if (touch.phase == UITouchPhaseBegan) {
            for ( UIView *view in views ) {
                if ( CGRectContainsPoint([view frame], [touch locationInView:[view superview]]) ) {
                    touchView = view;
                    [touchView touchesBegan:[event allTouches] withEvent:event];
                    return;
                }
            }
    }
	else if (touch.phase == UITouchPhaseMoved) {
            if ( touchView ) {
                [touchView touchesMoved:[event allTouches] withEvent:event];
                return;
            }
	}
	else if (touch.phase == UITouchPhaseCancelled) {
            if ( touchView ) {
                [touchView touchesCancelled:[event allTouches] withEvent:event];
				touchView = nil;
                return;
            }
	}
	else if (touch.phase == UITouchPhaseEnded) {
            if ( touchView ) {
                [touchView touchesEnded:[event allTouches] withEvent:event];
				touchView = nil;
                return;
            }
    }
}

@end