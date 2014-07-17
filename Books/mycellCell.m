//
//  mycellCell.m
//  Books
//
//  Created by sart on 7/12/14.
//  Copyright (c) 2014 sart. All rights reserved.
//

#import "mycellCell.h"

@implementation mycellCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
