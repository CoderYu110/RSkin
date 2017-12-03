//
//  CALayer+Skin.h
//  HyCurrency
//
//  Created by rui on 2017/7/3.
//  Copyright © 2017年 ---. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Skin)

@property (copy, nonatomic) IBInspectable NSString *r_background;
@property (copy, nonatomic) IBInspectable NSString *r_contents;
@property (copy, nonatomic) IBInspectable NSString *r_borderColor;

@end
