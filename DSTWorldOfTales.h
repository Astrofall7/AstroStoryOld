//
//  DSTWorldOfTales.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/26/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DSTStory,DSTPlayer;
@interface DSTWorldOfTales : NSObject
@property (strong) DSTStory *bookOfStories;
@property (strong) DSTPlayer *mainPlayer;
+(DSTWorldOfTales *)createWorld;
-(void)createTheStory;


@end
