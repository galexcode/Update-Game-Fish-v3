//
//  Fish.h
//  NewGameFish
//
//  Created by MAC on 4/2/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Hook.h"

@interface Fish : NSObject
@property (strong, nonatomic) UIImageView *fishImageView;
@property (strong, nonatomic) UIImage *fishImage;
@property CGPoint pointDie;
@property int start; // left -> right or right -> left : 0 or 1
@property float speed; // speed move of fish
@property Hook *hook;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer2;


-(void) constructorFishImage : (UIImage *) inFishImage;

-(float) computeAngle : (CGPoint) desPoint;

-(void) move : (CGPoint) desPoint;

@end
