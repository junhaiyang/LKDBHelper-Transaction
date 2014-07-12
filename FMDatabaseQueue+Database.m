//
//  FMDatabaseQueue+Database.m
//  mvoice
//
//  Created by yangjunhai on 14-7-12.
//  Copyright (c) 2014年 soooner. All rights reserved.
//

#import "FMDatabaseQueue+Database.h"

@implementation FMDatabaseQueue (Database)

-(FMDatabase *)getDatabase{
    return _db;
}

@end
