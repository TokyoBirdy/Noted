//
//  LeftMsterViewController.m
//  Noted7
//
//  Created by Cecilia Zhang on 10/16/13.
//  Copyright (c) 2013 Cecilia Zhang. All rights reserved.
//

#import "LeftMasterViewController.h"

@interface LeftMasterViewController ()

@end

@implementation LeftMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


-(void) loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
