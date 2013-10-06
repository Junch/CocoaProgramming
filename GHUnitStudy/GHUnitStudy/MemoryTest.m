//
//  MemoryTest.m
//  GHUnitStudy
//
//  Created by wolf76 on 13-10-3.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnit/GHUnit.h>
#import "LogObject.h"

@interface MemoryTest : GHTestCase
@end

#pragma mark RetainTracker

@interface RetainTracker : LogObject
@end

@implementation RetainTracker

-(id) init
{
    if (self = [super init])
        GHTestLog(@"init: Retain count of %lu.", [self retainCount]);
    
    return self;
}

-(void) dealloc
{
    GHTestLog(@"dealloc called. Bye Bye.");
    [super dealloc];
}
@end // RetainTracker

//When you create an object using new, alloc, or copy, the object has a retain count of 1.
//You are responsible for sending the object a release or autorelease message when you’re
//done with it. That way, it gets cleaned up when its useful life is over.

//If you get the object from a new, alloc, or copy operation, the object has a retain count of 1.
//If you get the object any other way, assume it has a retain count of 1 and that it has been autoreleased.
//If you retain an object, you must balance every retain with a release.

@implementation MemoryTest
- (void)setUpClass // Run at start of all tests in the class
{
    [RetainTracker setTestCase: self];
}

-(void)testRetainCount
{
    RetainTracker *tracker=[[RetainTracker alloc] init];
    [tracker retain];
    GHTestLog(@"%lu", [tracker retainCount]);
    [tracker release];
    GHTestLog(@"%lu", [tracker retainCount]);
    [tracker release];
}

-(void)testNSAutoreleasePool
{
    NSAutoreleasePool *pool = [NSAutoreleasePool new];
    RetainTracker *tracker=[RetainTracker new];
    [tracker retain]; // count: 2
    [tracker autorelease]; // count: still 2
    [tracker release]; // count: 1
    GHTestLog(@"releasing pool");
    [pool release];
}

-(void)testautoreleasepool
{
    @autoreleasepool{
        RetainTracker *tracker=[RetainTracker new];
        [tracker retain]; // count: 2
        [tracker autorelease]; // count: still 2
        [tracker release]; // count: 1
        GHTestLog(@"releasing pool");
    }
}

-(void)testUsingFactories
{
    NSMutableArray* array=[NSMutableArray array]; // nice,simple,autoreleased
    
    NSMutableArray* array2=[[NSMutableArray alloc] init];
    // do stuff with array and array2
    
    [array2 release];//Need to release this one
    
    // [array release]; no need to release this,
    // it's already autoreleased
    // if you release it here, it will cause a crash
}

@end
