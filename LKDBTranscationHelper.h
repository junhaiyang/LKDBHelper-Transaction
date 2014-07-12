//
//  LKDBTranscationHelper.h 
//

#import <Foundation/Foundation.h>
 
#import "LKDBHelper.h"
#import "NSObject+LKDBTranscationHelper.h"


@interface LKDBHelper(LKDBTranscationHelper)
 

@property(weak,nonatomic)FMDatabase* usingdb;
@property(strong,nonatomic)FMDatabaseQueue* bindingQueue;
 
- (BOOL)startTransaction;

- (BOOL)commitTransaction;

- (BOOL)rollbackTransaction;
 

@end
