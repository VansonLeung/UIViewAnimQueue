//
//  CoolButtonAppDelegate.h
//  CoolButton
//
//  Created by Ray Wenderlich on 9/30/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CoolButtonViewController;

@interface CoolButtonAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CoolButtonViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CoolButtonViewController *viewController;

@end

