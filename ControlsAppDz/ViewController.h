//
//  ViewController.h
//  ControlsAppDz
//
//  Created by Mark on 2/8/19.
//  Copyright © 2019 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *backGroundView;
@property (weak, nonatomic) IBOutlet UIImageView *sneakerPhotoView;
@property (weak, nonatomic) IBOutlet UISwitch *rotationSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *scaleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *translationSwitch;
@property (weak, nonatomic) IBOutlet UISlider *speedSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControllPhoto;
- (IBAction)segmentSneakerAction:(UISegmentedControl *)sender;
- (IBAction)rotationSwitchAction:(UISwitch *)sender;
- (IBAction)scaleSwitchAction:(UISwitch *)sender;
- (IBAction)translationSwitchAction:(UISwitch *)sender;
- (IBAction)scaleSliderAction:(UISlider *)sender;
- (IBAction)speedSliderAction:(UISlider *)sender;

@end

