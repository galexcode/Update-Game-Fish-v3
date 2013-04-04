//
//  Hook.m
//  NewGameFish
//
//  Created by MAC on 4/3/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Hook.h"

@implementation Hook

@synthesize mySlider, imageView, hook;

-(void) constructor : (UISlider *) inSlider
       andHookImage : (UIImage *) inHookImage {
    
    self.mySlider = inSlider;
    self.hook = inHookImage;

  
    imageView = [[UIImageView alloc] initWithImage:hook];

}


@end
