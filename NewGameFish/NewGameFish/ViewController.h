//
//  ViewController.h
//  NewGameFish
//
//  Created by MAC on 4/2/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hook.h"
#import "Fish.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property UITapGestureRecognizer *myTap; // for self.view
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property int flagDrag;
@property (strong, nonatomic) Fish *fish1, *fish2, *fish3, *fish4, *fish5;
@property (strong, nonatomic) Fish *fish6, *fish7, *fish8, *fish9, *fish10;

@end
