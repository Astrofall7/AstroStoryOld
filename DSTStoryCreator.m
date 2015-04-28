//
//  DSTStoryCreator.m
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/21/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import "DSTStoryCreator.h"
#import "DSTStory.h"
#import "DSTStoryFormatterEnhanced.h"
#import "DSTStoryPage.h"
#import "AppDelegate.h"
@implementation DSTStoryCreator
@synthesize formatter,mainDelegate;
-(id)init{
    self = [super init];
    if(self){
        formatter = [[DSTStoryFormatterEnhanced alloc]init];
        mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    }
    return self;
}
-(id)initWithWords:(NSMutableArray *)theWords andStory:(NSMutableArray *)theStory{
    self = [super init];
    if(self){
        formatter = [[DSTStoryFormatterEnhanced alloc]init];
        mainDelegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    }
    return self;
}
-(NSMutableDictionary *)makeStory:(DSTStory *)theStory{
    formatter = [[DSTStoryFormatterEnhanced alloc]init];
    NSMutableDictionary *creation = [[NSMutableDictionary alloc]initWithDictionary:[[theStory theStory]objectForKey:@"EvilCandy"]];
    NSMutableArray *first = [[NSMutableArray alloc]initWithArray:[creation objectForKey:@"StoryMain"]];
    NSMutableArray *second = [[NSMutableArray alloc]initWithArray:[creation
                                                                objectForKey:@"AltStory"]];
    NSMutableArray *third = [[NSMutableArray alloc]initWithArray:[creation objectForKey:@"AltStoryV2"]];
    NSMutableArray *wordSetA = [[NSMutableArray alloc]initWithArray:[creation objectForKey:@"Words"]];
    NSMutableArray *wordSetB = [[NSMutableArray alloc]initWithArray:[creation objectForKey:@"WordsAlt"]];
    NSMutableArray *wordSetC = [[NSMutableArray alloc]initWithArray:[creation objectForKey:@"WordsAltV2"]];
    
    NSString *lineA= [[NSString alloc]init],*lineB = [[NSString alloc]init],*lineC = [[NSString alloc]init];
    for(int i = 0; i < [first count];i++){
        /*
         Words are as follows:
         WordSetA 0. Fruit, 1. name 2. age 3. candy 4. candy 5. candy 6. vegetable 7. move 8. nothername 9. color
         WordSetB 0. Vegetable 1. number 2. vegetable 3. vegetable 4. vegetable,5.name  6. color 7. age
         WordSetC 0. Fruit 1.number 2. fruit 3. fruit 4. fruit 5. name 6. color 7. age
         */
        switch(i){
            case 0:
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[1]];
                lineB = [NSString stringWithFormat:lineB,wordSetA[1]];
                lineC = [NSString stringWithFormat:lineC,wordSetA[1]];
                first[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]andBranchable:YES];
                second[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence: lineB]andBranchable:YES];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence: lineC]andBranchable:YES];
                break;
            case 1:
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[1],wordSetA[0]];
                lineB = [NSString stringWithFormat:lineB,wordSetA[1],wordSetB[0]];
                lineC = [NSString stringWithFormat:lineC,wordSetA[1],wordSetC[0]];
                first[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]];
                second[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence: lineB]];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence: lineC]];
                
                break;
            case 2:
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[1],wordSetA[2]];
                lineB = [NSString stringWithFormat:lineB,wordSetA[1],wordSetB[1]];
                lineC = [NSString stringWithFormat:lineC,wordSetA[1],wordSetC[1]];
                first[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]];
                second[i] =[[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineB]];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineC]];
                break;
            case 3: //turning point 1
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[3],wordSetA[4],wordSetA[5]];
                lineB = [NSString stringWithFormat:lineB,wordSetB[2],wordSetB[3],wordSetB[4]];
                lineC = [NSString stringWithFormat:lineC,wordSetC[2],wordSetC[3],wordSetC[4]];
                first[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]];
                second[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineB]];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineC]];
                break;
            case 4:
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[6]];
                lineB = [NSString stringWithFormat:lineB,wordSetA[9]];
                lineC = [NSString stringWithFormat:lineC,wordSetA[9],wordSetC[1]];
                first[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]andBranchable:YES];
                second[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineB]];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineC]andBranchable:YES];
                break;
            case 5:
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[1],wordSetA[4],wordSetA[5]];
                lineB = [NSString stringWithFormat:lineB,wordSetA[3],wordSetB[4]];
                lineC = [NSString stringWithFormat:lineC,wordSetA[1]];
                first[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]andBranchable:YES];
                second[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence: lineB]];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence: lineC]];
                break;
            case 6:
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[1],wordSetA[3]];
                lineB = [NSString stringWithFormat:lineB,wordSetB[4]];
                lineC = [NSString stringWithFormat:lineC,wordSetA[1]];
                first[i] =[[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]];
                second[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineB]];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineC]];
                break;
            case 7:
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[1],wordSetA[8],wordSetA[4],wordSetA[1]];
                lineB = [NSString stringWithFormat:lineB,wordSetA[1],wordSetB[4]];
                lineC = [NSString stringWithFormat:lineC,wordSetA[1],wordSetA[1]];
                first[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]];
                second[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineB]];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineC]];
                break;
            case 8:
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[8],wordSetA[9]];
                lineB = [NSString stringWithFormat:lineB,wordSetA[1],wordSetB[2],wordSetB[4]];
                lineC = [NSString stringWithFormat:lineC,wordSetC[2]];
                first[i] =[[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]];
                second[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineB]];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineC]];
                break;
            case 9:
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[1]];
                lineB = [NSString stringWithFormat:lineB,wordSetA[1],wordSetB[3]];
                lineC = [NSString stringWithFormat:lineC,wordSetC[0],wordSetA[1]];
                first[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]];
                second[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineB]];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineC]];
                break;
            case 10:
                lineA = first[i];
                lineB = second[i];
                lineC = third[i];
                lineA = [NSString stringWithFormat:lineA,wordSetA[1]];
                lineB = [NSString stringWithFormat:lineB,wordSetA[1]];
                lineC = [NSString stringWithFormat:lineC,wordSetA[1]];
                first[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineA]];
                second[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineB]];
                third[i] = [[DSTStoryPage alloc]initWithContent:[formatter correctSentence:lineC]];
                break;
        }
    }
    [creation setObject:first forKey:@"StoryMain"];
    [creation setObject:second forKey:@"AltStory"];
    [creation setObject:third forKey:@"AltStoryV2"];
    [[theStory theStory]setObject:creation forKey:@"EvilCandy"];
    return [theStory theStory];
}
@end
