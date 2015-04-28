//
//  DSTPageViewController.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/26/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DSTStoryPage,AppDelegate;
@interface DSTPageViewController : UIViewController
@property NSUInteger pageIndex;
@property DSTStoryPage *theTraveler;
@property  NSString *theTitle;
@property  IBOutlet UITextView *currentText;
@property   NSString *text;
@property  id dataObject;
@property int buttonVisible;
@property  IBOutlet UISegmentedControl *options;
@property  IBOutlet UIView *buttonView;
-(IBAction)selectorIsClicked:(id)sender;
@property AppDelegate *mainDelegate;
@property  IBOutlet UIImageView *agent;
@property  NSBundle *regularBundle;
@end
