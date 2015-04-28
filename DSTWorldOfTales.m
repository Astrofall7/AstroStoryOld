//
//  DSTWorldOfTales.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/26/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "DSTWorldOfTales.h"
#import "DSTStory.h"
#import "DSTPlayer.h"
@implementation DSTWorldOfTales
@synthesize bookOfStories,mainPlayer;
-(id)init{
    self = [super init];
    if(self){
        bookOfStories = [[DSTStory alloc]initWithTitle:@"FirstStory!"];
        mainPlayer = [[DSTPlayer alloc]init];
    }
    return self;
}
-(void)createTheStory{
    [bookOfStories prepareWords];
    [bookOfStories prepareStory];
}
+(DSTWorldOfTales *)createWorld{
    static DSTWorldOfTales *theWorld = nil;
    if(!theWorld){
        theWorld = [[[self class]alloc]init];
    }
    return theWorld;
}

@end
