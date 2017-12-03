//
//  UINavigationBar+Skin.h
//  HyCurrency
//
//  Created by rui on 2017/6/30.
//  Copyright © 2017年 ---. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Skin.h"

@interface UINavigationBar (Skin)

- (void)r_setTitleTextAttributes:(NSDictionary *)attributes;

- (void)r_setBackgroundImage:(NSDictionary *)images forBarMetrics:(UIBarMetrics)barMetrics;

@end
