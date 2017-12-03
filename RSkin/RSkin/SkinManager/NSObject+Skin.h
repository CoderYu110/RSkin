//
//  NSObject+Skin.h
//  ListController
//
//  Created by rui on 2017/6/9.
//  Copyright © 2017年 rui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkinPicker.h"
#import <objc/message.h>

@interface NSObject (Skin)

@property (copy, nonatomic,readonly) NSMutableDictionary<NSString *,SkinPicker *> *skinPool;

@property (strong, nonatomic) SkinManager *skinManager;

@end
