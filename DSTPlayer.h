//
//  DSTPlayer.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/29/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AppDelegate,DSTStory,DSTStoryPage;
@interface DSTPlayer : NSObject
@property (nonatomic) NSMutableArray *pathTraveled;
@property (nonatomic) DSTStoryPage *currentPage;
@end
