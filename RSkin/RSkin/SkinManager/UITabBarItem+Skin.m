//
//  UITabBarItem+Skin.m
//  ListController
//
//  Created by rui on 2017/6/29.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "UITabBarItem+Skin.h"

@implementation UITabBarItem (Skin)

- (void)setR_selectImage:(NSString *)r_selectImage
{
    objc_setAssociatedObject(self, @selector(r_selectImage), r_selectImage, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ImagePicker *imagePicker = [ImagePicker new];
    imagePicker.imageKey = r_selectImage;
    self.selectedImage = [imagePicker getCurrentModeSkin];
    [self.skinPool setValue:imagePicker forKey:SET_SELECTEDIMAGE];
}

- (NSString *)r_selectImage
{
    return objc_getAssociatedObject(self, @selector(r_selectImage));
}

@end
