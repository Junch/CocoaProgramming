//
//  CarTest.m
//  GHUnitStudy
//
//  Created by wolf76 on 13-10-4.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnit/GHUnit.h>
#import "Car.h"

@interface CarTest : GHTestCase
@end

@implementation CarTest
-(void)testCar
{
    @autoreleasepool {
        Car * car = [[Car new] autorelease];
        car.name = @"Herbie";
        
        for (int i=0; i<4; i++) {
            AllWeatherRadial *tire;
            tire = [AllWeatherRadial new];
            tire.rainHandling = 20 + i;
            tire.snowHandling = 28 + i;
            
            [car setTire:tire atIndex:i];
            [tire release];
        }
        
        Slant6 *engine = [Slant6 new];
        car.engine = engine;
        [engine release];
        
        GHTestLog(@"%@", car);
        
        Car* carCopy= [car copy];
        carCopy.name = @"Benz";
        GHTestLog(@"%@", carCopy);
    }
}

-(void)testConformsToProtocol
{
    Car *car = [Car new];
    if ([car conformsToProtocol:@protocol(NSCopying)])
        GHTestLog(@"car conforms to protocol NSCopying");
    [car release];
}

@end
