//
//  DSTStory.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/20/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DSTConceptNetter,DSTStoryFormatterEnhanced,DSTStoryCreator;
@interface DSTStory : NSObject
@property  NSString *title;
@property  NSMutableDictionary *theStory;
@property  NSString *URLtoSend;
@property  DSTConceptNetter *retriever;
@property  DSTStoryCreator *creator;
@property  DSTStoryFormatterEnhanced *press;
-(id)initWithTitle:(NSString *)theTitle;
-(NSMutableDictionary *)getJSON;
-(void)registerForNotifications;
-(void)prepareWords;
-(void)prepareStory;
-(void)URLFailure:(NSNotification *)failure;
-(void)parseStory:(NSString *)line;
@end
