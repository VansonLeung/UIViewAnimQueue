//
//  VanButton.h
//  CoolButton
//
//  Created by  on 12年4月23日.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewAnimQueue.h"

@interface VanButton : UIButton{
    CGFloat _hue;
    CGFloat _saturation;
    CGFloat _brightness;
    
    UIViewAnimQueue *_animQueue;
}

@property (nonatomic,readwrite)     CGFloat hue;
@property (nonatomic,readwrite)     CGFloat saturation;
@property (nonatomic,readwrite)     CGFloat brightness;

@end

