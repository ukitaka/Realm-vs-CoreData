//
//  User.h
//  Realm-vs-CoreData
//
//  Created by Yuki Takahashi on 2015/02/24.
//  Copyright (c) 2015年 waft. All rights reserved.
//

#import <Realm/Realm.h>

@interface User : RLMObject

@property (nonatomic, strong) NSNumber *userID;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) NSNumber *age;

@end
