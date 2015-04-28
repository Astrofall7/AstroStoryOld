//
//  HomeViewController.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/27/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DSTStory,DSTWorldOfTales,AppDelegate,DSTPlayer;
@interface HomeViewController : UIViewController
@property IBOutlet UIImageView *logo;
@property IBOutlet UIButton *createNewStory;
@property IBOutlet UIButton *startStory;
@property IBOutlet UIButton *options;
@property IBOutlet UIView *mainView;
@property (weak,nonatomic) AppDelegate *mainDelegate;
@property (weak,nonatomic) DSTStory *evilCandyTale;
@property (nonatomic) DSTWorldOfTales *theWorld;
@property (weak,nonatomic) DSTPlayer *thePlayer;
-(IBAction)createStory:(id)sender;
-(IBAction)startTheStory:(id)sender;
-(IBAction)goToOptions:(id)sender;
@end
