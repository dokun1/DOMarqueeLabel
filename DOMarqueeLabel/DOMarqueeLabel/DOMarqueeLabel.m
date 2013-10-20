//
//  DOMarqueeLabel.m
//  DOMarqueeLabel
//
//  Created by David Okun on 10/19/13.
//  Copyright (c) 2013 DMOS. All rights reserved.
//

#import "DOMarqueeLabel.h"

@implementation DOMarqueeLabel

-(id)initWithText:(NSString *)text scrollBehavior:(ScrollBehavior)scrollBehavior frame:(CGRect)frame andCustomFont:(UIFont *)customFont{
    if (self = [super initWithFrame:frame]) {
        _textLabel = [[NSString alloc] initWithString:text];
        _scrollBehavior = scrollBehavior;
        _customFont = customFont;
    }
    return self;
}

-(void)viewDidLoad {
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 10, 10)];
    testLabel.text = _textLabel;
    testLabel.font = _customFont;
    CGSize newContentSize = self.frame.size;
    [testLabel sizeToFit];
    newContentSize.width = testLabel.frame.size.width;
    if (_scrollBehavior == DOMarqueeScrollFromRightToLeft) {
        newContentSize.width = newContentSize.width * 3;
    }else{
        newContentSize.height = newContentSize.height * 2;
        newContentSize.width = newContentSize.width * 2;
    }
    
}

@end
