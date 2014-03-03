//
//  DOMarqueeLabel.m
//  DOMarqueeLabel
//
//  Created by David Okun on 10/19/13.
//  Copyright (c) 2013 DMOS. All rights reserved.
//

#import "DOMarqueeLabel.h"

@implementation DOMarqueeLabel

-(id)initWithText:(NSString*)text scrollBehavior:(ScrollBehavior)scrollBehavior frame:(CGRect)frame customFont:(UIFont*)customFont ScrollDuration:(double)scrollDuration textColor:(UIColor *)color{
    if (self = [super initWithFrame:frame]) {
        _textLabel = [[NSString alloc] initWithString:text];
        _scrollBehavior = scrollBehavior;
        _customFont = customFont;
        _scrollDuration = scrollDuration;
        _textColor = color;
        
        self.backgroundColor = [UIColor clearColor];
        
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
        if (_scrollBehavior != DOMarqueeScrollNone) {
            [NSTimer scheduledTimerWithTimeInterval:_scrollDuration + 0.1 target:self selector:@selector(scrollingAnimationMethod) userInfo:nil repeats:YES];
        }
        
    }
    return self;
}

-(void)scrollingAnimationMethod {
    UILabel *label = [[UILabel alloc] init];
    label.text = _textLabel;
    label.font = _customFont;
    if (_textColor) {
        label.textColor = _textColor;
    }
    
    switch (_scrollBehavior) {
        case DOMarqueeScrollFromRightToLeft:{
            self.contentOffset = CGPointMake(self.contentSize.width/6, 0);
            label.frame = CGRectMake((self.contentSize.width * 2.25)/3, 0, _calculatedLabelSize.width, _calculatedLabelSize.height);
            [self addSubview:label];
            [UIView animateWithDuration:_scrollDuration
                                  delay:0.0
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 self.contentOffset = CGPointMake(self.contentSize.width * 1.2, 0);
                             } completion:^(BOOL finished) {
                                 [label removeFromSuperview];
                             }];
            break;
        }
        case DOMarqueeScrollDownThenLeft:{
            self.contentOffset = CGPointMake(((self.contentSize.width * 2) / 3) - 5, self.contentSize.height/2);
            label.frame = CGRectMake((self.contentSize.width * 2)/3, 0, _calculatedLabelSize.width, _calculatedLabelSize.height);
            [self addSubview:label];
            [UIView animateWithDuration:_scrollDuration/4
                                  delay:0.0
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 self.contentOffset = CGPointMake(self.contentOffset.x, 0);
                             } completion:^(BOOL finished) {
                                 [UIView animateWithDuration:((_scrollDuration/4)*3)-0.5
                                                       delay:0.5
                                                     options:UIViewAnimationOptionCurveLinear
                                                  animations:^{
                                                      self.contentOffset = CGPointMake(self.contentSize.width * 1.2, self.contentOffset.y);
                                                  } completion:^(BOOL finished) {
                                                      [label removeFromSuperview];
                                                  }];
                             }];
            break;
        }
        case DOMarqueeScrollUpThenLeft:{
            self.contentOffset = CGPointMake(((self.contentSize.width * 2) / 3) - 5, 0);
            label.frame = CGRectMake((self.contentSize.width * 2)/3, self.contentSize.height/2, _calculatedLabelSize.width, _calculatedLabelSize.height);
            [self addSubview:label];
            [UIView animateWithDuration:_scrollDuration/4
                                  delay:0.0
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 self.contentOffset = CGPointMake(self.contentOffset.x, self.contentSize.height / 2);
                             } completion:^(BOOL finished) {
                                 [UIView animateWithDuration:((_scrollDuration/4)*3)-0.5
                                                       delay:0.5
                                                     options:UIViewAnimationOptionCurveLinear
                                                  animations:^{
                                                      self.contentOffset = CGPointMake(self.contentSize.width * 1.2, self.contentOffset.y);
                                                  } completion:^(BOOL finished) {
                                                      [label removeFromSuperview];
                                                  }];
                             }];
            break;
        }
        case DOMarqueeScrollNone:{
            self.contentSize = self.frame.size;
            label.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            label.backgroundColor = [UIColor clearColor];
            label.textAlignment = 1;
            [self addSubview:label];
            double delayInSeconds = _scrollDuration;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [label removeFromSuperview];
            });
            break;
        }
        default:
            NSLog(@"unrecognized scroll behavior");
            break;
    }
}

@end
