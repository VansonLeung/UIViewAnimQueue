//
//  CoolButtonViewController.h
//  CoolButton
//
//  Created by Ray Wenderlich on 9/30/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VanButton.h"

@interface CoolButtonViewController : UIViewController {
    VanButton *_button;
}

@property (retain) IBOutlet VanButton *button;

- (IBAction)hueValueChanged:(id)sender;
- (IBAction)saturationValueChanged:(id)sender;
- (IBAction)brightnessValueChanged:(id)sender;

@end

