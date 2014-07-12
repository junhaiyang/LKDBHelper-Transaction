//
//  LKDBTranscationHelper.h 
//

#import <Foundation/Foundation.h>
 
#import "LKDBHelper.h"


@interface LKDBTranscationHelper : LKDBHelper



- (BOOL)startTransaction;

- (BOOL)commitTransaction;

- (BOOL)rollbackTransaction;
 

@end
