//
//  MessageHeader.h
//  ChatHere
//
//  Created by zhengna on 15/9/21.
//  Copyright (c) 2015年 zhengna. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ContactPerson;
@interface MessageHeader : NSObject

@property (nonatomic, copy) NSString *msgHdId;
@property (nonatomic, copy) NSString *lastMsg;
@property (nonatomic, copy) NSDate *lastPost;
@property (nonatomic, strong) ContactPerson *cPerson;


- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)msgHDWithDict: (NSDictionary *)dict;



@end
