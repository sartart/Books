//
//  mycellCell.h
//  Books
//
//  Created by sart on 7/12/14.
//  Copyright (c) 2014 sart. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mycellCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *genre;
@property (weak, nonatomic) IBOutlet UILabel *Publish;
@property (weak, nonatomic) IBOutlet UILabel *illust;

@end
