//
//  UIViewAnimQueue.m
//  CoolButton
//
//  Created by  on 12年4月23日.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIViewAnimQueue.h"

@implementation UIViewAnimQueue
@synthesize target;
@synthesize defaultRect;
@synthesize animQueue;

-(void)dealloc{
    [animQueue release];
    [self dealloc];
}
// setup anim session 
// alloc animqueue
// and make a default rect
-(void)setupAnimSessionWithTarget:(UIView*)_target{
    animQueue = [[NSMutableArray alloc]init];
    target = _target;
    defaultRect = target.frame;
    isPaused = YES;
    autoRestart = YES;
    autoStop = YES;
    isBusy = NO;
}


// push animation one by one
// not applicable with transition animation
-(void)pushWithRect:(CGRect)rect delay:(CGFloat)delay duration:(CGFloat)duration curve:(UIViewAnimationCurve)curve{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    
    // dict information
    NSString *tagRect       = @"tagRect";
    NSString *tagDelay      = @"tagDelay";
    NSString *tagDuration   = @"tagDuration";
    NSString *tagCurve      = @"tagCurve";
    [dict setValue:     [NSValue valueWithCGRect:rect]          forKey:tagRect];
    [dict setObject:    [NSNumber numberWithFloat:delay]        forKey:tagDelay];
    [dict setObject:    [NSNumber numberWithFloat:duration]     forKey:tagDuration];
    [dict setObject:    [NSNumber numberWithInt:curve]          forKey:tagCurve];
    
    [animQueue addObject:dict];
    [dict autorelease];
    
    if (autoRestart){
        if ([animQueue count] > 0){
            isPaused = NO;
            [self startAnim];
        }
    }
}


// this can make easier returning to default state
-(void)pushWithDefaultWithDelay:(CGFloat)delay duration:(CGFloat)duration curve:(UIViewAnimationCurve)curve{
    [self pushWithRect: defaultRect delay:delay duration:duration curve:curve];
}


-(void)animDidFinish{
    isBusy = NO;
}


// run animation one by one
-(void)popAndRun:(BOOL)run{
    if (isBusy) return;
    if ([animQueue count] <= 0) return;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithDictionary:[animQueue objectAtIndex:0] ];
    
    if (run){
        // dict information
        NSString *tagRect       = @"tagRect";
        NSString *tagDelay      = @"tagDelay";
        NSString *tagDuration   = @"tagDuration";
        NSString *tagCurve      = @"tagCurve";
        CGRect  rect        = [[dict valueForKey:tagRect]       CGRectValue];
        CGFloat delay       = [[dict objectForKey:tagDelay]     floatValue];
        CGFloat duration    = [[dict objectForKey:tagDuration]  floatValue];
        UIViewAnimationCurve     curve = [[dict objectForKey:tagCurve]     intValue];
        
        [UIView beginAnimations:nil context:nil];
        
        [UIView setAnimationCurve:curve];
        [UIView setAnimationDelay:delay];
        [UIView setAnimationDuration:duration];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animDidFinish)];
        
        [target setFrame:rect];
        
        [UIView commitAnimations];
        
        isBusy = YES;
    }
    
    [animQueue removeObjectAtIndex:0];
    [dict autorelease];
}


-(void)startAnim{
    
    if (autoStop){
        if ([animQueue count] <= 0){
            return;
        }
    }
    
    if (!isPaused)
        [self popAndRun:YES];
    
    [self performSelector:@selector(startAnim) withObject:nil afterDelay:( (float)1 / (float)30 )];
}


-(void)restartAnim{
    isPaused = NO;
}

-(void)stopAnim{
    isPaused = YES;
}

-(void)cleanQueue{
    [animQueue removeAllObjects];
}

-(void)forcePop{
    isBusy = NO;
}

-(void)resetDefault{
    [self cleanQueue];
    [self pushWithRect:defaultRect delay:0.0f duration:0.0f curve:UIViewAnimationCurveEaseOut];
    if (!autoRestart){
        [self popAndRun:YES];
    }
    isBusy = NO;
}


@end

