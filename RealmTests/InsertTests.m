//
//  InsertTests.m
//  Realm-vs-CoreData
//
//  Created by Yuki Takahashi on 2015/02/24.
//  Copyright (c) 2015年 waft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <Realm/Realm.h>
#import "User.h"


static NSString * const kInMemoryRealmIdentifier = @"inMemory";

@interface InsertTests : XCTestCase

@property (nonatomic, strong) RLMRealm *defaultRealm;
@property (nonatomic, strong) RLMRealm *inMemoryRealm;

@end

@implementation InsertTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [[NSFileManager defaultManager] removeItemAtPath:[RLMRealm defaultRealmPath] error:nil];
    [[NSFileManager defaultManager] removeItemAtPath:[RLMRealm inMemoryRealmWithIdentifier:kInMemoryRealmIdentifier].path error:nil];
    self.defaultRealm = [RLMRealm defaultRealm];
    self.inMemoryRealm = [RLMRealm inMemoryRealmWithIdentifier:@"inMemory"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPerformance_default_1000Insert_1000Transaction {
    
    //trancate
    [self.defaultRealm beginWriteTransaction];
    [self.defaultRealm deleteAllObjects];
    [self.defaultRealm commitWriteTransaction];
    
    [self measureBlock:^{
        
        for (NSInteger i = 0; i < 1000; i++) {
            [self.defaultRealm beginWriteTransaction];
            User *user = [User new];
            user.userID = i;
            user.name = [NSString stringWithFormat:@"test_user%ld", (long)i];
            user.age = i % 30;
            [self.defaultRealm addObject:user];
            [self.defaultRealm commitWriteTransaction];
        }
        
    }];
    

}

- (void)testPerformance_default_1000Insert_1Transaction {
    
    //trancate
    [self.defaultRealm beginWriteTransaction];
    [self.defaultRealm deleteAllObjects];
    [self.defaultRealm commitWriteTransaction];
    
    [self measureBlock:^{
        
        [self.defaultRealm beginWriteTransaction];
        for (NSInteger i = 0; i < 1000; i++) {
            User *user = [User new];
            user.userID = i;
            user.name = [NSString stringWithFormat:@"test_user%ld", (long)i];
            user.age = i % 30;
            [self.defaultRealm addObject:user];
        }
        [self.defaultRealm commitWriteTransaction];
        
    }];
}

- (void)testPerformance_inMemory_1000Insert_1000Transaction {
    
    //trancate
    [self.inMemoryRealm beginWriteTransaction];
    [self.inMemoryRealm deleteAllObjects];
    [self.inMemoryRealm commitWriteTransaction];
    
    [self measureBlock:^{
        
        for (NSInteger i = 0; i < 1000; i++) {
            [self.inMemoryRealm beginWriteTransaction];
            User *user = [User new];
            user.userID = i;
            user.name = [NSString stringWithFormat:@"test_user%ld", (long)i];
            user.age = i % 30;
            [self.inMemoryRealm addObject:user];
            [self.inMemoryRealm commitWriteTransaction];
        }
        
    }];
    
    
}

- (void)testPerformance_inMemory_1000Insert_1Transaction {
    
    //trancate
    [self.inMemoryRealm beginWriteTransaction];
    [self.inMemoryRealm deleteAllObjects];
    [self.inMemoryRealm commitWriteTransaction];
    
    [self measureBlock:^{
        
        [self.inMemoryRealm beginWriteTransaction];
        for (NSInteger i = 0; i < 1000; i++) {
            User *user = [User new];
            user.userID = i;
            user.name = [NSString stringWithFormat:@"test_user%ld", (long)i];
            user.age = i % 30;
            [self.inMemoryRealm addObject:user];
        }
        [self.inMemoryRealm commitWriteTransaction];
        
    }];
}

@end
