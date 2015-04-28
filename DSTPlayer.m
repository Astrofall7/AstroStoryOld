//
//  DSTPlayer.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/29/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "DSTPlayer.h"
#import "DSTStoryPage.h"
@implementation DSTPlayer
@synthesize pathTraveled,currentPage;
-(id)init{
    self = [super init];
    if(self){
        pathTraveled = [[NSMutableArray alloc]initWithCapacity:10];
        currentPage = [[DSTStoryPage alloc]init];
    }
    return self;
}

@end
