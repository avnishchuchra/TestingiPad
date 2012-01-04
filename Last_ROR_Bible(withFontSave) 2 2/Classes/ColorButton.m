//
//  ColorButton.m
//  ROR_Bible
//
//  Created by MacBook on 9/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ColorButton.h"
#import "QuartzCore/QuartzCore.h"

@implementation ColorButton
@synthesize  mButtonColor;

- (id)initWithFrame:(CGRect)frame withColor:(UIColor*) color{
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization Code
		self.backgroundColor = [UIColor clearColor];
		self.mButtonColor = color;
		[self setBackgroundImage:[UIImage imageNamed:@"btnSave.png"] forState: UIControlStateNormal];
		self.opaque = NO;
		CGRect colorFrame = CGRectMake( frame.size.width/4, (frame.size.height - frame.size.width/2)/2, frame.size.width/2, frame.size.width/2);
		mColorView = [[UIView alloc] initWithFrame:colorFrame];
		mColorView.backgroundColor = color;
		mColorView.layer.cornerRadius = 2.0f;
		mColorView.layer.borderWidth = 2.0f;
		mColorView.layer.masksToBounds = YES;
		mColorView.layer.borderColor = [UIColor whiteColor].CGColor;
		mColorView.userInteractionEnabled = NO;
		[self addSubview: mColorView];
		[mColorView release];
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

- (void)dealloc {
    [super dealloc];
}


@end
