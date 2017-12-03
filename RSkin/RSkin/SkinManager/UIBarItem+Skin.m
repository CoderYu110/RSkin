//
//  UIBarItem+Skin.m
//  ListController
//
//  Created by rui on 2017/6/28.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "UIBarItem+Skin.h"

@implementation UIBarItem (Skin)

- (void)setR_image:(NSString *)r_image
{
    objc_setAssociatedObject(self, @selector(r_image), r_image, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ImagePicker *imagePicker = [ImagePicker new];
    imagePicker.imageKey = r_image;
    self.image = [imagePicker getCurrentModeSkin];
    [self.skinPool setValue:imagePicker forKey:SET_IMAGE];
}

- (NSString *)r_image
{
    return objc_getAssociatedObject(self, @selector(r_image));
}

- (void)r_setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state
{
    if (!attributes) return;
    SkinPicker *skinPicker = [[SkinPicker alloc] init];
    skinPicker.skinDict = attributes;
    id value = [skinPicker getCurrentModeSkin];
    skinPicker.state = state;
    [self setTitleTextAttributes:value forState:state];
    NSString *key = [NSString stringWithFormat:@"%@_%ld",SET_TITLE_ATTRIBUTES_FORSTATE,(unsigned long)state];
    [self.skinPool setValue:skinPicker forKey:key];
}

- (void)updateSkin
{
    [self.skinPool enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, SkinPicker * _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *selectorString = [key componentsSeparatedByString:@"_"].firstObject;
        id value = [obj getCurrentModeSkin];
        if ([selectorString isEqualToString:SET_TITLE_ATTRIBUTES_FORSTATE])
        {
            [self setTitleTextAttributes:value forState:obj.state];
        }
        else
        {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:NSSelectorFromString(selectorString) withObject:value];
#pragma clang diagnostic pop
        }
    }];
}


@end
