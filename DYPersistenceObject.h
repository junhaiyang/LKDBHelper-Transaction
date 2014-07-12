//
//  DYPersistenceObject.h 
//

#import <Foundation/Foundation.h>
#import "LKDBTranscationHelper.h"

#ifndef DYDATABASE_VERSION
    #define DYDATABASE_VERSION 2
#endif

@interface DYPersistenceObject : NSObject

/**
 +(void)load{
    [[self class] registerTable];
 }
 */
+ (void)registerTable;

+ (NSString*) getTableName;
 

+ (NSArray *)transients;  //忽略的字段


+ (id)loadByRowid:(int)_rowid;

- (id)loadByRowid;
 
+ (NSArray *)list;

+ (int)count;

+ (void)drop;

- (int)save;

- (int)update;

- (void)delete;


@end
