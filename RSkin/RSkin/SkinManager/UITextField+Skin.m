//
//  UITextField+Skin.m
//  HyCurrency
//
//  Created by rui on 2017/7/3.
//  Copyright © 2017年 ---. All rights reserved.
//

#import "UITextField+Skin.h"

@implementation UITextField (Skin)


- (void)setR_textColor:(NSString *)r_textColor
{
    objc_setAssociatedObject(self, @selector(r_textColor), r_textColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ColorPicker *colorPicker = [ColorPicker new];
    colorPicker.skinDict = [self.skinManager skinColorDictWithKey:r_textColor];
    self.textColor = [colorPicker getCurrentModeSkin];
    [self.skinPool setValue:colorPicker forKey:SET_TEXT_COLOR];
}

- (NSString *)r_textColor
{
    return objc_getAssociatedObject(self, @selector(r_textColor));
}

- (void)setR_placeholderColor:(NSString *)r_placeholderColor
{
    objc_setAssociatedObject(self, @selector(r_placeholderColor), r_placeholderColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ColorPicker *colorPicker = [ColorPicker new];
    colorPicker.skinDict = [self.skinManager skinColorDictWithKey:r_placeholderColor];
    id value = [colorPicker getCurrentModeSkin];
    [self setValue:value forKeyPath:@"_placeholderLabel.textColor"];
    [self.skinPool setValue:colorPicker forKey:SET_TEXTFILEDPLACEHOLDERCOLOR];
}
- (NSString *)r_placeholderColor
{
   return objc_getAssociatedObject(self, @selector(r_placeholderColor));
}


- (void)updateSkin
{
    NSLog(@"%@", self.skinPool);
    [self.skinPool enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, SkinPicker * _Nonnull obj, BOOL * _Nonnull stop) {
        SEL selector = NSSelectorFromString(key);
        id object = [obj getCurrentModeSkin];
        if ([key isEqualToString:SET_TEXTFILEDPLACEHOLDERCOLOR]) {
           [self setValue:object forKeyPath:@"_placeholderLabel.textColor"];
        }
        else
        {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:selector withObject:object];
#pragma clang diagnostic pop
        }
    }];
}

@end
