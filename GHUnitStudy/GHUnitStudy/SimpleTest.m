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
    
    NSString* item = [array lastObject];
    GHTestLog(@"%lu", [array indexOfObject: item]);
}

- (void)testNSArrayInit
{
    NSArray *array = @[@1, @2, @3, @4, @5];
    for (NSValue *i in array)
        GHTestLog(@"value is %@", i);

    NSValue* itemAt3 = array[3];
    GHTestLog(@"itemAt3 is %@", itemAt3);
}

- (void)testNSDictionary
{
    // New way
    NSDictionary* dict = @{@"key1":@1, @"key2":@2,@"key3":@3};
    NSNumber* a = dict[@"key1"];
    GHTestLog(@"a=%@", a);
    
    // Old way
    dict = [NSDictionary dictionaryWithObjects:@[@3, @4, @5]
                                       forKeys:@[@"key1", @"key2", @"key3"]];
    GHTestLog(@"a=%@", dict[@"key2"]);
}

- (void)testNSNumber
{
    NSNumber* number;
    number = [NSNumber numberWithInt: 12345]; GHTestLog(@"Number=%@", number);
    number = [NSNumber numberWithBool: YES]; GHTestLog(@"Number=%@", number);
    
    number = @34567; GHTestLog(@"Number=%@", number);
    number = @NO; GHTestLog(@"Number=%@", number);
}

-(void) testException
{
    NSArray *crew = [NSArray arrayWithObjects:
                      @"Dave",
                      @"Heywood",
                      @"Frank", nil];
    
    @try {
        GHTestLog(@"%@", [crew objectAtIndex:10]);
    }
    @catch (NSException *exception) {
        GHTestLog(@"Caught an exception!\n"
                  "Name: %@\n"
                  "Reason: %@",[exception name], exception);
    }
    @finally {
        GHTestLog(@"Cleaning up");
    }
}

-(void) testEnumerating
{
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"foo", @"bar", @"baz", nil];
    
    NSEnumerator *enumerator = [array objectEnumerator];
    NSString *item = nil;
    
    while (item = [enumerator nextObject])
        GHTestLog(@"%@", item);
    GHTestLog(@"");
    
    enumerator = [array objectEnumerator];
    for (item in enumerator)
        GHTestLog(@"%@", item);
    GHTestLog(@"");
    
    enumerator = [array reverseObjectEnumerator];
    while (item = [enumerator nextObject])
        GHTestLog(@"%@", item);
    GHTestLog(@"");
}

@end
