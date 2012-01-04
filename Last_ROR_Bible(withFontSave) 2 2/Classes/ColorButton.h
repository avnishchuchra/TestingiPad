//
//  ColorButton.h
//  ROR_Bible
//
//  Created by MacBook on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ColorButton : UIButton {
	UIColor*	mButtonColor;
	CGRect		mViewRect;
	UIView*		mColorView;
}

@property (retain) UIColor*	mButtonColor;

- (id)initWithFrame:(CGRect)frame withColor:(UIColor*) color;
@end
