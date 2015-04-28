//
//  DSTStoryCreator.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/21/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DSTStory,DSTStoryFormatterEnhanced,AppDelegate;
@interface DSTStoryCreator : NSObject
@property  NSMutableArray *words;
@property  NSMutableArray *story;
@property  DSTStoryFormatterEnhanced *formatter;
@property (weak,nonatomic) AppDelegate *mainDelegate;
-(id)initWithWords:(NSMutableArray *)theWords andStory:(NSMutableArray *)theStory;
-(NSMutableDictionary *)makeStory:(DSTStory *)theStory;

@end
