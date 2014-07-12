//
//  MyTest.h
//  mvoice
//
//  Created by yangjunhai on 14-7-12.
//  Copyright (c) 2014年 soooner. All rights reserved.
//

#import "DYPersistenceObject.h"

@interface MyTest : DYPersistenceObject

@property (nonatomic,assign) NSInteger num;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSDate *time;

@property (nonatomic,strong) NSData *data;

@end
