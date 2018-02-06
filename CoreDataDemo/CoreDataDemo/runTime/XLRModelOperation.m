//
//  XLRModelOperation.m
//  CoreDataDemo
//
//  Created by yuedao on 2018/2/6.
//  Copyright © 2018年 Yuedao. All rights reserved.
//

#import "XLRModelOperation.h"

@implementation XLRModelOperation

+ (NSString *)getClassNameWithClass:(Class)claseName{
    return [NSString stringWithUTF8String:class_getName(claseName)];
}

+ (void)copyModelFromModel:(id)fromModel toModel:(id)toModel{
    unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([fromModel class], &count);
    for (int i = 0; i < count; i++) {
        const char *name = property_getName(properties[i]);
        NSString *propertyName = [NSString stringWithUTF8String:name];
        NSLog(@"====================%@", propertyName);
        [fromModel valueForKey:propertyName];
//        id propertyValue = [fromModel valueForKey:propertyName];
//        if (propertyValue) {
//            [toModel setValue:propertyValue forKey:propertyName];
//        }
    }
}

- (void)setNilValueForKey:(NSString *)key{
    
}

@end
