//
//  NSObject+LKDBTranscationHelper.h 
//

#import <Foundation/Foundation.h>
#import "LKDBHelper.h"

@class LKDBTranscationHelper;
@interface NSObject(LKDBTranscationHelper)

//callback delegate
+(void)dbDidCreateTable:(LKDBTranscationHelper*)helper;


//only simplify synchronous function
+(int)rowCountWithWhere:(id)where helper:(LKDBTranscationHelper *)helper;

+(NSMutableArray*)searchColumn:(id)columns where:(id)where orderBy:(NSString*)orderBy offset:(int)offset count:(int)count helper:(LKDBTranscationHelper *)helper;
+(NSMutableArray*)searchWithWhere:(id)where orderBy:(NSString*)orderBy offset:(int)offset count:(int)count helper:(LKDBTranscationHelper *)helper;
+(id)searchSingleWithWhere:(id)where orderBy:(NSString*)orderBy helper:(LKDBTranscationHelper *)helper;

+(BOOL)insertToDB:(NSObject*)model helper:(LKDBTranscationHelper *)helper;
+(BOOL)insertWhenNotExists:(NSObject*)model helper:(LKDBTranscationHelper *)helper;
+(BOOL)updateToDB:(NSObject *)model where:(id)where helper:(LKDBTranscationHelper *)helper;
+(BOOL)updateToDBWithSet:(NSString*)sets where:(id)where helper:(LKDBTranscationHelper *)helper;
+(BOOL)deleteToDB:(NSObject*)model helper:(LKDBTranscationHelper *)helper;
+(BOOL)deleteWithWhere:(id)where helper:(LKDBTranscationHelper *)helper;
+(BOOL)isExistsWithModel:(NSObject*)model helper:(LKDBTranscationHelper *)helper;

- (BOOL)saveToDB:(LKDBTranscationHelper *)helper;
- (BOOL)deleteToDB:(LKDBTranscationHelper *)helper;
- (BOOL)isExistsFromDB:(LKDBTranscationHelper *)helper;

@end