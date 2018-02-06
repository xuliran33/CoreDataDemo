//
//  CoreDataManager.h
//  CoreDataDemo
//
//  Created by yuedao on 2018/2/5.
//  Copyright © 2018年 Yuedao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject

@property (nonatomic, strong) NSManagedObjectContext *context;
// 创建单例
+ (instancetype)sharedCoreDataManager;

/*
 * 保存数据到数据库
 */
- (BOOL)saveDataWithModel:(id)model;
@end
