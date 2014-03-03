//
//  DOMarqueeLabel.h
//  DOMarqueeLabel
//
//  Created by David Okun on 10/19/13.
//  Copyright (c) 2013 DMOS. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum ScrollBehavior {
    DOMarqueeScrollFromRightToLeft,     //Label will appear from right side of label and scroll continuously
    DOMarqueeScrollDownThenLeft,        //Label will appear from top, then scroll left
    DOMarqueeScrollUpThenLeft,           //Label will appear from bottom, then scroll left
    DOMarqueeScrollNone
}
ScrollBehavior;

@interface DOMarqueeLabel : UIScrollView {
    NSString *_textLabel;
    ScrollBehavior _scrollBehavior;
    UIFont *_customFont;
    CGSize _calculatedLabelSize;
    double _scrollDuration;
    UIColor *_textColor;
}

-(id)initWithText:(NSString*)text scrollBehavior:(ScrollBehavior)scrollBehavior frame:(CGRect)frame customFont:(UIFont*)customFont ScrollDuration:(double)scrollDuration textColor:(UIColor *)color;

@end
