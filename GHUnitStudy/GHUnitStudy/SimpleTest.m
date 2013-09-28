//
//  SimpleTest.m
//  GHUnitStudy
//
//  Created by wolf76 on 13-9-28.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnit/GHUnit.h>

@interface SimpleTest : GHTestCase
@end

@implementation SimpleTest

- (void)testStrings
{
    NSString *string1 = @"a string";
    GHTestLog(@"I can log to the GHUnit test console: %@", string1);
    
    // Assert string1 is not NULL, with no custom error description
    GHAssertNotNULL(string1, nil);
    
    // Assert equal objects, add custom error description
    NSString *string2 = @"a string";
    GHAssertEqualObjects(string1, string2, @"A custom error message. string1 should be equal to: %@.", string2);
}

@end
