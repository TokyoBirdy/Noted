//
//  CustomCellContent.h
//  Noted7
//
//  Created by Cecilia Zhang on 10/16/13.
//  Copyright (c) 2013 Cecilia Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CustomImageCell;
@class CustomTextCell;

@interface CustomTextContent : NSObject

@property NSString *textValue;

-(void)setupCell:(CustomTextCell *)cell;

@end



@interface CustomImageContent : NSObject

@property UIImage *image;
@property UITapGestureRecognizer *tapDeleteImgGesture;

-(void)setupCell:(CustomImageCell *)cell;





@end