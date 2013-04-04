//
//  ViewController.m
//  NewGameFish
//
//  Created by MAC on 4/2/13.
//  Copyright (c) 2013 MAC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) Hook *myHook;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // create music
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"re" ofType:@"aif"];
    
    NSURL *url = [NSURL fileURLWithPath:filePath];

    
    NSError *error;
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: &error];
    
    if (error) {
        
        NSLog(@"Error %@", error.description);
        
        return;
 
    }
    
    [self.audioPlayer prepareToPlay];

    // end create music
    
    // create image left -> right
    UIImage *fishImage01 = [UIImage imageNamed:@"fish01.png"];
    UIImage *fishImage02 = [UIImage imageNamed:@"fish02.png"];
    UIImage *fishImage03 = [UIImage imageNamed:@"fish03.png"];
    UIImage *fishImage04 = [UIImage imageNamed:@"fish04.png"];
    UIImage *fishImage05 = [UIImage imageNamed:@"fish05.png"];
    UIImage *fishImage10 = [UIImage imageNamed:@"fish10.png"];
    UIImage *fishImage20 = [UIImage imageNamed:@"fish20.png"];
    UIImage *fishImage30 = [UIImage imageNamed:@"fish30.png"];
    UIImage *fishImage40 = [UIImage imageNamed:@"fish40.png"];
    UIImage *fishImage50 = [UIImage imageNamed:@"fish50.png"];
    
    
    self.fish1 = [[Fish alloc] init];
    self.fish2 = [[Fish alloc] init];
    self.fish3 = [[Fish alloc] init];
    self.fish4 = [[Fish alloc] init];
    self.fish5 = [[Fish alloc] init];
    self.fish6 = [[Fish alloc] init];
    self.fish7 = [[Fish alloc] init];
    self.fish8 = [[Fish alloc] init];
    self.fish9 = [[Fish alloc] init];
    self.fish10 = [[Fish alloc] init];
    
    // start left -> right
    self.fish1.start = 0;
    self.fish2.start = 0;
    self.fish3.start = 0;
    self.fish4.start = 0;
    self.fish5.start = 0;
    self.fish6.start = 0;
    self.fish7.start = 0;
    self.fish8.start = 0;
    self.fish9.start = 0;
    self.fish10.start = 0;
    
    // speed
    self.fish1.speed = 1.5f;
    self.fish2.speed = 1.0f;
    self.fish3.speed = 0.8f;
    self.fish4.speed = 2.2f;
    self.fish5.speed = 1.5f;
    self.fish6.speed = 0.7f;
    self.fish7.speed = 1.7f;
    self.fish8.speed = 1.3f;
    self.fish9.speed = 0.6f;
    self.fish10.speed = 3.0f;

    
    [self.fish1 constructorFishImage:fishImage01];
    [self.fish2 constructorFishImage:fishImage02];
    [self.fish3 constructorFishImage:fishImage03];
    [self.fish4 constructorFishImage:fishImage04];
    [self.fish5 constructorFishImage:fishImage05];
    [self.fish6 constructorFishImage:fishImage10];
    [self.fish7 constructorFishImage:fishImage20];
    [self.fish8 constructorFishImage:fishImage30];
    [self.fish9 constructorFishImage:fishImage40];
    [self.fish10 constructorFishImage:fishImage50];
    
    self.fish1.fishImageView.center = CGPointMake(0, 50);
    self.fish1.fishImageView.tag = 1;
    self.fish2.fishImageView.center = CGPointMake(-10, 100);
    self.fish2.fishImageView.tag = 2;
    self.fish3.fishImageView.center = CGPointMake(0, 200);
    self.fish3.fishImageView.tag = 3;
    self.fish4.fishImageView.center = CGPointMake(-30, 250);
    self.fish4.fishImageView.tag = 4;
    self.fish5.fishImageView.center = CGPointMake(10, 280);
    self.fish5.fishImageView.tag = 5;
    self.fish6.fishImageView.center = CGPointMake(-5, 30);
    self.fish6.fishImageView.tag = 6;
    self.fish7.fishImageView.center = CGPointMake(0, 80);
    self.fish7.fishImageView.tag = 7;
    self.fish8.fishImageView.center = CGPointMake(0, 75);
    self.fish8.fishImageView.tag = 8;
    self.fish9.fishImageView.center = CGPointMake(-20, 130);
    self.fish9.fishImageView.tag = 9;
    self.fish10.fishImageView.center = CGPointMake(0, 220);
    self.fish10.fishImageView.tag = 10;
    
    [self.view addSubview:self.fish1.fishImageView];
    [self.view addSubview:self.fish2.fishImageView];
    [self.view addSubview:self.fish3.fishImageView];
    [self.view addSubview:self.fish4.fishImageView];
    [self.view addSubview:self.fish5.fishImageView];
    [self.view addSubview:self.fish6.fishImageView];
    [self.view addSubview:self.fish7.fishImageView];
    [self.view addSubview:self.fish8.fishImageView];
    [self.view addSubview:self.fish9.fishImageView];
    [self.view addSubview:self.fish10.fishImageView];
	
    //create image for hook
    UIImage *hookImage = [UIImage imageNamed:@"hook.png"];
    self.myHook = [[Hook alloc] init];
    
    // slider
    self.mySlider.maximumValue = 480;
    self.mySlider.minimumValue = 0;
    self.mySlider.value = 200;
    [self.mySlider addTarget:self action:@selector(chageValue:) forControlEvents:UIControlEventValueChanged];
    
    
    // constructor Hook
    [self.myHook constructor:self.mySlider andHookImage: hookImage];
    // create tap for self.view with selector : dragHook
    self.myTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dragHook:)];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:self.myTap];
    // default
    self.myHook.imageView.center = CGPointMake(self.mySlider.value, self.mySlider.frame.size.height - 120);
    // add hook to self.view
    [self.view addSubview: [self.myHook imageView]];
    // flag = 0 : drag, flag = 1 : not drag
    self.flagDrag = 0; // drag
    
    self.fish1.hook = self.myHook;
    self.fish2.hook = self.myHook;
    self.fish3.hook = self.myHook;
    self.fish4.hook = self.myHook;
    self.fish5.hook = self.myHook;
    self.fish6.hook = self.myHook;
    self.fish7.hook = self.myHook;
    self.fish8.hook = self.myHook;
    self.fish9.hook = self.myHook;
    self.fish10.hook = self.myHook;
    
    
    [self fishStart];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// auto rotate landscape
- (BOOL)shouldAutorotate {
    return YES;
}
-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeLeft;
}



-(void) chageValue: (id) sender {

    self.myHook.imageView.center = CGPointMake(self.mySlider.value, self.mySlider.frame.size.height - 120);
    
}

-(void) dragHook : (id) sender {
    
    CGPoint locationTap = [self.myTap locationInView:self.imageView];
    self.myHook.desClick = locationTap.y;
    
    float h = locationTap.y - 170;
//    NSLog(@"h = %f", h);
//    [UIView animateWithDuration:0.3f animations:^{
        [self.audioPlayer play];
//    }];

    [UIView animateWithDuration:1.0f animations:^{
    
        
        self.myHook.imageView.center = CGPointMake(self.mySlider.value, self.mySlider.frame.size.height + h);
        
    }completion:^(BOOL finished) {
        
        
//        NSLog(@"destination");
//        [UIView animateWithDuration:1.0f animations:^{
//            
//            self.myHook.imageView.center = CGPointMake(self.mySlider.value, -100);
//            
//        }completion:^(BOOL finished) {
//            // no thing
//            self.myHook.flagHookDes = 0;// di qua
//            NSLog(@"Da di qua");
//        }];
        
    }];
    
}



// start fish move
-(void) fishStart {
    float x = 0;

    [self.fish1 move:CGPointMake(x, 50)];
    [self.fish2 move:CGPointMake(x, 100)];
    [self.fish3 move:CGPointMake(x, 200)];
    [self.fish4 move:CGPointMake(x, 250)];
    [self.fish5 move:CGPointMake(x, 280)];
    [self.fish6 move:CGPointMake(x, 30)];
    [self.fish7 move:CGPointMake(x, 80)];
    [self.fish8 move:CGPointMake(x, 75)];
    [self.fish9 move:CGPointMake(x, 130)];
    [self.fish10 move:CGPointMake(x, 220)];
    
}



@end
