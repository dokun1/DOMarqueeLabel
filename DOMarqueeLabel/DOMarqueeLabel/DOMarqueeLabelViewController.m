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
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width - 20, 50)];
    titleLabel.text = @"Marquee Label Examples";
    titleLabel.font = [UIFont systemFontOfSize:24.0f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    DOMarqueeLabel *label1 = [[DOMarqueeLabel alloc] initWithText:@"This is a testing message!" scrollBehavior:DOMarqueeScrollFromRightToLeft frame:CGRectMake(10, 100, 300, 20) customFont:[UIFont systemFontOfSize:15.0f] andScrollDuration:6.0];
    [self.view addSubview:label1];
    DOMarqueeLabel *label2 = [[DOMarqueeLabel alloc] initWithText:@"This is another test with a really long message!" scrollBehavior:DOMarqueeScrollUpThenLeft frame:CGRectMake(10, 140, 200, 20) customFont:[UIFont systemFontOfSize:15.0f] andScrollDuration:10.5];
    [self.view addSubview:label2];
    DOMarqueeLabel *label3 = [[DOMarqueeLabel alloc] initWithText:@"This is the test message that comes down, then goes left! Imagine all of the things you can do with an amount of text like this." scrollBehavior:DOMarqueeScrollDownThenLeft frame:CGRectMake(10, 180, 250, 20) customFont:[UIFont systemFontOfSize:15.0f] andScrollDuration:7.3];
    [self.view addSubview:label3];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
