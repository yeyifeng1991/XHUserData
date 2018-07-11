//
//  XHData.h
//  XHUserData
//
//  Created by mc on 2018/7/11.
//  Copyright © 2018年 jiucangtouzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XHUser.h"
@interface XHData : NSObject
+(instancetype)sharedInstance;
@property (nonatomic,strong) NSString * userId;
/**保存seccsion对象
 *参数：表示存入seccsion的对象
 */
- (void)saveSeccionWithUser:(XHUser *)user;
+ (void)saveSeccionWithUser:(XHUser *)user;

/**获取seccsion对象
 *返回结果:本地的seccsion
 */
- (XHUser *)getSeccsion;
+ (XHUser *)getSeccsion;

/**
 清空seccsion
 */
- (void)clearSeccsion;
@end
