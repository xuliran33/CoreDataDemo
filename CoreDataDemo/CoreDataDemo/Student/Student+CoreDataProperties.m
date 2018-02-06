//
//  Student+CoreDataProperties.m
//  CoreDataDemo
//
//  Created by yuedao on 2018/2/5.
//  Copyright © 2018年 Yuedao. All rights reserved.
//
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic studentId;
@dynamic studentAge;
@dynamic studentName;

@end
