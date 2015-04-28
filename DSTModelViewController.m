//
//  DSTModelViewController.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/26/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "DSTModelViewController.h"
#import "DSTPageViewController.h"
#import "AppDelegate.h"
#import "DSTStory.h"
#import "DSTWorldOfTales.h"
#import "DSTStoryPage.h"
#import "DSTPlayer.h"
@interface DSTModelViewController ()
@property (nonatomic) NSMutableArray *pageData;
@property (nonatomic) NSMutableArray *pageDataAlt;
@property (nonatomic) NSMutableArray *pageDataAltV2;
@property (nonatomic)NSMutableArray *path;
@end

@implementation DSTModelViewController
@synthesize mainDelegate,theWorld,theStory,mainTravelBase,thePlayer,branchFlag,pageIndex;
@synthesize pageData = _pageData,pageDataAlt = _pageDataAlt,pageDataAltV2 = _pageDataAltV2,
            path = _path;
-(instancetype)init{
    self = [super init];
    if(self){
        mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
        theWorld = [mainDelegate theWorld];
        theStory = [theWorld bookOfStories];
        mainTravelBase = mainDelegate.theIterator;
        branchFlag = 1;
        _pageData = [[[theStory theStory]objectForKey:@"EvilCandy"]objectForKey:@"StoryMain"];
        _pageDataAlt = [[[theStory theStory]objectForKey:@"EvilCandy"]objectForKey:@"AltStory"];
        _pageDataAltV2 =[[[theStory theStory]objectForKey:@"EvilCandy"]objectForKey:@"AltStoryV2"];
        _path = [[NSMutableArray alloc]initWithCapacity:10];
        _path = _pageData;
        pageIndex = 0;
        [self registerForNotifications];
    }
    return self;
}
- (DSTPageViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    // Return the data view controller for the given index.
    
    DSTPageViewController *dataViewController;
   
    dataViewController  = [storyboard instantiateViewControllerWithIdentifier:@"PageContent"];
    if(branchFlag == 1){
        dataViewController.buttonVisible = 1;
    }
    else{
        dataViewController.buttonVisible = 0;
    }
    if(index>=[self.path count]){
        return nil;
    }
    dataViewController.dataObject = [self.path[index]description];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(DSTPageViewController *)viewController {
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}
#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    if (pageIndex== 0) {
        return nil;
    }
    pageIndex--;
    mainTravelBase = self.path[pageIndex];
    if(mainTravelBase.hasBranch){
        branchFlag = 1;
    }
    else{
        branchFlag = 0;
    }
    return [self viewControllerAtIndex:pageIndex storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    pageIndex++;
    if (pageIndex == [self.pageData count]) {
        return nil;
    }
    mainTravelBase = self.path[pageIndex];
    if(mainTravelBase.hasBranch){
        branchFlag = 1;
    }
    else{
        branchFlag = 0;
    }
    return [self viewControllerAtIndex:pageIndex storyboard:viewController.storyboard];
}
-(void)responseOne:(NSNotification *)theNote{
    _path = _pageData;
    branchFlag = 0;
}
-(void)responseTwo:(NSNotification *)theNote{
    _path = _pageDataAlt;
    branchFlag = 0;
}
-(void)responseThree:(NSNotification *)theNote{
    _path = _pageDataAltV2;
    branchFlag = 0;
}
-(void)registerForNotifications{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(responseOne:) name:@"Path 1 Chosen" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(responseTwo:) name:@"Path 2 Chosen" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(responseThree:) name:@"Path 3 Chosen" object:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
