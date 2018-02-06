//
//  ViewController.m
//  CoreDataDemo
//
//  Created by yuedao on 2018/2/5.
//  Copyright © 2018年 Yuedao. All rights reserved.
//

#import "ViewController.h"
#import "Student+CoreDataProperties.h"
#import <CoreData/CoreData.h>
#import "CoreDataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    Student *student = [[Student alloc] init];

//    [[CoreDataManager sharedCoreDataManager] saveDataWithModel:student];
    
    Student * student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:[CoreDataManager sharedCoreDataManager].context];
    student.studentId = 10;
    student.studentName = @"111";
    student.studentAge = 5;
    NSError *error = nil;
    [[CoreDataManager sharedCoreDataManager].context save:&error];
    
    NSLog(@"===================%@", error);
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:[CoreDataManager sharedCoreDataManager].context];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"<#format string#>", <#arguments#>];
//    [fetchRequest setPredicate:predicate];
//    // Specify how the fetched objects should be sorted
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"<#key#>"
//                                                                   ascending:YES];
//    [fetchRequest setSortDescriptors:[nan(const char *
//
//
//                                          )];
    
//    NSError *error = nil;
    NSArray *fetchedObjects = [[CoreDataManager sharedCoreDataManager].context executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        
    }else{
        for (Student *stu in fetchedObjects) {
            NSLog(@"==========%d", stu.studentAge);
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
