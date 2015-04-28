//
//  DSTConceptNetter.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/21/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DSTStoryWord;
@interface DSTConceptNetter : NSObject
@property  NSString *requestLink;
@property  NSData *dataLink;
@property  NSURL *packet;
@property  NSMutableArray *words;
-(NSMutableArray *)resultingConcepts:(NSMutableArray *)wordsToSend;
-(id)initWithURL:(NSString *)theURL;
@end
