//
//  CALayer+Skin.m
//  HyCurrency
//
//  Created by rui on 2017/7/3.
//  Copyright © 2017年 ---. All rights reserved.
//

#import "CALayer+Skin.h"

@implementation CALayer (Skin)

- (void)setR_background:(NSString *)r_background
{
    objc_setAssociatedObject(self, @selector(r_background), r_background, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ColorPicker *colorPicker = [ColorPicker new];
    colorPicker.skinDict = [self.skinManager skinColorDictWithKey:r_background];
    self.backgroundColor = [[colorPicker getCurrentModeSkin] CGColor];
    [self.skinPool setValue:colorPicker forKey:SET_BACKGROUNDCOLOR];
}

- (NSString *)r_background
{
    return objc_getAssociatedObject(self, @selector(r_background));
}

- (void)setR_contents:(NSString *)r_contents
{
    objc_setAssociatedObject(self, @selector(r_contents), r_contents, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ImagePicker *imagePicker = [ImagePicker new];
    imagePicker.imageKey = r_contents;
    id contents = (__bridge id _Nullable)([[imagePicker getCurrentModeSkin] CGImage]);
    [self setContents:contents];
    [self.skinPool setValue:imagePicker forKey:SET_CONTENTS];
}

- (NSString *)r_contents
{
  return objc_getAssociatedObject(self, @selector(r_contents));
}

- (void)setR_borderColor:(NSString *)r_borderColor
{
    objc_setAssociatedObject(self, @selector(r_borderColor), r_borderColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ColorPicker *colorPicker = [ColorPicker new];
    colorPicker.skinDict = [self.skinManager skinColorDictWithKey:r_borderColor];
    self.borderColor = [[colorPicker getCurrentModeSkin] CGColor];
    [self.skinPool setValue:colorPicker forKey:SET_BORDERCOLOR];
}

- (NSString *)r_borderColor
{
  return objc_getAssociatedObject(self, @selector(r_borderColor));
}


- (void)updateSkin
{
    NSLog(@"%@", self.skinPool);
    [self.skinPool enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, SkinPicker * _Nonnull obj, BOOL * _Nonnull stop) {
//        SEL selector = NSSelectorFromString(key);
        id object = [obj getCurrentModeSkin];
        if ([key isEqualToString:SET_BACKGROUNDCOLOR]) {
            self.backgroundColor = [object CGColor];
        }else if([key isEqualToString:SET_CONTENTS])
        {
            id contents = (__bridge id _Nullable)([object CGImage]);
            [self setContents:contents];
        }else if ([key isEqualToString:SET_BORDERCOLOR])
        {
            self.borderColor = [object CGColor];
        }else
        {
        }
    }];
}


@end
