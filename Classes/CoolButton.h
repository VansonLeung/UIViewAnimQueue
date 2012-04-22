//
//  CoolButton.h
//  CoolButton
//
//  Created by Ray Wenderlich on 9/30/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoolButton : UIButton {
    CGFloat _hue;
    CGFloat _saturation;
    CGFloat _brightness;
}

@property  CGFloat hue;
@property  CGFloat saturation;
@property  CGFloat brightness;

@end

