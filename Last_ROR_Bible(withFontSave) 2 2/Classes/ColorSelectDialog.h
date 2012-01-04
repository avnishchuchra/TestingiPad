//
//  ColorSelectDialog.h
//  ROR_Bible
//
//  Created by PangCholJin on 9/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ColorSelectDelegate
-(void) colorSelected: (UIColor*) color;
@end


@interface ColorSelectDialog : UIViewController {
	UIPopoverController* parentPopup;
	id<ColorSelectDelegate>		colordelegate;
}

@property (nonatomic, retain) UIPopoverController* parentPopup;
@property (nonatomic, assign) id<ColorSelectDelegate> colordelegate;
@end
