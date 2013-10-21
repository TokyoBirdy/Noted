//
//  CustomTextCell.m
//  Noted7
//
//  Created by Cecilia Zhang on 10/16/13.
//  Copyright (c) 2013 Cecilia Zhang. All rights reserved.
//

#import "CustomTextCell.h"

@implementation CustomTextCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _customTextView = [UITextView new];
        _customTextView.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:15];
        [self.contentView addSubview:_customTextView];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


-(void) layoutSubviews
{
    [super layoutSubviews];
    self.customTextView.frame = self.contentView.bounds;
}

@end
