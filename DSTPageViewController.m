//
//  DSTPageViewController.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/26/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "DSTPageViewController.h"
#import "DSTStoryPage.h"
#import "AppDelegate.h"

@implementation DSTPageViewController
@synthesize currentText,theTitle,theTraveler,options,buttonView,buttonVisible,mainDelegate,agent,regularBundle;
- (void)viewDidLoad {
    [super viewDidLoad];
    options = [[UISegmentedControl alloc]initWithItems:@[@"Path 1",@"Path 2",@"Path 3",@"Path 4"]];
    regularBundle = [NSBundle mainBundle];
    UIImage *thePicture = [[UIImage alloc]initWithData:[[NSData alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"AgentBackground2" ofType:@"png"]]];
    [agent setImage:thePicture];
    currentText.text = [self.dataObject description];
    
    if(buttonVisible == 0){
        [self.buttonView setHidden:YES];
    }
    else{
        [self.buttonView setHidden:NO];
        [options setTitle:@"Choice 1" forSegmentAtIndex:0];
        [options setTitle:@"Choice 2" forSegmentAtIndex:1];
        [options setTitle:@"Choice 3" forSegmentAtIndex:2];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(IBAction)selectorIsClicked:(UISegmentedControl *)sender{
    if(sender.selectedSegmentIndex == 0){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Path 1 Chosen" object:self];
    }
    else if(sender.selectedSegmentIndex == 1){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Path 2 Chosen" object:self];
    }
    if(sender.selectedSegmentIndex == 2){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"Path 3 Chosen" object:self];
    }
}
@end
