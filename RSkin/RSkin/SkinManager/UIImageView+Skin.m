//
//  UIImageView+Skin.m
//  ListController
//
//  Created by rui on 2017/6/9.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "UIImageView+Skin.h"

@implementation UIImageView (Skin)

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

@end
