//
//  BlockTest.m
//  GHUnitStudy
//
//  Created by wolf76 on 13-10-6.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import <GHUnit/GHUnit.h>
@interface BlockTest: GHTestCase
@end

@implementation BlockTest

-(void)testaSimpleBlock
{
    void (^myBlock)(NSString *x);
    myBlock = ^(NSString * x)
    {
        GHTestLog(@"%@", x);
    };
    
    myBlock(@"Hello World!");
}

-(void)testaSimpleBlock2
{
    BOOL (^myBlock)(NSString *x);
    myBlock = ^(NSString * x)
    {
        GHTestLog(@"%@", x);
        return YES; // Not TRUE
    };
    
    myBlock(@"Hello World!");
}

-(NSMutableArray *) filterArray:(NSArray *)inArray
                      withBlock:(BOOL (^)(NSInteger))block
{
    NSMutableArray *result = [NSMutableArray array];
    for (NSNumber* number in inArray)
    {
        if (block([number integerValue]))
            [result addObject:number];
    }
    
    return result;
}

-(void)testPassingBlock2ObjectMethod
{
    NSArray *array = [NSArray arrayWithObjects:@-2, @-1, @0, @1, @2, nil];
    GHTestLog(@"%@", array);
    
    BOOL (^block)(NSInteger v);
    block = ^(NSInteger v)
    {
        if (v < 0)
            return NO;

        return YES;
    };
    
    NSMutableArray *array2 = [self filterArray:array withBlock: block];
    GHTestLog(@"%@", array2);
    
    NSMutableArray *array3 = [self filterArray:array withBlock: ^(NSInteger v){
        if (v == 0)
            return NO;
        return YES;
    }];
    GHTestLog(@"%@", array3);
}

@end
