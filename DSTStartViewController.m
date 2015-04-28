//
//  DSTStartViewController.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/26/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "DSTStartViewController.h"
#import "DSTModelViewController.h"
#import "DSTStory.h"
#import "DSTStoryPage.h"
#import "DSTPageViewController.h"
#import "AppDelegate.h"
@interface DSTStartViewController ()
@property (readonly, strong, nonatomic) DSTModelViewController *modelController;
@end

@implementation DSTStartViewController
@synthesize modelController = _modelController;
@synthesize mainRunner,mainDelegate;
- (void)viewDidLoad {
    [super viewDidLoad];
     mainDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    self.pageController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.delegate = self;
    DSTPageViewController *startingPage = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
    
    NSArray *viewControllers = @[startingPage];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.pageController.dataSource = self.modelController;
    [self addChildViewController:self.pageController];
    [self.view addSubview:self.pageController.view];
   // CGRect pageViewRect = self.view.bounds;
   // self.pageController.view.frame = pageViewRect;
    [self.pageController didMoveToParentViewController:self];
    self.view.gestureRecognizers = self.pageController.gestureRecognizers;
}
- (DSTModelViewController *)modelController {
    // Return the model controller object, creating it if necessary.
    // In more complex implementations, the model controller may be passed to the view controller.
    if (!_modelController) {
        _modelController = [[DSTModelViewController alloc] init];
    }
    return _modelController;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    NSLog(@"Our time grows short...");
    // Dispose of any resources that can be recreated.
}
- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
    // Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
    UIViewController *currentViewController = self.pageController.viewControllers[0];
    NSArray *viewControllers = @[currentViewController];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    self.pageController.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
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
