//
//  CoolButtonViewController.m
//  CoolButton
//
//  Created by Ray Wenderlich on 9/30/10.
//  Copyright 2010 Ray Wenderlich. All rights reserved.
//

#import "CoolButtonViewController.h"
#import "CoolButton.h"

@implementation CoolButtonViewController
@synthesize button = _button;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	self.button = nil;
}


- (void)dealloc {
    [_button release];
    _button = nil;
    [super dealloc];
}

- (IBAction)hueValueChanged:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    _button.hue = slider.value;
    
}

- (IBAction)saturationValueChanged:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    _button.saturation = slider.value;
    
}

- (IBAction)brightnessValueChanged:(id)sender {
    
    UISlider *slider = (UISlider *)sender;
    _button.brightness = slider.value;
    
}

@end
