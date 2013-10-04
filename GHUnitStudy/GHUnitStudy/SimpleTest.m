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

- (void)testNSString //Learn Objective-C on the Mac
{
    NSString* thing1 = @"hello 5";
    NSString* thing2 = [NSString stringWithFormat: @"hello %d", 5];   
    GHAssertTrue([thing1 isEqualToString:thing2], nil);
    
    NSString* fileName=@"draft-chapter.pages";
    GHAssertTrue([fileName hasPrefix: @"draft"], nil);
    GHAssertFalse([fileName hasPrefix: @"chapter"], nil);
    GHAssertTrue([fileName hasSuffix:@".pages"], nil);
    GHAssertFalse([fileName hasSuffix:@".page"], nil);
    
    NSString* string=@"oop:ack:bork:greeble:ponies";
    NSArray* chunks = [string componentsSeparatedByString: @":"];
    GHTestLog(@"%@", chunks);
}

- (void)testNSMutableString
{
    NSMutableString *string = [NSMutableString stringWithCapacity: 42];
    [string appendString: @"Hello there "];
    [string appendFormat: @"human %d!", 39];
    GHTestLog(string);
    
    NSMutableString *friends = [NSMutableString stringWithCapacity: 50];
    [friends appendString: @"James BethLynn Jack Evan"];
    NSRange jackRange= [friends rangeOfString: @"Jack"];
    jackRange.length++;
    [friends deleteCharactersInRange: jackRange];
    GHTestLog(friends);
}

- (void)testNSArray
{
    NSArray *array=[NSArray arrayWithObjects: @"one", @"two", @"three", nil];
    
    // Four ways to interate through an array
    // 1. By index
    for(NSInteger i = 0; i< [array count]; i++)
        GHTestLog(@"index %ld has %@.", (long)i, [array objectAtIndex: i]);
    
    // 2. With NSEnumerator
    NSEnumerator *enumerator= [array objectEnumerator];
    id a;
    while (a = [enumerator nextObject])
        GHTestLog(@"I found %@", a);
    
    // 3. Fast enumeration
    for(NSString *string in array)
        GHTestLog(@"I found %@", string);
    
    // 4. With block
    [array enumerateObjectsUsingBlock: ^(NSString *string, NSUInteger index, BOOL *stop) {
        GHTestLog(@"I found %@", string); 
    }];
}

@end