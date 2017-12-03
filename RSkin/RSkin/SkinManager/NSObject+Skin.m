//
//  NSObject+Skin.m
//  ListController
//
//  Created by rui on 2017/6/9.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "NSObject+Skin.h"
#import "NotifyDealloc.h"

@implementation NSObject (Skin)

@dynamic skinManager;

static void * NotifyDeallocKey;

- (NSDictionary *)skinPool
{
   NSMutableDictionary *skinPool = objc_getAssociatedObject(self, @selector(skinPool));
    if (!skinPool) {
        if (objc_getAssociatedObject(self, &NotifyDeallocKey) == nil) {
            __unsafe_unretained typeof(self) weakSelf = self;
            NotifyDealloc *notifyDealloc = [[NotifyDealloc alloc] addDellocEventWithName:[NSString stringWithFormat:@"%p",self] block:^{
                [[NSNotificationCenter defaultCenter] removeObserver:weakSelf name:SkinChangingNotification object:nil];
            }];
            objc_setAssociatedObject(self, &NotifyDeallocKey, notifyDealloc, OBJC_ASSOCIATION_RETAIN);
        }
        skinPool = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(skinPool), skinPool, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [[NSNotificationCenter defaultCenter] removeObserver:self name:SkinChangingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateSkin) name:SkinChangingNotification object:nil];
    }
    return skinPool;
}

- (void)updateSkin
{
   NSLog(@"%@", self.skinPool);
   [self.skinPool enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, SkinPicker * _Nonnull obj, BOOL * _Nonnull stop) {
           SEL selector = NSSelectorFromString(key);
           id object = [obj getCurrentModeSkin];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
           [self performSelector:selector withObject:object];
#pragma clang diagnostic pop
   }];
}

- (SkinManager *)skinManager
{
    return [SkinManager skinManager];
}

@end
