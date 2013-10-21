//
//  CustomImageCell.m
//  Noted7
//
//  Created by Cecilia Zhang on 10/16/13.
//  Copyright (c) 2013 Cecilia Zhang. All rights reserved.
//

#import "CustomImageCell.h"

@implementation CustomImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        // Initialization code
//        _customImageView.frame = CGRectMake(0, 0, 320, 18);
//        _customImageView.backgroundColor = [UIColor purpleColor];
//        [self.contentView addSubview:_customImageView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
