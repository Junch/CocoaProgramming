//
//  CppTest.mm
//  GHUnitStudy
//
//  Created by wolf76 on 10/24/13.
//  Copyright (c) 2013 com.wolf76. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnit/GHUnit.h>
#include <iostream>
#include <string>
#include <algorithm>
using namespace std;


@interface CppTest : GHTestCase
@end

@implementation CppTest

-(void) testLambda1
{
    auto f1 = []()->char const * {return "Hello, Lambda";};
    GHTestLog(@"%s", f1());
    
    auto f2 = [](){return "Hello, Lambda";};
    GHTestLog(@"%s", f2());
    
    auto f3 = []{return "Hello, Lambda";};
    GHTestLog(@"%s", f3());
    
    auto f4 = [&self]{GHTestLog(@"Hello, Lambda");};
    f4();
    
    auto f5 = [self]{GHTestLog(@"Hello, Lambda");};
    f5();
}

-(void) testLambda2
{
    int nums[]={1,2,3,4,5,6};
    int sum=0;
    for_each(begin(nums), end(nums), [&sum](int n){
        sum += n;
    });
    
    GHTestLog(@"sum = %d", sum);
}

-(void) testLambda_capture
{
    int z = 1;
    auto f = [z](int x, int y) {return x + y + z;};
    GHTestLog(@"f(2,3)=%d", f(2,3));
    
    auto g = [=](int x, int y) {return x + y + z;};
    GHTestLog(@"g(2,3)=%d", g(2,3));
    
    auto h = [&](int x, int y) {return x + y + z;};
    GHTestLog(@"h(2,3)=%d", h(2,3));
    
    // Change the local variable
    auto gg = [=, &z](int x, int y) {
        z += 1;
        return x + y + z;
    };
    GHTestLog(@"gg(2,3)=%d", gg(2,3));
}

-(void) testLambda_vsBlock
{
    auto f = [](int x, int y)->int {return x + y;};
    GHTestLog(@"f(2,3)=%d", f(2,3));

    //int (^fb)(int, int);
    auto fb = ^(int x, int y) {return x*y;};
    GHTestLog(@"fb(2,3)=%d", fb(2,3));
    
    int z = 1;
    auto g = [z](int x, int y) {return x*y + z;};
    GHTestLog(@"g(2,3)=%d", g(2,3));
    
    auto gb = ^(int x, int y) {return x*y + z;};
    GHTestLog(@"gb(2,3)=%d", gb(2,3));
    
    auto h = [&z](int x, int y) {
        z += 1;
        return x*y + z;
    };
    GHTestLog(@"h(2,3)=%d", h(2,3));
    GHTestLog(@"h(2,3)=%d", h(2,3));
    
    __block int zb=1;
    auto hb = ^(int x, int y) {
        zb += 1;
        return x*y + zb;
    };
    GHTestLog(@"hb(2,3)=%d", hb(2,3));
    GHTestLog(@"hb(2,3)=%d", hb(2,3));
}

@end
