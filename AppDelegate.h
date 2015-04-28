//
//  AppDelegate.h
//  AstroStoryGM
//
//  Created by Sammeh Tillman on 3/20/15.
//  Copyright (c) 2015 Sammeh Tillman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class DSTWorldOfTales,DSTStoryPage,InterfaceController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic)UIDevice *Sammeh;
@property (nonatomic) UIWindow *window;
@property DSTWorldOfTales *theWorld;
@property DSTStoryPage *theIterator;
@property InterfaceController *myController;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

