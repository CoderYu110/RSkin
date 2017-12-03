//
//  UIButton+Skin.h
//  ListController
//
//  Created by rui on 2017/6/28.
//  Copyright © 2017年 rui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Skin.h"

@interface UIButton (Skin)

- (void)r_setBackgroundImage:(NSString *)r_image forState:(UIControlState)state;

- (void)r_setImage:(NSString *)image forState:(UIControlState)state;

- (void)r_setTitleColor:(NSString *)r_color forState:(UIControlState)state;

@end
