//
//  CAShapeLayer+Skin.m
//  HyCurrency
//
//  Created by rui on 2017/7/3.
//  Copyright © 2017年 ---. All rights reserved.
//

#import "CAShapeLayer+Skin.h"

@implementation CAShapeLayer (Skin)


- (void)setR_fillColor:(NSString *)r_fillColor
{
    objc_setAssociatedObject(self, @selector(r_fillColor), r_fillColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ColorPicker *colorPicker = [ColorPicker new];
    colorPicker.skinDict = [self.skinManager skinColorDictWithKey:r_fillColor];
    self.fillColor = [[colorPicker getCurrentModeSkin] CGColor];
    [self.skinPool setValue:colorPicker forKey:SET_FILL_COLOR];
}

- (NSString *)r_fillColor
{
    return objc_getAssociatedObject(self, @selector(r_fillColor));
}

- (void)setR_strokeColor:(NSString *)r_strokeColor
{
    objc_setAssociatedObject(self, @selector(r_strokeColor), r_strokeColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ColorPicker *colorPicker = [ColorPicker new];
    colorPicker.skinDict = [self.skinManager skinColorDictWithKey:r_strokeColor];
    self.strokeColor = [[colorPicker getCurrentModeSkin] CGColor];
    [self.skinPool setValue:colorPicker forKey:SET_STROKE_COLOR];
}

- (NSString *)r_strokeColor
{
    return objc_getAssociatedObject(self, @selector(r_strokeColor));
}

- (void)updateSkin
{
    NSLog(@"%@", self.skinPool);
    [self.skinPool enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, SkinPicker * _Nonnull obj, BOOL * _Nonnull stop) {
//        SEL selector = NSSelectorFromString(key);
        id object = [obj getCurrentModeSkin];
        if ([key isEqualToString:SET_BACKGROUNDCOLOR]) {
            self.fillColor = [object CGColor];
        }else if([key isEqualToString:SET_STROKE_COLOR])
        {
            self.strokeColor = [object CGColor];
        }else
        {
            
        }
    }];
}

@end
