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
        self.contentSize = newContentSize;
        _calculatedLabelSize = testLabel.frame.size;
        [self scrollingAnimationMethod];
        [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(scrollingAnimationMethod) userInfo:nil repeats:YES];
    }
    return self;
}

-(void)scrollingAnimationMethod {
    UILabel *label = [[UILabel alloc] init];
    label.text = _textLabel;
    label.font = _customFont;
    
    switch (_scrollBehavior) {
        case DOMarqueeScrollFromRightToLeft:{
            self.contentOffset = CGPointMake(self.contentSize.width/3, 0);
            label.frame = CGRectMake((self.contentSize.width * 2)/3, 5, _calculatedLabelSize.width, _calculatedLabelSize.height);
            [self addSubview:label];
            [UIView animateWithDuration:4.0
                                  delay:0.0
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 label.frame = CGRectMake(0, 5, _calculatedLabelSize.width, _calculatedLabelSize.height);
                             } completion:nil];
            break;
        }
        case DOMarqueeScrollDownThenLeft:
            NSLog(@"not yet");
            break;
        case DOMarqueeScrollUpThenLeft:
            NSLog(@"not yet either");
            break;
        default:
            break;
    }
    [label removeFromSuperview];
    label = nil;
}

@end
