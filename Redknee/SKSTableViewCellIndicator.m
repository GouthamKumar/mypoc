//
//  SKSTableViewCellExpandedIndicatorView.m
//  SKSTableView
//
//  Created by Sakkaras on 04/01/14.
//  Copyright (c) 2014 Sakkaras. All rights reserved.
//

#import "SKSTableViewCellIndicator.h"

@implementation SKSTableViewCellIndicator

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

static UIColor *_indicatorColor;

+ (UIColor *)indicatorColor
{
    return [UIColor colorWithRed:236.0/255.0 green:236.0/255.0 blue:236.0/255.0 alpha:1.0];
}

+ (void)setIndicatorColor:(UIColor *)indicatorColor
{
    _indicatorColor = indicatorColor;
}

- (void)drawRect:(CGRect)rect
{
    CGRect newRect = rect;
    newRect.origin.x = 22;
    newRect.size.width = 30;
    newRect.size.width = 30;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    CGContextMoveToPoint   (context, CGRectGetMinX(newRect), CGRectGetMaxY(newRect));
    CGContextAddLineToPoint(context, CGRectGetMidX(newRect), CGRectGetMinY(newRect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(newRect), CGRectGetMaxY(newRect));
    CGContextClosePath(context);
    
    CGContextSetFillColorWithColor(context, [[[self class] indicatorColor] CGColor]);
    CGContextFillPath(context);
}


@end
