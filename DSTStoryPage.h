//
//  DSTStoryPage.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/28/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSTStoryPage : NSObject
@property NSMutableString *pageContent;
@property (nonatomic) BOOL hasBranch;

-(id)initWithContent:(NSString *)content;
-(id)initWithContent:(NSString *)content andBranchable:(BOOL)answer;
-(void)addToNext:(DSTStoryPage *)nextField;
@end
