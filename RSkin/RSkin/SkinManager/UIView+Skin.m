//
//  UIView+Skin.m
//  ListController
//
//  Created by rui on 2017/6/9.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "UIView+Skin.h"

@implementation UIView (Skin)


- (void)setR_background:(NSString *)r_background
{
    objc_setAssociatedObject(self, @selector(r_background), r_background, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ColorPicker *colorPicker = [ColorPicker new];
    colorPicker.skinDict = [self.skinManager skinColorDictWithKey:r_background];
    self.backgroundColor = [colorPicker getCurrentModeSkin];
    [self.skinPool setValue:colorPicker forKey:SET_BACKGROUNDCOLOR];
}

- (NSString *)r_background
{
    return objc_getAssociatedObject(self, @selector(r_background));
}

- (void)setR_tintColor:(NSString *)r_tintColor
{
    objc_setAssociatedObject(self, @selector(r_tintColor), r_tintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ColorPicker *colorPicker = [ColorPicker new];
    colorPicker.skinDict = [self.skinManager skinColorDictWithKey:r_tintColor];
    self.tintColor = [colorPicker getCurrentModeSkin];
    [self.skinPool setValue:colorPicker forKey:SET_BACKGROUNDCOLOR];
}

- (NSString *)r_tintColor
{
    return objc_getAssociatedObject(self, @selector(r_tintColor));
}


@end
