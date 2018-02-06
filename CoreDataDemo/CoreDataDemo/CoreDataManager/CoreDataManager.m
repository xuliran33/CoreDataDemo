//
//  CoreDataManager.m
//  CoreDataDemo
//
//  Created by yuedao on 2018/2/5.
//  Copyright © 2018年 Yuedao. All rights reserved.
//  初始化 CoreData 栈

#import "CoreDataManager.h"
#import "XLRModelOperation.h"

@interface CoreDataManager()

// 描述了数据模型的结构信息
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
// 数据持久层和内存对象模型的协调器
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistnetStoreCoordinate;
// 内存中 managerObject对象的上下文


@end

@implementation CoreDataManager
static CoreDataManager *_manager = nil;

+ (instancetype)sharedCoreDataManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[CoreDataManager alloc] init];
    });
    return _manager;
}

// 保存
- (BOOL)saveDataWithModel:(id)model{

    Class entityClass = [model class];
    NSString *className = [XLRModelOperation getClassNameWithClass:entityClass];
    id saveModel = [NSEntityDescription insertNewObjectForEntityForName:className inManagedObjectContext:self.context];
    [XLRModelOperation copyModelFromModel:model toModel:saveModel];
    NSError *error;
    [self.context save:&error];
    if (!error) {
        return YES;
    }else{
        return NO;
    }
}

#pragma mark ------------ 使用懒加载的方式进行初始化
- (NSManagedObjectModel *)managedObjectModel{
    if (!_managedObjectModel) {
        // url 为CoreDataDemo.xcdatamodeld, 注意扩展名为momd. 而不是CoreDataDemo.xcdatamodeld
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataDemo" withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistnetStoreCoordinate{
    if (!_persistnetStoreCoordinate) {
        // 创建 coordinator 需要传入 managedObjectModel
        _persistnetStoreCoordinate = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        // 指定本地的 sqlite 数据库文件
        NSURL *sqliteURL = [[self documentDirectoryURL] URLByAppendingPathComponent:@"CoreDataDemo.sqlite3"];
        NSLog(@"=======================%@", sqliteURL);
        NSError *error = nil;
        // 为 persistnetStoreCoordinate 指定本地存储的类型, 这里指定的是SQLite
        [_persistnetStoreCoordinate addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqliteURL options:nil error:&error];
        if (error) {
            NSLog(@"failed to create persistnetStoreCoordinate %@", error.localizedDescription);
        }
    }
    return _persistnetStoreCoordinate;
}

// 用来获取 documnet 目录
- (nullable NSURL *)documentDirectoryURL{
    return [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
}

- (NSManagedObjectContext *)context{
    if (!_context) {
        // 指定 context 的并发类型 NSMainQueueConcurrencyType 或 NSprivateQueueConcurrencyType
        _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _context.persistentStoreCoordinator = self.persistnetStoreCoordinate;
    }
    return _context;
}

@end
