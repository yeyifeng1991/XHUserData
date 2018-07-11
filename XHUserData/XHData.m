//
//  XHData.m
//  XHUserData
//
//  Created by mc on 2018/7/11.
//  Copyright © 2018年 jiucangtouzi. All rights reserved.
//

#import "XHData.h"
#define CCXSECCSION @"user"//用户信息缓存键名
@implementation XHData
// sharedInstance方法中，返回的是[[self alloc]init]方法返回的实例
+(instancetype)sharedInstance
{
    return [[self alloc]init];// 这里会调用init方法
}
// init方法，重写init方法
-(instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}
// 把创建单例的写法写在系统为对象分配内存地址的方法中
+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static XHData * single = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 记住这里只会执行一次
        single = [super allocWithZone:zone];// 最先执行，只执行一次
    });
    return single;
}
#pragma mark -- seccsion
/** 保存用户信息类方法
 *  user:用户对象
 */
- (void)saveSeccionWithUser:(XHUser *)user{
    if ([NSKeyedArchiver archivedDataWithRootObject:user]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:user] forKey:CCXSECCSION];
        [userDefaults synchronize];
    }
}

/** 保存用户信息对象方法
 *  user:用户对象
 */
+ (void)saveSeccionWithUser:(XHUser *)user{
    [self saveSeccionWithUser:user];
}

/**
 *  获取用户信息类方法
 */
- (XHUser *)getSeccsion{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:CCXSECCSION];
    if (data) {
        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    XHUser *user = [[XHUser alloc]initWithDictionary:@{@"name":@"51钱进",@"phone":@"请登录",@"password":@"",@"userId":@"-100",@"customName":@"51钱进",@"uuid":@"",@"token":@""}];
    return user;
}

/**
 清空seccsion
 */
- (void)clearSeccsion{
    XHUser *user = [[XHUser alloc]initWithDictionary:@{@"name":@"51钱进",@"phone":@"请登录",@"customName":@"51钱进",@"password":@"",@"userId":@"-100",@"uuid":@"",@"token":@""}];
    [self saveSeccionWithUser:user];
}

/**
 *  获取用户信息类方法
 */
+ (XHUser *)getSeccsion{
    return [self getSeccsion];
}
- (void)setUserId:(NSString *)userId
{
    _userId = userId;
}
@end
