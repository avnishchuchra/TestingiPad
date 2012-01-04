//
//  TheWebView.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 7/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TheWebView.h"


@implementation TheWebView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code.
}
*/

- (void)addGestureRecognizersToPiece:(UIView *)piece
{
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(showResetMenu:)];
    [piece addGestureRecognizer:longPressGesture];
    [longPressGesture release];
}

- (void)awakeFromNib
{
    [self addGestureRecognizersToPiece:self];
}


- (void)showResetMenu:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan) {
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        UIMenuItem *resetMenuItem = [[UIMenuItem alloc] initWithTitle:@"Reset" action:@selector(resetPiece:)];
        CGPoint location = [gestureRecognizer locationInView:self];
        
        [self becomeFirstResponder];
        [menuController setMenuItems:[NSArray arrayWithObject:resetMenuItem]];
        [menuController setTargetRect:CGRectMake(location.x, location.y, 0, 0) inView:self];
        [menuController setMenuVisible:YES animated:YES];
        
       // pieceForReset = [gestureRecognizer view];
        
        [resetMenuItem release];
    }
}


//#pragma mark -
//#pragma mark Touch handling

/**- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {} 
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {} 
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *theTouch = [touches anyObject]; 
	if ([theTouch tapCount] == 2) {
		[self becomeFirstResponder]; 
		UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"Change Color"
															action:@selector(changeColor:)]; 
		UIMenuController *menuCont = [UIMenuController sharedMenuController]; 
		[menuCont setTargetRect:self.frame inView:self]; 
		menuCont.arrowDirection = UIMenuControllerArrowLeft; 
		menuCont.menuItems = [NSArray arrayWithObject:menuItem]; 
		[menuCont setMenuVisible:YES animated:YES];
	}
}
	- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {} 
	
	- (BOOL)canBecomeFirstResponder { return YES; }**/

- (void)dealloc {
    [super dealloc];
}


@end
