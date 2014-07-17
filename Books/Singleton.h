//
//  Singleton.h
//  Books
//
//  Created by sart on 7/12/14.
//  Copyright (c) 2014 sart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, assign) int buttonPopUpMenu;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

+ (Singleton*) sharedInstance;

@end
