//
//  LogObject.h
//  GHUnitStudy
//
//  Created by wolf76 on 13-10-3.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnit/GHUnit.h>

@interface LogObject : NSObject
+ (void)setTestCase:(GHTestCase *) testCase;
- (void)log:(NSString *)message;
@end
