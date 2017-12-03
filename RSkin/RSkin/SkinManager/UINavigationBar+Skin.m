//
//  UINavigationBar+Skin.m
//  HyCurrency
//
//  Created by rui on 2017/6/30.
//  Copyright © 2017年 ---. All rights reserved.
//

#import "UINavigationBar+Skin.h"

@implementation UINavigationBar (Skin)

- (void)r_setTitleTextAttributes:(NSDictionary *)attributes
{
    if (!attributes) return;
    SkinPicker *skinPicker = [[SkinPicker alloc] init];
    skinPicker.skinDict = attributes;
    id value = [skinPicker getCurrentModeSkin];
    [self setTitleTextAttributes:value];
    [self.skinPool setValue:skinPicker forKey:SET_TITLE_ATTRIBUTES];
}


- (void)r_setBackgroundImage:(NSDictionary *)images forBarMetrics:(UIBarMetrics)barMetrics
{
    if (!images) return;
    SkinPicker *skinPicker = [[SkinPicker alloc] init];
    skinPicker.skinDict = images;
    id value = [skinPicker getCurrentModeSkin];
    [self setBackgroundImage:value forBarMetrics:barMetrics];
     NSString *key = [NSString stringWithFormat:@"%@_%ld",SET_NAV_BACKGROUNDIMANGE_FORSTATE,(long)barMetrics];
    [self.skinPool setValue:skinPicker forKey:key];
    
}

- (void)updateSkin
{
    NSLog(@"skinpool = %@", self.skinPool);
    
    [self.skinPool enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, SkinPicker * _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *selectorString = [key componentsSeparatedByString:@"_"].firstObject;
        SEL selector = NSSelectorFromString(selectorString);
        
        id  object = [obj getCurrentModeSkin];
        if ([selectorString isEqualToString:SET_BACKGROUNDIMAGE_FORSTATE])
        {
            [self setBackgroundImage:object forBarMetrics:obj.state];
        }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        else
        {
            [self performSelector:selector withObject:object];
        }
#pragma clang diagnostic pop
        
    }];
}

@end
