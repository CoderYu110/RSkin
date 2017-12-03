//
//  SkinPicker.h
//  ListController
//
//  Created by rui on 2017/6/9.
//  Copyright © 2017年 rui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SkinManager.h"

@interface SkinPicker : NSObject

@property (assign, nonatomic) int state;

@property (copy, nonatomic) NSDictionary *skinDict;

- (id)getSkinBySkinMode:(SkinModeType)mode;

- (id)getCurrentModeSkin;

@end

@interface ColorPicker: SkinPicker

@end

@interface ImagePicker : SkinPicker

@property (copy, nonatomic) NSString *imageKey;

@end
