//
//  CZAppDelegate.h
//  Noted7
//
//  Created by Cecilia Zhang on 10/16/13.
//  Copyright (c) 2013 Cecilia Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PKRevealController;

@interface CZAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong, readwrite) PKRevealController *revealController;

@end
