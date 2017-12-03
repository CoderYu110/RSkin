//
//  UIBarItem+Skin.h
//  ListController
//
//  Created by rui on 2017/6/28.
//  Copyright © 2017年 rui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+Skin.h"

@interface UIBarItem (Skin)

@property (copy, nonatomic) IBInspectable NSString *r_image;

- (void)r_setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state;

@end
