//
//  Fish.m
//  NewGameFish
//
//  Created by MAC on 4/2/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "Fish.h"
#import <QuartzCore/QuartzCore.h>

@interface Fish() {
    int flagFlip;
    UIImage *imageTemp;
    int moveDes;
}

@end

@implementation Fish
-(void) constructorFishImage : (UIImage *) inFishImage {
    
    // create musix
    
    NSString* filePath2 = [[NSBundle mainBundle] pathForResource:@"empty trash" ofType:@"aif"];
    
    
    NSURL *url2 = [NSURL fileURLWithPath:filePath2];
    
    NSError *error;
    
    self.audioPlayer2 = [[AVAudioPlayer alloc] initWithContentsOfURL:url2 error: &error];
    
    if (error) {
        
        NSLog(@"Error %@", error.description);
        
        return;
        
    }
    
    [self.audioPlayer2 prepareToPlay];
    
    // init
    self.fishImage = inFishImage;
    self.fishImageView = [[UIImageView alloc] initWithImage:self.fishImage];
    flagFlip = 0;
    imageTemp = [self.fishImageView image];
    moveDes = 0;

}

-(float) computeAngle : (CGPoint) desPoint {
    float angle = 0.0;
    CGPoint currentPoint;

    currentPoint = self.fishImageView.center;
    float b = fabsf(desPoint.y - currentPoint.y);
    float a = fabsf(desPoint.x - currentPoint.x);
    
    // left -> right
    if (self.start == 0) {
        
        if (desPoint.y > currentPoint.y) {
            angle = atan2f(b, a);
        }else if(desPoint.y < currentPoint.y) {
            angle = -atan2f(b, a);
        }
        
    }
    
    // right -> left
    if (self.start == 1) {
        
        if (desPoint.y > currentPoint.y) {
            angle = -atan2f(b, a);
        }else if(desPoint.y < currentPoint.y) {
            angle = atan2f(b, a);
        }
        
    }
    
    return angle;
}

-(void) move : (CGPoint) desPoint {

    if (moveDes == 0) {
        
        if (desPoint.x < 480 && self.start == 0) {
            
            desPoint.x = desPoint.x + 20;
            
            if (flagFlip == 1) {
                
                [self flipImage:self.fishImageView];
                [self.fishImageView setImage:imageTemp];
                flagFlip = 0;
                
            }
            
            [UIView animateWithDuration:self.speed animations:^{
                float random = arc4random()%40 + desPoint.y;// bien do
                
                self.pointDie = CGPointMake(desPoint.x, random);// tra ra toa do cua ca
                [self checkFishHook:self :self.hook];
                
                self.fishImageView.center = CGPointMake(desPoint.x, random);
            }completion:^(BOOL finished) {
                [self move:CGPointMake(desPoint.x, desPoint.y)];
            }];
            
        }else{
            // recreate loop
            self.start = 1;
            
            if (desPoint.x > 10 && self.start == 1) {
                
                desPoint.x = desPoint.x - 20;
                
                if (flagFlip == 0) {
                    
                    [self flipImage:self.fishImageView];
                    flagFlip = 1;
                    
                }
                
                
                [UIView animateWithDuration:self.speed animations:^{
                    float random = arc4random()%20 + desPoint.y;
                    
                    self.pointDie = CGPointMake(desPoint.x, random);//traratoa do cua ca
                    [self checkFishHook:self :self.hook];
                    
                    self.fishImageView.center = CGPointMake(desPoint.x, random);
                }completion:^(BOOL finished) {
                    [self move:CGPointMake(desPoint.x, desPoint.y)];
                }];
                
            }else{
                
                self.start = 0;
                
                [self move:CGPointMake(desPoint.x, desPoint.y)];
                
            }
            
        }

        
    }else if (moveDes == 1) {
        [UIView animateWithDuration:0.5f animations:^{
            
            [self.audioPlayer2 play];
            self.fishImageView.center = CGPointMake(self.hook.mySlider.value, 0);
            self.hook.imageView.center = CGPointMake(self.hook.mySlider.value, -120);
            
        }completion:^(BOOL finished) {
            // xoa
            [[self.fishImageView viewWithTag:self.fishImageView.tag] removeFromSuperview];
        
            
        }];
        
    }
        
}

-(void) flipImage : (UIImageView *) imageView {
    
    UIImage *flipped;
    
    
    if (flagFlip == 0) {
        
        flipped = [UIImage imageWithCGImage:[imageView image].CGImage scale:1.0 orientation:UIImageOrientationDownMirrored];
        
        [imageView setImage:flipped];
        
        CGAffineTransform tranform = imageView.transform;
        imageView.transform = CGAffineTransformRotate(tranform, -3.14);
        
    }
    
    if (flagFlip == 1) {
        
        CGAffineTransform tranform = imageView.transform;
        imageView.transform = CGAffineTransformRotate(tranform, -3.14);
        
        [imageView setImage:flipped];
        
        flipped = [UIImage imageWithCGImage:[imageView image].CGImage scale:1.0 orientation:UIImageOrientationDownMirrored];
    }
    
}

-(void) checkFishHook : (Fish *) inFish : (Hook *) inHook {
    CGPoint pointFish = [inFish pointDie];
    CGPoint pointTap = inHook.imageView.center;
    pointTap.y = pointTap.y + 170;
    
    if ((pointFish.x) > (pointTap.x - 15) && (pointFish.x) < (pointTap.x + 15)) {
        
//        NSLog(@"Inside");
        
        if (pointFish.y > (pointTap.y - 15) && pointFish.y < (pointTap.y + 25)) {
            
        
            // stop aniamting
            [self.fishImageView stopAnimating];
            // not animation
            moveDes = 1;
            // remove animation
//            [self.fishImageView.layer removeAllAnimations];
        
            // tranform
            CGAffineTransform tranform = inFish.fishImageView.transform;
            if (inFish.start == 0) {
                inFish.fishImageView.transform = CGAffineTransformRotate(tranform, -1.57);
            }
            if (inFish.start == 1) {
                inFish.fishImageView.transform = CGAffineTransformRotate(tranform,1.57);
            }
            
        
        }
    }
    
    
}

@end
