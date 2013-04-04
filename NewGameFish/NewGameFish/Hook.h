//
//  Hook.h
//  NewGameFish
//
//  Created by MAC on 4/3/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hook : NSObject
@property (strong, nonatomic) UISlider *mySlider;
@property (strong, nonatomic) UIImage *hook;
@property (strong, nonatomic) UIImageView *imageView;
@property float desClick;


-(void) constructor : (UISlider *) inSlider andHookImage : (UIImage *) inHookImage;

@end
