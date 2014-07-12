//
//  DYPersistenceObject.m 
//

#import "DYPersistenceObject.h"
#import "LKDBTranscationHelper.h"
#import <objc/runtime.h>

@implementation DYPersistenceObject



//在类 初始化的时候
+(void)initialize
{
    //remove unwant property
    for (NSString *property in [[self class] transients]) {
        [self removePropertyWithColumnName:property];
    }
    
}


+ (void)registerTable{
    [[self getUsingLKDBHelper] createTableWithModelClass:[self class]];
}

#if DEBUG
// 将要插入数据库
+(BOOL)dbWillInsert:(NSObject *)entity
{
    LKErrorLog(@"will insert : %@",NSStringFromClass(self));
    return YES;
}
//已经插入数据库
+(void)dbDidInserted:(NSObject *)entity result:(BOOL)result
{
    LKErrorLog(@"did insert : %@",NSStringFromClass(self));
}

#endif

+ (NSArray *)transients{
    return nil;
}

+ (NSString*) getTableName
{
    return [self nameFilter:[NSString stringWithUTF8String:class_getName([self class])]];
}
+ (NSString *)nameFilter:(NSString *)name
{
    NSMutableString *ret = [NSMutableString string];
    
	for (int i = 0; i < name.length; i++)
	{
		NSRange range = NSMakeRange(i, 1);
		NSString *oneChar = [name substringWithRange:range];
		if ([oneChar isEqualToString:[oneChar uppercaseString]] && i > 0)
			[ret appendFormat:@"_%@", [oneChar lowercaseString]];
		else
			[ret appendString:[oneChar lowercaseString]];
	}
    
    return ret;
}

//表版本
+(int)getTableVersion
{
    return DYDATABASE_VERSION;
}

//升级
+(LKTableUpdateType)tableUpdateForOldVersion:(int)oldVersion newVersion:(int)newVersion
{
    return LKTableUpdateTypeDeleteOld;
}


+ (id)loadByRowid:(int)_rowid{
    return [[self getUsingLKDBHelper] searchSingle:[self class] where:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:_rowid],@"rowid", nil] orderBy:nil];
}

- (id)loadByRowid{
    return [[[self class] getUsingLKDBHelper] searchSingle:[self class] where:[NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:self.rowid],@"rowid", nil] orderBy:nil];
}


+ (NSArray *)list{
    return [[self class] searchWithWhere:nil];
}

+ (int)count{
   return  [[self class] rowCount];
}

+ (void)drop{
    
    DYPersistenceManager *manager = [DYPersistenceManager sharedManager];
    
    [manager drop:[self class]];
     
}

- (NSInteger)save{
    
    DYPersistenceManager *manager = [DYPersistenceManager sharedManager];
    
    if(self.rowid>0){
        [manager update:self];
    }else{
        [manager insert:self];
    }
    
    return self.rowid;
}

- (NSInteger)update{
    
    DYPersistenceManager *manager = [DYPersistenceManager sharedManager];
    
    [manager update:self];
    
    return self.rowid;
}

- (void)delete{
    
    DYPersistenceManager *manager = [DYPersistenceManager sharedManager];
    
    [manager delete:self];
    
}

@end
