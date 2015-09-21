//
//  ContactPerson.m
//  ChatHere
//
//  Created by zhengna on 15/9/21.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import "ContactPerson.h"

@implementation ContactPerson

- (instancetype) initWithDict: (NSDictionary *)dict{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}
+ (instancetype) contactPersonWithDict:(NSDictionary *)dict{

    return [[self alloc] initWithDict:dict];
}


@end
