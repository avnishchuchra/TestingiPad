//
//  SettingsViewController.h
//  ROR_Bible
//
//  Created by Christian Isaac on 5/7/11.
//  Copyright 2011 Emerging Technologies & Re-engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FontOptionsViewController.h"
#import "ROR_BibleAppDelegate.h"
#import "ROR_BibleViewController.h"

@interface SettingsViewController : UIViewController {
NSMutableArray *settingsItems;
	
	
	IBOutlet UISwitch *switch1;  
    IBOutlet UISwitch *switch2;  
    IBOutlet UISwitch *switch3;
	IBOutlet UISlider *theSlider;
}
@property (nonatomic, retain) UISwitch *switch1;  
@property (nonatomic, retain) UISwitch *switch2;  
@property (nonatomic, retain) UISwitch *switch3;
@property (nonatomic, retain) UISlider *theSlider;

- (IBAction) toggleEnabledForSwitch1: (id) sender;  
- (IBAction) toggleEnabledForSwitch2: (id) sender;
- (IBAction) toggleEnabledForSlider: (UISlider *) sender;
//- (IBAction) toggleEnabledForSwitch3: (id) sender;  

@end
