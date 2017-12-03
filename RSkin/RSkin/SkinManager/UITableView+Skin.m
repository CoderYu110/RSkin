//
//  UITableView+Skin.m
//  HyCurrency
//
//  Created by rui on 2017/7/4.
//  Copyright © 2017年 ---. All rights reserved.
//

#import "UITableView+Skin.h"

@implementation UITableView (Skin)

- (void)setR_separatorColor:(NSString *)r_separatorColor
{
    objc_setAssociatedObject(self, @selector(r_separatorColor), r_separatorColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    ColorPicker *colorPicker = [ColorPicker new];
    colorPicker.skinDict = [self.skinManager skinColorDictWithKey:r_separatorColor];
    self.separatorColor = [colorPicker getCurrentModeSkin];
    [self.skinPool setValue:colorPicker forKey:SET_SEPARATOR_COLOR];
}

- (NSString *)r_separatorColor
{
    return objc_getAssociatedObject(self, @selector(r_separatorColor));
}

@end
