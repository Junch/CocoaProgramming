//
//  Person.m
//  RaiseMan
//
//  Created by wolf76 on 13-2-22.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize personName;
@synthesize expectedRaise;

- (id)init
{
    self = [super init];
    if (self) {
        expectedRaise = 0.05;
        personName = @"New person";
    }
    return self;
}
@end
