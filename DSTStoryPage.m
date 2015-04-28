//
//  DSTStoryPage.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/28/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "DSTStoryPage.h"

@implementation DSTStoryPage
@synthesize hasBranch,pageContent;
-(id)init{
    self = [super init];
    if(self){
       
    }
    return self;
}
-(id)initWithContent:(NSString *)content{
    self = [super init];
    if(self){
        pageContent = [[NSMutableString alloc]initWithString:content];
    }
    return self;
}
-(id)initWithContent:(NSString *)content andBranchable:(BOOL)answer{
    self = [self initWithContent:content];
    self.hasBranch = answer;
    return self;
}
-(void)addToNext:(DSTStoryPage *)nextField{

}
-(NSString *)description{
    return (NSString *)self.pageContent;
}
@end
