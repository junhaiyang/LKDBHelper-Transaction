//
//  NSObject+LKDBTranscationHelper.m 
//

#import "NSObject+LKDBTranscationHelper.h"
#import "LKDBTranscationHelper.h"


@implementation NSObject(LKDBTranscationHelper)

+(void)dbDidCreateTable:(LKDBTranscationHelper *)helper{}


#pragma mark - simplify synchronous function
+(BOOL)checkModelClass:(NSObject*)model
{
    if([model isMemberOfClass:self])
        return YES;
    
    NSLog(@"%@ can not use %@",NSStringFromClass(self),NSStringFromClass(model.class));
    return NO;
}

+(int)rowCountWithWhere:(id)where helper:(LKDBTranscationHelper *)helper{
    return [helper rowCount:self where:where];
}
+(NSMutableArray *)searchColumn:(id)columns where:(id)where orderBy:(NSString *)orderBy offset:(int)offset count:(int)count helper:(LKDBTranscationHelper *)helper
{
    return [helper search:self column:columns where:where orderBy:orderBy offset:offset count:count];
}
+(NSMutableArray*)searchWithWhere:(id)where orderBy:(NSString*)orderBy offset:(int)offset count:(int)count helper:(LKDBTranscationHelper *)helper{
    return [helper search:self where:where orderBy:orderBy offset:offset count:count];
}
+(id)searchSingleWithWhere:(id)where orderBy:(NSString *)orderBy helper:(LKDBTranscationHelper *)helper
{
    return [helper searchSingle:self where:where orderBy:orderBy];
}

+(BOOL)insertToDB:(NSObject*)model helper:(LKDBTranscationHelper *)helper{
    
    if([self checkModelClass:model])
    {
        return [helper insertToDB:model];
    }
    return NO;
    
}
+(BOOL)insertWhenNotExists:(NSObject*)model helper:(LKDBTranscationHelper *)helper{
    if([self checkModelClass:model])
    {
        return [helper insertWhenNotExists:model];
    }
    return NO;
}
+(BOOL)updateToDB:(NSObject *)model where:(id)where helper:(LKDBTranscationHelper *)helper{
    if([self checkModelClass:model])
    {
        return [helper updateToDB:model where:where];
    }
    return NO;
}
+(BOOL)updateToDBWithSet:(NSString *)sets where:(id)where helper:(LKDBTranscationHelper *)helper
{
    return [helper updateToDB:self set:sets where:where];
}
+(BOOL)deleteToDB:(NSObject*)model helper:(LKDBTranscationHelper *)helper{
    if([self checkModelClass:model])
    {
        return [helper deleteToDB:model];
    }
    return NO;
}
+(BOOL)deleteWithWhere:(id)where helper:(LKDBTranscationHelper *)helper{
    return [helper deleteWithClass:self where:where];
}
+(BOOL)isExistsWithModel:(NSObject *)model helper:(LKDBTranscationHelper *)helper
{
    if([self checkModelClass:model])
    {
        return [helper isExistsModel:model];
    }
    return NO;
}

- (BOOL)saveToDB:(LKDBTranscationHelper *)helper
{
    return [self.class insertToDB:self helper:helper];
}
- (BOOL)deleteToDB:(LKDBTranscationHelper *)helper
{
    return [self.class deleteToDB:self helper:helper];
}
-(BOOL)isExistsFromDB:(LKDBTranscationHelper *)helper
{
    return [self.class isExistsWithModel:self helper:helper];
}
@end
