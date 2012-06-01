//
//  JNPieLoader.h
//  TestApp
//
//  Created by John Nichols on 5/31/12.
//  Copyright (c) 2012 __JohnNicholsInc__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JNPieLoader : UIView

@property (readwrite) float currentValue;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) UIColor *fillColor;

- (void)updateCurrentValue:(float)value;

@end
