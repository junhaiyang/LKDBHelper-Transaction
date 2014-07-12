//
//  LKDBTranscationHelper.m
//

#import "LKDBTranscationHelper.h"
#import "FMDatabaseQueue+Database.h" 
#import "FMDatabase.h"

 

@implementation LKDBHelper(LKDBTranscationHelper)


- (BOOL)startTransaction{
    
    self.usingdb = [self.bindingQueue getDatabase];
    BOOL result = [self.usingdb beginTransaction];
    return result;
}

- (BOOL)commitTransaction{
    BOOL result =  [self.usingdb commit];
    return result;
}

- (BOOL)rollbackTransaction{
    BOOL result = [self.usingdb rollback];
    return result;
}
  
@end
