//
//  DSTModelViewController.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/26/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DSTPageViewController,AppDelegate,DSTStory,DSTWorldOfTales,DSTStoryPage,DSTPlayer;
@interface DSTModelViewController : NSObject<UIPageViewControllerDataSource>
@property NSUInteger pageIndex;
@property (weak,nonatomic) DSTStory *theStory;
@property (weak,nonatomic) AppDelegate *mainDelegate;
@property (weak,nonatomic) DSTStoryPage *mainTravelBase;
@property (weak,nonatomic)DSTWorldOfTales *theWorld;
@property (weak,nonatomic) DSTPlayer *thePlayer;
@property int branchFlag;
-(DSTPageViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyBoard;
-(NSUInteger)indexOfViewController:(DSTPageViewController *)DSTStoryController;
-(void)responseOne:(NSNotification *)theNote;
-(void)responseTwo:(NSNotification *)theNote;
-(void)responseThree:(NSNotification *)theNote;
-(void)registerForNotifications;
@end
