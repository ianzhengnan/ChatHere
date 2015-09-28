//
//  Message.h
//  ChatHere
//
//  Created by zhengna on 15/9/21.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ContactPerson;
@interface Message : NSObject

@property (nonatomic, strong) ContactPerson *sendPerson;
@property (nonatomic, copy) NSString *msgId;
@property (nonatomic, copy) NSString *msgHdId;
@property (nonatomic, copy) NSString *msgContent;

- (instancetype)initWithDict: (NSDictionary *)dict;

+ (instancetype)msgWithDict: (NSDictionary *)dict;



@end
