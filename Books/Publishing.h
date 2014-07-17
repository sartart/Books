//
//  Publishing.h
//  Books
//
//  Created by sart on 7/12/14.
//  Copyright (c) 2014 sart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface Publishing : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *book;
@end

@interface Publishing (CoreDataGeneratedAccessors)

- (void)addBookObject:(Book *)value;
- (void)removeBookObject:(Book *)value;
- (void)addBook:(NSSet *)values;
- (void)removeBook:(NSSet *)values;

@end
