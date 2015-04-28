//
//  DSTStoryFormatterEnhanced.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/22/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "DSTStoryFormatterEnhanced.h"
#import "DSTStoryWord.h"
@implementation DSTStoryFormatterEnhanced
-(NSString *)correctSentence:(NSString *)sentence{
    NSArray *sentStruct = [sentence componentsSeparatedByString:@" "];
    NSMutableArray *anArray = [self correctSpeech:(NSMutableArray *)sentStruct];
    NSMutableString *firstWord = [anArray objectAtIndex:0];
    NSString *firstPart = [firstWord substringToIndex:1];
    firstPart = [firstPart uppercaseString];
    NSString *secondPart = [firstWord substringFromIndex:1];
    NSString *newString = [NSString stringWithFormat:@"%@%@",firstPart,secondPart];
    for(int i = 1; i< [sentStruct count]; i++){
        newString = [newString stringByAppendingString:@" "];
        newString = [newString stringByAppendingString:(NSString *)[anArray objectAtIndex:i]];
    }
    return newString;
}
-(NSMutableArray *)correctSpeech:(NSMutableArray *)words{
    //this method is used to distinguish proper nouns from other ones. However, this can and will be expanded
    //to take into account multiple parts of speech.
    NSMutableArray *newArray = [[NSMutableArray alloc]initWithCapacity:[words count]];
    for(int i = 0;i < [words count];i++){
        newArray[i] = [[[DSTStoryWord alloc]initWithString:(NSString *)words[i]]description];
    }
    return newArray;
}
@end
