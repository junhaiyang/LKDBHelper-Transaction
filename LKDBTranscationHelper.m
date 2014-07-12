//
//  LKDBTranscationHelper.m
//

#import "LKDBTranscationHelper.h"
#import "FMDatabaseQueue+Database.h" 
#import "FMDatabase.h"



@interface LKDBTranscationHelper()
@property(weak,nonatomic)FMDatabase* usingdb;
@property(strong,nonatomic)FMDatabaseQueue* bindingQueue; 

@property(strong,nonatomic)NSRecursiveLock* threadLock;

@property (nonatomic,assign) BOOL transaction;
@end

@implementation LKDBTranscationHelper



- (BOOL)startTransaction{
    BOOL result = [self.usingdb beginTransaction];
    self.transaction = YES;
    return result;
}

- (BOOL)commitTransaction{
    BOOL result =  [self.usingdb commit];
    self.transaction = NO;
    return result;
}

- (BOOL)rollbackTransaction{
    BOOL result = [self.usingdb rollback];
    self.transaction = NO;
    return result;
}

-(void)dealloc{
    if(self.transaction){
        [self.usingdb rollback];
    }
     
}

-(void)setDBPath:(NSString *)filePath
{
    [super setDBPath:filePath];
    
    self.usingdb = [self.bindingQueue getDatabase];
}
 

#pragma mark- core
-(void)executeDB:(void (^)(FMDatabase *db))block
{
    [_threadLock lock];
    block(self.usingdb);
    [_threadLock unlock];
}
@end
