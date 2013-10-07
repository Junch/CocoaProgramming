//
//  KVCtest.m
//  GHUnitStudy
//
//  Created by wolf76 on 13-10-7.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import "KVCTest.h"

@implementation Bar
@synthesize array;
@synthesize stringOnBar;
@end // Bar

@implementation Foo
@synthesize bar;
@synthesize stringOnFoo;

-(id)init
{
    if (self = [super init]) {
        bar = [[Bar alloc] init];
    }
    
    return self;
}

-(void)dealloc
{
    [bar release];
    [super dealloc];
}

@end // Foo

@implementation KVCTest
-(void)testAccessAttributes
{
    Foo *foo  = [[Foo alloc] init];
    [foo setValue:@"blah blah" forKey:@"stringOnFoo"];
    NSString *string = [foo valueForKey:@"stringOnFoo"];
    GHTestLog(@"%@", string);
    
    [foo setValue:@"The quick brown fox." forKeyPath: @"bar.stringOnBar"];
    NSString *string2 = [foo valueForKeyPath:@"bar.stringOnBar"];
    GHTestLog(@"%@", string2);
    
    [foo release];
}

@end
