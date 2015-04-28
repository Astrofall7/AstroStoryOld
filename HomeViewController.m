//
//  HomeViewController.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/27/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "HomeViewController.h"
#import "AppDelegate.h"
#import "DSTStory.h"
#import "DSTWorldOfTales.h"
#import "DSTStoryPage.h"
#import "DSTPlayer.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize mainDelegate,evilCandyTale,theWorld,startStory,createNewStory,options,thePlayer;
- (void)viewDidLoad {
    [super viewDidLoad];
    mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    theWorld = mainDelegate.theWorld;
    startStory.enabled = NO;
    thePlayer = mainDelegate.theWorld.mainPlayer;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)createStory:(id)sender{
    [theWorld createTheStory];
    startStory.enabled = YES;
}
-(IBAction)startTheStory:(id)sender{
    
}
-(IBAction)goToOptions:(id)sender{
    
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
