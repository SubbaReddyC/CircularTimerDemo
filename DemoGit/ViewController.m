//
//  ViewController.m
//  DemoGit
//
//  Created by admin on 14/09/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int countDown;
    NSTimer *countDownTimer;
}
@property (nonatomic, strong) CAShapeLayer *circle;
@property (weak, nonatomic) IBOutlet UIView *circularView;
@property (nonatomic, strong) CABasicAnimation *drawAnimation;

@property (nonatomic) NSInteger counterPrivateVar;
@property (nonatomic, retain) NSTimer *countDownTimer;

@property (nonatomic, strong) UILabel *fromLabel;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    int radius = 50;
    _circle = [CAShapeLayer layer];
    // Make a circular shape
    _circle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*radius, 2.0*radius)
                                             cornerRadius:radius].CGPath;
    // Configure the apperence of the circle
    _circle.fillColor = [UIColor clearColor].CGColor;
    _circle.strokeColor = [UIColor redColor].CGColor;
    _circle.lineWidth = 2;

    [_circularView.layer addSublayer:_circle];
    [self startAnimateWithDuration:5];
    [self startCountDown];

}

- (void) startCountDown {
    countDown = 5;
    _lblCount.text = [NSString stringWithFormat:@"%d", countDown];
   _lblCount.hidden = FALSE;
    if (!countDownTimer) {
        self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1.00
                                                               target:self
                                                             selector:@selector(updateTime:)
                                                             userInfo:nil
                                                            repeats:YES];
    }
}

- (void)updateTime:(NSTimer *)timerParam {
    countDown--;
    if(countDown == 0) {
        [self clearCountDownTimer];
        //do whatever you want after the countdown
    }
    _lblCount.text = [NSString stringWithFormat:@"%d", countDown];
}
-(void) clearCountDownTimer {
    [countDownTimer invalidate];
    countDownTimer = nil;
    _lblCount.hidden = TRUE;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)circleAnimation
//{
//    // Configure animation
//    self.drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    self.drawAnimation.duration            = 10.0;
//    self.drawAnimation.repeatCount         = 1.0; // Animate only once..
//
//
//    // Animate from no part of the stroke being drawn to the entire stroke being drawn
//    self.drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
//
//    // Set your to value to one to complete animation
//    self.drawAnimation.toValue   = [NSNumber numberWithFloat:1.0f];
//
//    // Experiment with timing to get the appearence to look the way you want
//    self.drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//
//    // Add the animation to the circle
//    [self.circle addAnimation:_drawAnimation forKey:@"draw"];
//}

-(void)startAnimateWithDuration:(NSTimeInterval)duration {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = duration * 2;
    animation.removedOnCompletion = YES;
    animation.values = @[@(1.0), @(0.0), @(0.0)];
    animation.keyTimes =  @[@(0.0), @(0.5), @(1.0)];
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [_circle addAnimation:animation forKey:@"drawCircleAnimation"];
}

@end
