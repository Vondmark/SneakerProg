//
//  ViewController.m
//  ControlsAppDz
//
//  Created by Mark on 2/8/19.
//  Copyright © 2019 Mark. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController () <UIGestureRecognizerDelegate>
@property(weak,nonatomic) UIImageView* testImageView;
@property (assign,nonatomic) CGFloat testViewRotation;
@property (assign,nonatomic) CGFloat testViewScale;
@property (assign,nonatomic) CGPoint defoultPosition;

@end

typedef enum{
    Jordan1,
    Jordan3,
    Jordan14,
    Jordan12
    
} SneakerModelType;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.defoultPosition = self.sneakerPhotoView.center;
    
    UIRotationGestureRecognizer* rotationGesture =
    [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    rotationGesture.delegate = self;
    [self.view addGestureRecognizer:rotationGesture];
    
    UIPinchGestureRecognizer* pinchGesture =
    [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    pinchGesture.delegate = self;
    [self.view addGestureRecognizer:pinchGesture];
    
   
    [self refreshScreen];
    
}


#pragma mark - Methods


-(void) translationOnOrOff{
    if (self.translationSwitch.isOn) {
        [UIView animateWithDuration:2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.sneakerPhotoView.center = CGPointMake(CGRectGetMinX(self.backGroundView.bounds)+ CGRectGetWidth(self.sneakerPhotoView.frame)/2, self.backGroundView.center.y);
                         } completion:^(BOOL finished) {
                             //                                                      [self translationSwitchAction:sender];
                             [self translationViewInBackgrounView];
                         }];
    }else{
        [UIView animateWithDuration:2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.sneakerPhotoView.center = self.backGroundView.center;
                         } completion:^(BOOL finished) {
                             NSLog(@"finish");
                         }];
    }
}

-(void) translationViewInBackgrounView{
    if (self.translationSwitch.isOn) {
        [UIView animateWithDuration:2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             self.sneakerPhotoView.center = CGPointMake(CGRectGetMaxX(self.backGroundView.bounds) - CGRectGetWidth(self.sneakerPhotoView.frame)/2, self.backGroundView.center.y);
                         } completion:^(BOOL finished) {
                             if (self.translationSwitch.isOn) {
                                 [UIView animateWithDuration:2
                                                       delay:0
                                                     options:UIViewAnimationOptionCurveEaseInOut
                                                  animations:^{
                                                      self.sneakerPhotoView.center = CGPointMake(CGRectGetMinX(self.backGroundView.bounds)+ CGRectGetWidth(self.sneakerPhotoView.frame)/2, self.backGroundView.center.y);
                                                  } completion:^(BOOL finished) {
//                                                      [self translationSwitchAction:sender];
                                                      [self translationOnOrOff];
                                                  }];
                             }else{
                                 [UIView animateWithDuration:2
                                                       delay:0
                                                     options:UIViewAnimationOptionCurveEaseInOut
                                                  animations:^{
                                                      self.sneakerPhotoView.center = self.backGroundView.center;
                                                  } completion:^(BOOL finished) {
                                                      NSLog(@"finish");
                                                  }];
                             }
                         }];
    }
}


-(void) refreshScreen{
    
    UIImage* jordan1Image = [UIImage imageNamed:@"jordan_1"];
    UIImage* jordan3Image = [UIImage imageNamed:@"jordan_3"];
    UIImage* jordan14Image = [UIImage imageNamed:@"jordan_14"];
    UIImage* jordan12Image = [UIImage imageNamed:@"jordan_12"];
    
    
    if (self.segmentControllPhoto.selectedSegmentIndex == Jordan1) {
        [_sneakerPhotoView setImage:jordan1Image];
    }else if(self.segmentControllPhoto.selectedSegmentIndex == Jordan3){
        [_sneakerPhotoView setImage:jordan3Image];
    }else if(self.segmentControllPhoto.selectedSegmentIndex == Jordan14){
        [_sneakerPhotoView setImage:jordan14Image];
    }else if(self.segmentControllPhoto.selectedSegmentIndex == Jordan12){
        [_sneakerPhotoView setImage:jordan12Image];
    }
    
}

-(void)handleRotation:(UIRotationGestureRecognizer*) rotationGesture{
    
    if (rotationGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewRotation = 0;
    }
    
    CGFloat newRotation = rotationGesture.rotation - self.testViewRotation;
    
    CGAffineTransform currentTransform = self.testImageView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, newRotation);
    
    self.testImageView.transform = newTransform;
    
    self.testViewRotation = rotationGesture.rotation;
    
}


-(void) stopRotation: (UIView *) viewRotate rotationAngle: (CGFloat) angleRotate
       andFullCircle: (BOOL) fullCircle{
    
    CGAffineTransform currentTransform = viewRotate.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, angleRotate);
    
    [UIView animateKeyframesWithDuration:0.6
                                   delay:0.3
                                 options:UIViewAnimationOptionCurveEaseOut |  UIViewAnimationOptionBeginFromCurrentState
                              animations:^{
                                  
                                  viewRotate.transform = newTransform;
                              }
                              completion:^(BOOL finished) {
                                  
                                 
                                  
                                  
                                  NSLog(@"stop2");
                              }];
    
}
- (void) rotationView: (UIView *) viewRotate rotationAngle: (CGFloat) angleRotate
        andFullCircle: (BOOL) fullCircle {
    
    
    CGAffineTransform currentTransform = viewRotate.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, angleRotate);
    
    [UIView animateKeyframesWithDuration:0.6
                                   delay:0.3
                                 options:UIViewAnimationOptionCurveLinear |  UIViewAnimationOptionBeginFromCurrentState
                              animations:^{
                                  
                                  viewRotate.transform = newTransform;
                              }
                              completion:^(BOOL finished) {
                                  
                                  
                                  if(fullCircle){
                                      NSLog(@"rolling");
                                       [self rotationView:self.sneakerPhotoView rotationAngle:M_PI andFullCircle:true];

                                  }
                                  else if(!fullCircle) {
                                      //[self rotationView:self.sneakerPhotoView rotationAngle:-3.141592653 andFullCircle:false];

                                      
                                      NSLog(@"Stop");
                                  }
                              }];
}
//[self rotationView:minorView rotationAngle:angleRotate andFullCircle:true];

#pragma mark - Actions

- (IBAction)segmentSneakerAction:(UISegmentedControl *)sender {
    [self refreshScreen];
    if (sender.selectedSegmentIndex == 0) {
        sender.tintColor = [UIColor colorWithRed:0.11 green:0.61 blue:0.46 alpha:1];
    }else if (sender.selectedSegmentIndex == 1){
        sender.tintColor = [UIColor blackColor];
    }else if (sender.selectedSegmentIndex == 2){
        sender.tintColor = [UIColor redColor];
    }else if (sender.selectedSegmentIndex == 3) {
        sender.tintColor = [UIColor colorWithRed:0.38 green:0.20 blue:0.32 alpha:1];
    }
    
    [self refreshScreen];
    
}

- (IBAction)rotationSwitchAction:(UISwitch *)sender {
    
    
    
    if (sender.isOn) {
        [UIView animateWithDuration:1 - _speedSlider.value
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             self.sneakerPhotoView.transform = CGAffineTransformRotate(self.sneakerPhotoView.transform, M_PI);
                             NSLog(@"speed - %f", self.speedSlider.value);
                         } completion:^(BOOL finished) {
                             [self rotationSwitchAction:sender];
                         }];
        
    }
        
    
       
    
    
    
    
    
}

- (IBAction)scaleSwitchAction:(UISwitch *)sender {
    
    _scaleSlider.enabled = sender.isOn;
    CGFloat scaleValue = _scaleSlider.value;
    if (sender.isOn) {
        
        [UIView animateWithDuration:1
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.sneakerPhotoView.transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:1
                                               delay:0
                                             options:UIViewAnimationOptionCurveLinear
                                          animations:^{
                                              self.sneakerPhotoView.transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
                                          } completion:^(BOOL finished) {
                                              [UIView animateWithDuration:2
                                                               animations:^{
//                                                  sender.on = false;
                                              }];
                                              
                                          }];
                     }];
        
        
    }
}

- (IBAction)translationSwitchAction:(UISwitch *)sender {
//    CGPoint defoultPosition = CGPointMake(CGRectGetWidth(self.sneakerPhotoView.bounds)+100,
//                                          self.sneakerPhotoView.bounds.origin.y);
    [self translationViewInBackgrounView];
}

- (IBAction)scaleSliderAction:(UISlider *)sender {
    
    CGFloat scaleValue = _scaleSlider.value;
    self.sneakerPhotoView.transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
}

- (IBAction)speedSliderAction:(UISlider *)sender {
}
#pragma mark - Gesture
-(void) handlePinch:(UIPinchGestureRecognizer*) pinchGesture{
    NSLog(@"handlePinch %1.3f", pinchGesture.scale);
    
    if (pinchGesture.state == UIGestureRecognizerStateBegan) {
        self.testViewScale = 1.f;
    }
    
//    CGSize frameSize = CGSizeMake(300, 300);
    
  
    
    
    CGFloat newScale = 1 + pinchGesture.scale - self.testViewScale;
    CGAffineTransform currentTransform = self.sneakerPhotoView.transform;
    CGAffineTransform newTransform =
    CGAffineTransformScale(currentTransform, newScale, newScale);
    
    self.sneakerPhotoView.transform = newTransform;
    
    self.testViewScale = pinchGesture.scale;
    [UIView animateWithDuration:1
                     animations:^{
                         self.scaleSwitch.on = true;
                         self.scaleSlider.enabled = TRUE;
                     }];
    [UIView animateWithDuration:1
                     animations:^{
                         CGFloat scaleValue = self.scaleSlider.value;
                         self.sneakerPhotoView.transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
                     }];
}
    


#pragma mark - UIGestureRecognizer

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}



- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return [gestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]];
}


@end
