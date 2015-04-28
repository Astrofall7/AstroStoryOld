//
//  DSTStoryFormatterEnhanced.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/22/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSTStoryFormatterEnhanced : NSObject
-(NSString *)correctSentence:(NSString *)theSentence;
-(NSMutableArray *)correctSpeech:(NSMutableArray *)words;

@end
