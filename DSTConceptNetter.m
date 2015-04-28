//
//  DSTConceptNetter.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/21/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "DSTConceptNetter.h"
#import "DSTStoryWord.h"
@implementation DSTConceptNetter
@synthesize dataLink,requestLink,words,packet;
-(id)initWithURL:(NSString *)theURL{
    self = [super init];
    if(self){
        requestLink = theURL;
        dataLink = [[NSData alloc]init];
        packet = [[NSURL alloc]init];
    }
    return self;
}
-(NSMutableArray *)resultingConcepts:(NSMutableArray *)wordsToSend{
    words = [[NSMutableArray alloc]initWithCapacity:10];
    NSString *holder;NSMutableArray *possible;
    @try{
    for(int i = 0; i < [wordsToSend count]; i++){
        holder = requestLink;
        holder = [holder stringByAppendingString:[NSString stringWithFormat:@"%@&limit=3",(NSString *)wordsToSend[i]]];
        packet = [[NSURL alloc]initWithString:holder];
        /*
         
         dataLink is the call to conceptnet.
         */
        dataLink = [NSData dataWithContentsOfURL:packet];
        if(dataLink){
        NSDictionary *returns = [NSJSONSerialization JSONObjectWithData:dataLink options:NSJSONReadingMutableContainers error:nil];
        //conceptnet returns a lot of things, but we just want the words.
        //these are the edges that connected to our word.
        possible = [returns objectForKey:@"edges"];
        int randomNum = arc4random() % [possible count];
        NSDictionary *contents = possible[randomNum];//we want to get one word only.
        NSString *theWord = [[NSString alloc]initWithString:[NSString stringWithFormat:@"%@",[contents objectForKey:@"startLemmas"]]];
        [words addObject:theWord];//this is the actual word.
        }
        else{
            NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DSTStory" ofType:@"json"];
            NSData *jsonGet = [NSData dataWithContentsOfFile:filePath];
            NSMutableDictionary *myStory = [NSJSONSerialization JSONObjectWithData:jsonGet options:NSJSONReadingMutableContainers error:nil];
            
            possible = [myStory objectForKey:@""];
        }
    }
    }
    //if there is no internet available, an exception is likely to be thrown--handle here.
    @catch(NSException *e){
        [[NSNotificationCenter defaultCenter]postNotificationName:@"URLFailed." object:self];
    }
    return words;
}
@end
