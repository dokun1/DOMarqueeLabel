//
//  DOMarqueeLabelViewController.m
//  DOMarqueeLabel
//
//  Created by David Okun on 10/19/13.
//  Copyright (c) 2013 DMOS. All rights reserved.
//

#import "DOMarqueeLabelViewController.h"

@interface DOMarqueeLabelViewController ()

@end

@implementation DOMarqueeLabelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _label = [[DOMarqueeLabel alloc] initWithText:@"This is a testing message!" scrollBehavior:DOMarqueeScrollFromRightToLeft frame:CGRectMake(10, 200, 200, 50) andCustomFont:[UIFont systemFontOfSize:15.0f]];
    [self.view addSubview:_label];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
