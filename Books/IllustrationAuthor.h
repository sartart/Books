//
//  IllustrationAuthor.h
//  Books
//
//  Created by sart on 7/12/14.
//  Copyright (c) 2014 sart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface IllustrationAuthor : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Book *book;

@end
