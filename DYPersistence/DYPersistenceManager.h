//
//  DYPersistenceManager.h
//  mvoice
//
//  Created by yangjunhai on 14-7-13.
//  Copyright (c) 2014年 soooner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/objc.h>

@class DYPersistenceObject;

@interface DYPersistenceManager : NSObject
 
+ (DYPersistenceManager *)sharedManager;

//事物方法打算废弃，请使用其原始的方法   - (void)executeForTransaction:(BOOL (^)(LKDBHelper* helper))block;

- (BOOL)startTransaction;

- (BOOL)commitTransaction;

- (BOOL)rollbackTransaction;
   
- (BOOL)execSQL:(NSString *)sql;

- (int)insert:(DYPersistenceObject *)object;

- (int)update:(DYPersistenceObject *)object;

- (void)delete:(DYPersistenceObject *)object;

- (void)drop:(Class)clazz;

- (NSArray *)execQuery:(NSString *)sql;

- (NSArray *)execQuery:(Class)clazz sql:(NSString *)sql;

@end
