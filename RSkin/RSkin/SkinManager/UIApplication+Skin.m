//
//  UIApplication+Skin.m
//  HyCurrency
//
//  Created by rui on 2017/7/5.
//  Copyright © 2017年 ---. All rights reserved.
//

#import "UIApplication+Skin.h"

@implementation UIApplication (Skin)

- (void)r_setStatusBarStyle:(NSDictionary *)statusBarStyle
{
    if (!statusBarStyle) return;
    SkinPicker *skinPicker = [[SkinPicker alloc] init];
    skinPicker.skinDict = statusBarStyle;
    id value = [skinPicker getCurrentModeSkin];
    [self setStatusBarStyle:[value integerValue]];
    [self.skinPool setValue:skinPicker forKey:SET_STATUSBARSTYLE];
}

- (void)updateSkin
{
    NSLog(@"skinpool = %@", self.skinPool);
    [self.skinPool enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, SkinPicker * _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *selectorString = [key componentsSeparatedByString:@"_"].firstObject;
        id  object = [obj getCurrentModeSkin];
        if ([selectorString isEqualToString:SET_STATUSBARSTYLE])
        {
            [self setStatusBarStyle:[object integerValue]];
        }
        
    }];
}

@end
