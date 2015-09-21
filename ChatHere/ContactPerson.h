//
//  ContactPerson.h
//  ChatHere
//
//  Created by zhengna on 15/9/21.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactPerson : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *personId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *intro;


- (instancetype) initWithDict: (NSDictionary *)dict;
+ (instancetype) contactPersonWithDict:(NSDictionary *)dict;

@end
