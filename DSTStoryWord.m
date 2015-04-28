//
//  DSTStoryWord.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/23/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//  This class is a fruit of parse tree research. Using special tags that indicate a word's status grammatically,
//  it can parse words and place them in more intimate meanings.
//

#import "DSTStoryWord.h"

@implementation DSTStoryWord
@synthesize word,partOfSpeech,comparables,superclass;
-(id)initWithString:(NSString *)aString{
    self = [super init];
    if(self){
        word = [[NSMutableString alloc]initWithString:aString];
        NSString *speechParts = @"<N> <PN> <AD> <AJ> <P> <I> <PPN>";
        comparables = [[NSMutableArray alloc]initWithArray:[speechParts componentsSeparatedByString:@" "]];
        for(int i = 0; i < [comparables count]; i++){
            if([word length]>=4){
            NSString *temp = [word substringToIndex:3];
            if([temp isEqualToString:(NSString *)comparables[i]]){
                if([(NSString *)comparables[i] isEqualToString:@"<N>"]){
                    word = (NSMutableString *)[word substringFromIndex:3];
                    temp = [word substringToIndex:1];
                    temp = [temp uppercaseString];
                    word = (NSMutableString*)[temp stringByAppendingString:(NSMutableString *)[word substringFromIndex:1]];
                    partOfSpeech = NOUN;
                    break;
                }
            }
            }
        }
    }
    return self;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@",word];
}
@end
