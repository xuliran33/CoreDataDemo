//
//  Student+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by yuedao on 2018/2/5.
//  Copyright © 2018年 Yuedao. All rights reserved.
//
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nonatomic) int16_t studentId;
@property (nonatomic) int16_t studentAge;
@property (nullable, nonatomic, copy) NSString *studentName;

@end

NS_ASSUME_NONNULL_END
