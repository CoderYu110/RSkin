//
//  SkinPicker.m
//  ListController
//
//  Created by rui on 2017/6/9.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "SkinPicker.h"

@interface SkinPicker()

@end

@implementation SkinPicker

- (instancetype)init
{
    if (self = [super init]) {
        self.state = -1001;
    }
    return self;
}

- (id)getCurrentModeSkin
{
    SkinManager *manager = [SkinManager skinManager];
    return [self getSkinBySkinMode:manager.mode];
}

- (id)getSkinBySkinMode:(SkinModeType)mode
{
    id value = [self.skinDict objectForKey:mode];
    return value;
}

@end


@implementation ColorPicker

- (id)getSkinBySkinMode:(SkinModeType)mode
{
    NSString *hex = [self.skinDict objectForKey:mode];
    return  [UIColor colorWithHexString:hex];
}

- (UIColor *)colorWithHexString:(NSString *)color
{
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0];
    
}

@end


@implementation ImagePicker

- (id)getSkinBySkinMode:(SkinModeType)mode
{
    NSString *imageName = [NSString stringWithFormat:@"%@_%@",self.imageKey,mode];
    UIImage *image =  [UIImage imageNamed:imageName];
    return  image;
}

@end
