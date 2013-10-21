//
//  CustomCellContent.m
//  Noted7
//
//  Created by Cecilia Zhang on 10/16/13.
//  Copyright (c) 2013 Cecilia Zhang. All rights reserved.
//


#import "CustomCellContent.h"
#import "CustomTextCell.h"
#import "CustomImageCell.h"


@implementation CustomTextContent

-(void)setupCell:(CustomTextCell *)cell {
    
    cell.customTextView.hidden = NO;
    cell.customTextView.text = self.textValue;
    cell.customTextView.editable = true;
    
}

@end


@implementation CustomImageContent

-(void)setupCell:(CustomImageCell *)cell {
    
    cell.customImageView.hidden = NO;
    [cell.customImageView setFrame:     CGRectMake(cell.bounds.origin.x, cell.bounds.origin.y,self.image.size.width, self.image.size.height)];
    cell.customImageView.image = self.image;
    cell.customImageView.backgroundColor = [UIColor redColor];
}

@end