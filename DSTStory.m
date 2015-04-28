//
//  DSTStory.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/20/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "DSTStory.h"
#import "DSTConceptNetter.h"
#import "DSTStoryCreator.h"
#import "DSTStoryFormatterEnhanced.h"
@implementation DSTStory
@synthesize theStory,title,retriever,URLtoSend,press,creator;

-(id)init{
    return [self initWithTitle:@"No title."];
}
-(id)initWithTitle:(NSString *)theTitle{
    self = [super init];
    if(self){
        theStory = [[[NSMutableDictionary alloc]initWithDictionary:[self getJSON]]objectForKey:@"StoryObject"];
        //title = [[NSString alloc]initWithString:[theStory objectForKey:@""]];
        retriever = [[DSTConceptNetter alloc]initWithURL:@"http://conceptnet5.media.mit.edu/data/5.2/search?rel=/r/IsA&end=/c/en/"];
        creator = [[DSTStoryCreator alloc]init];
        [self registerForNotifications];
    }
    return self;
}
-(NSMutableDictionary *)getJSON{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DSTStory" ofType:@"json"];
    NSData *jsonGet = [NSData dataWithContentsOfFile:filePath];
    NSMutableDictionary *myStory = [NSJSONSerialization JSONObjectWithData:jsonGet options:NSJSONReadingMutableContainers error:nil];
    return myStory;
}

-(void)registerForNotifications{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(URLFailure:) name:@"URLFailed." object:nil];
}
-(void)prepareWords{
    NSMutableDictionary *collection = [[NSMutableDictionary alloc]initWithDictionary:[theStory objectForKey:@"EvilCandy"]];
    [collection setObject:[retriever resultingConcepts:[collection objectForKey:@"Words"]] forKey:@"Words"];
    [collection setObject:[retriever resultingConcepts:[collection objectForKey:@"WordsAlt"]] forKey:@"WordsAlt"];
    [collection setObject:[retriever resultingConcepts:[collection objectForKey:@"WordsAltV2"]] forKey:@"WordsAltV2"];
    [theStory setObject:collection forKey:@"EvilCandy"];

}
-(void)prepareStory{
    theStory = [creator makeStory:self];
}
-(void)URLFailure:(NSNotification *)failure{
    NSLog(@"The URL failed. Check your connection.");
}
-(void)parseStory:(NSString *)line{
    
}
@end
