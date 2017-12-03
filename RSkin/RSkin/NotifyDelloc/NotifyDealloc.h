//
//  NotifyDelloc.h
//  NotifyDelloc
//
//  Created by rui on 2017/6/29.
//  Copyright © 2017年 rui. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DeallocBlock)();

@interface NotifyDealloc : NSObject

@property (copy, nonatomic) DeallocBlock deallocBlock;

@property (copy, nonatomic) NSString *name;

@end



@interface NSObject (Dealloc)

- (instancetype)addDellocEventWithName:(NSString *)name block:(DeallocBlock)block;

@end
