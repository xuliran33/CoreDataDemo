//
//  XLRModelOperation.h
//  CoreDataDemo
//
//  Created by yuedao on 2018/2/6.
//  Copyright © 2018年 Yuedao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface XLRModelOperation : NSObject
/*
 * 把类名转化为字符串
 */
+ (NSString *)getClassNameWithClass:(Class)claseName;

/**
 * model 深拷贝
 */
+ (void)copyModelFromModel:(id)fromModel toModel:(id)toModel;

@end
