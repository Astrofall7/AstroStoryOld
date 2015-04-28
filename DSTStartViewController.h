//
//  DSTStartViewController.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/26/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AppDelegate,DSTStory,DSTStoryPage;
@interface DSTStartViewController : UIViewController<UIPageViewControllerDelegate>
@property (nonatomic) UIPageViewController *pageController;
@property (nonatomic) DSTStoryPage *mainRunner;
@property (weak,nonatomic) AppDelegate *mainDelegate;
@end
