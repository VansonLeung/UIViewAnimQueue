//
//  UIViewAnimQueue.h
//  CoolButton
//
//  Created by  on 12年4月23日.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewAnimQueue : UIView{
    BOOL isPaused;
    BOOL autoRestart;
    BOOL autoStop;
    BOOL isBusy;
    CGRect defaultRect;
}
@property (nonatomic,assign) UIView *target;
@property (nonatomic,readwrite) CGRect defaultRect;
@property (nonatomic,retain) NSMutableArray *animQueue;

-(void)setupAnimSessionWithTarget:(UIView*)_target;
-(void)pushWithRect:(CGRect)rect delay:(CGFloat)delay duration:(CGFloat)duration curve:(UIViewAnimationCurve)curve;
-(void)pushWithDefaultWithDelay:(CGFloat)delay duration:(CGFloat)duration curve:(UIViewAnimationCurve)curve;
-(void)startAnim;
-(void)stopAnim;
-(void)forcePop;
-(void)cleanQueue;
-(void)resetDefault;
@end
