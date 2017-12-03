//
//  SkinManager.h
//  ListController
//
//  Created by rui on 2017/6/9.
//  Copyright © 2017年 rui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"

@interface SkinManager : NSObject

+ (instancetype)skinManager;

@property (copy, nonatomic) SkinModeType mode;

- (NSDictionary *)skinColorDictWithKey:(NSString *)key;

- (BOOL)isNight;
- (void)night;
- (void)day;

+ (NSString *)hexColorStringWithKey:(NSString *)key;

@end



