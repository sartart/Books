//
//  Book.h
//  Books
//
//  Created by sart on 7/12/14.
//  Copyright (c) 2014 sart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Author, Genre, IllustrationAuthor, Publishing;

@interface Book : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * year;
@property (nonatomic, retain) NSSet *author;
@property (nonatomic, retain) NSSet *genre;
@property (nonatomic, retain) IllustrationAuthor *illustratorauthor;
@property (nonatomic, retain) Publishing *publishing;
@end

@interface Book (CoreDataGeneratedAccessors)

- (void)addAuthorObject:(Author *)value;
- (void)removeAuthorObject:(Author *)value;
- (void)addAuthor:(NSSet *)values;
- (void)removeAuthor:(NSSet *)values;

- (void)addGenreObject:(Genre *)value;
- (void)removeGenreObject:(Genre *)value;
- (void)addGenre:(NSSet *)values;
- (void)removeGenre:(NSSet *)values;

@end
