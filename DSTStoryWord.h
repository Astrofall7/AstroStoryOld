//
//  DSTStoryWord.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/23/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum PARTS_OF_SPEECH{NOUN=1,PRONOUN=2,VERB=3,ADVERB=4,ADJECTIVE=5}Speech;
@interface DSTStoryWord : NSMutableString
@property  NSMutableString *word;
@property  NSMutableArray *comparables;
@property  Speech partOfSpeech;
-(id)initWithString:(NSString *)aString;
@end
