//
//  KVCtest.h
//  GHUnitStudy
//
//  Created by wolf76 on 13-10-7.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import <GHUnit/GHUnit.h>

@interface Bar : NSObject
{
    NSArray *array;
    NSString *stringOnBar;
}

@property (retain, nonatomic) NSArray * array;
@property (retain, nonatomic) NSString * stringOnBar;
@end

@interface Foo : NSObject
{
    Bar *bar;
    NSString *stringOnFoo;
}
@property (retain, nonatomic) Bar * bar;
@property (retain, nonatomic) NSString * stringOnFoo;
@end

@interface KVCTest : GHTestCase

@end

