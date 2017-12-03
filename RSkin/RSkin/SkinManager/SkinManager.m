//
//  SkinManager.m
//  ListController
//
//  Created by rui on 2017/6/9.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "SkinManager.h"

@interface SkinManager()

@property (strong, nonatomic) NSDictionary *skinConfigDict;

@end

@implementation SkinManager

static SkinManager * _skinManager;

+ (instancetype)skinManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _skinManager = [[[self class] alloc] init];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"skinConfig.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        NSError *error = nil;
        NSDictionary *skinConfigDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        _skinManager.skinConfigDict = [skinConfigDict copy];
        SkinModeType mode = (SkinModeType)[[NSUserDefaults standardUserDefaults] stringForKey:SkinStateKey];
        if (!mode||mode.length <= 0) {
            mode = [[skinConfigDict objectForKey:@"modes"] firstObject];
        }
        [_skinManager setMode:mode];
    });
    return _skinManager;
}


- (void)setMode:(SkinModeType)mode
{
    if (_mode == mode) {
        return;
    }
    _mode = mode;
    [[NSUserDefaults standardUserDefaults] setObject:mode forKey:SkinStateKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:SkinChangingNotification object:nil];
}

- (NSDictionary *)skinColorDictWithKey:(NSString *)key
{
    return [[self.skinConfigDict objectForKey:@"colors"] objectForKey:key];
}

- (BOOL)isNight
{
    return [self.mode isEqualToString:@"night"];
}

- (void)night
{
    self.mode = @"night";
}

- (void)day
{
    self.mode = @"day";
}

+ (NSString *)hexColorStringWithKey:(NSString *)key {
    SkinManager *mgr = [SkinManager skinManager];
    NSDictionary *d = [mgr skinColorDictWithKey:key];
    if (d) {
        return d[mgr.mode];
    }
    return @"#000000";
}

@end
