//
//  CategoryTest.m
//  GHUnitStudy
//
//  Created by wolf76 on 13-10-4.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnit/GHUnit.h>

@interface NSString (NumberConvenience)
-(NSNumber *) lengthAsNumber;
@end

@implementation NSString (NumberConvenience)
-(NSNumber *) lengthAsNumber
{
    NSUInteger length = [self length];
    return [NSNumber numberWithUnsignedLong:length];
}
@end

@interface CategoryTest : GHTestCase
@end

@implementation CategoryTest
-(void) testCategory
{
    @autoreleasepool {
        NSMutableDictionary *dict= [NSMutableDictionary dictionary];
        
        [dict setObject:[@"hello" lengthAsNumber] forKey:@"hello"];
        [dict setObject:[@"iLikeFish" lengthAsNumber] forKey:@"iLikeFish"];
        [dict setObject:[@"Once upon a time" lengthAsNumber] forKey:@"Once upon a time"];
        
        GHTestLog(@"%@", dict);
    }
}

@end
