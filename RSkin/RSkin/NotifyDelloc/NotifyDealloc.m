//
//  NotifyDelloc.m
//  NotifyDelloc
//
//  Created by rui on 2017/6/29.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "NotifyDealloc.h"
#import <objc/message.h>

@implementation NotifyDealloc

- (void)dealloc
{
    if (self.deallocBlock) {
        self.deallocBlock();
        self.deallocBlock = nil;
        self.name = nil;
    }
}

@end


@implementation NSObject (Dealloc)

static void * deallocEvent;

- (instancetype)addDellocEventWithName:(NSString *)name block:(DeallocBlock)block
{
    if (block==nil) {
        return nil;
    }
    NSMutableDictionary *deallocDict = objc_getAssociatedObject(self, &deallocEvent);
    if (!deallocDict) {
        deallocDict = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &deallocEvent, deallocDict, OBJC_ASSOCIATION_RETAIN);
    }
    NotifyDealloc *notifyDealloc = [deallocDict objectForKey:name];
    if (notifyDealloc==nil) {
        notifyDealloc = [NotifyDealloc new];
    }
    notifyDealloc.deallocBlock = block;
    notifyDealloc.name = name;
    [deallocDict setValue:notifyDealloc forKey:name];
    return notifyDealloc;
}

@end
