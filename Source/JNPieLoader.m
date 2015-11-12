//
//  JNPieLoader.m
//  TestApp
//
//  Created by John Nichols on 5/31/12.
//  Copyright (c) 2012 __JohnNicholsInc__. All rights reserved.
//

#import "JNPieLoader.h"

@implementation JNPieLoader
@synthesize currentValue,backgroundImage,lineColor,fillColor;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        backgroundImage = [UIImage imageNamed:@"FeedBlankStatusButton.png"];
        lineColor = [UIColor clearColor];
        fillColor = [UIColor whiteColor];
        currentValue = 0.0;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextClearRect(contextRef, rect);
    
    [backgroundImage drawInRect:rect];
    
    // inner loading circle is 80% of background circle
    float radius = (rect.size.width/2.0) * 0.80;
    CGPoint center = CGPointMake(rect.size.width/2.0, rect.size.height/2.0);
    
    // draw circle stroke
    CGContextSetLineWidth(contextRef, 2.0);
    CGContextAddArc(contextRef, center.x, center.y, radius, 0, 2*M_PI, 0);
    CGContextSetStrokeColorWithColor(contextRef, [lineColor CGColor]);
    CGContextStrokePath(contextRef);
    
    // draw filling starting at 0%.
    // must subtract pi/2 to transform starting position to top of circle
    float finalDegree = currentValue*2*M_PI - M_PI/2; 
    CGContextSetFillColorWithColor(contextRef, [fillColor CGColor]);
    CGContextMoveToPoint(contextRef, center.x, center.y);
    CGContextAddArc(contextRef, center.x, center.y, radius, -M_PI/2, finalDegree, 0);
    CGContextClosePath(contextRef);
    CGContextFillPath(contextRef);    
}

- (void)updateCurrentValue:(float)value {
    currentValue = value;
    if (currentValue <= 1.1) {
        [self setNeedsDisplay];
    }
}

- (void)setBackgroundImage:(UIImage *)newBackgroundImage {
    backgroundImage = newBackgroundImage;
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)newLineColor {
    lineColor = newLineColor;
    [self setNeedsDisplay];
}

- (void)setFillColor:(UIColor *)newFillColor {
    fillColor = newFillColor;
    [self setNeedsDisplay];
}

@end
