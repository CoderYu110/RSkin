//
//  UIButton+Skin.m
//  ListController
//
//  Created by rui on 2017/6/28.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "UIButton+Skin.h"

@implementation UIButton (Skin)

- (void)r_setBackgroundImage:(NSString *)r_image forState:(UIControlState)state
{
    ImagePicker *imagePicker = [ImagePicker new];
    imagePicker.imageKey = r_image;
    imagePicker.state = state;
    UIImage *image = [imagePicker getCurrentModeSkin];
    [self setBackgroundImage:image forState:state];
    NSString *key = [NSString stringWithFormat:@"%@_%ld",SET_BACKGROUNDIMAGE_FORSTATE,(unsigned long)state];
    [self.skinPool setValue:imagePicker forKey:key];
}

- (void)r_setImage:(NSString *)r_image forState:(UIControlState)state
{
    ImagePicker *imagePicker = [ImagePicker new];
    imagePicker.imageKey = r_image;
    imagePicker.state = state;
    UIImage *image = [imagePicker getCurrentModeSkin];
    [self setImage:image forState:state];
    NSString *key = [NSString stringWithFormat:@"%@_%ld",SET_IMAGE_FORSTATE,(unsigned long)state];
    [self.skinPool setValue:imagePicker forKey:key];
}

- (void)r_setTitleColor:(NSString *)r_color forState:(UIControlState)state
{
    ColorPicker *colorPicker = [ColorPicker new];
    colorPicker.skinDict = [self.skinManager skinColorDictWithKey:r_color];
    colorPicker.state = state;
    UIColor *color = [colorPicker getCurrentModeSkin];
    [self setTitleColor:color forState:state];
    NSString *key = [NSString stringWithFormat:@"%@_%ld",SET_COLOR_FORSTATE,(unsigned long)state];
    [self.skinPool setValue:colorPicker forKey:key];
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
            [self setBackgroundImage:object forState:obj.state];
        }
        else if ([selectorString isEqualToString:SET_IMAGE_FORSTATE])
        {
            [self setImage:object forState:obj.state];
        }
        else if ([selectorString isEqualToString:SET_COLOR_FORSTATE])
        {
            [self setTitleColor:object forState:obj.state];
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
