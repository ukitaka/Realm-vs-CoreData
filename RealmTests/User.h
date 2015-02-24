//
//  User.h
//  Realm-vs-CoreData
//
//  Created by Yuki Takahashi on 2015/02/24.
//  Copyright (c) 2015年 waft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface User : RLMObject

@property NSString *name;
@property NSInteger userID;
@property NSInteger age;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<User>
RLM_ARRAY_TYPE(User)
