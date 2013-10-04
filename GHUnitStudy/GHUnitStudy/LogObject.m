//
//  LogObject.m
//  GHUnitStudy
//
//  Created by wolf76 on 13-10-3.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import "LogObject.h"

static GHTestCase* _testCase;

@implementation LogObject

+ (void)setTestCase:(GHTestCase *) testCase;
{
    _testCase = testCase;
}

- (void)log:(NSString *)message
{
    if (_testCase) {
        [_testCase log:message];
    }
}

@end
