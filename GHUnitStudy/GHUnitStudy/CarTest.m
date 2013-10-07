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

-(void)testProperties
{
    GHTestLog(@"Property Attributes\n");
    
    GHTestLog(@"1.getter=<name>, setter=<name>");
    GHTestLog(@"Specifies the name of the accessor methods that will be used for this property.\n");
    
    GHTestLog(@"2.readwrite or readonly");
    GHTestLog(@"Specifies whether this property will be able to be written to. Default is readwrite.\n");
    
    GHTestLog(@"3.assign, retain or copy");
    GHTestLog(@"Assign generates a setter with a plain assign to the varible. The default is assign.");
    GHTestLog(@"Retain generates a setter which retains the argument passed "
              "to it while assigning it to the variable.");
    GHTestLog(@"Copy generates an an accessor which copies the passed in value to the member variable.\n");
    
    GHTestLog(@"4.nonatomic");
    GHTestLog(@"Specifies that the generated accessor will be nonatomic, and therefore "
               "not threadsafe. The default value is atomic, or threadsafe.");
}

-(void)testProperties_ACopyStyleSetter
{
    GHTestLog(@"-(void)setFirstName:(NSString *)inValue");
    GHTestLog(@"{");
    GHTestLog(@"    [firstName autorelease];");
    GHTestLog(@"    firstName = [inValue copy];");
    GHTestLog(@"}");
}

-(void)testProperties_ARetainStyleSetter
{
    GHTestLog(@"-(void)setFirstName:(NSString *)inValue");
    GHTestLog(@"{");
    GHTestLog(@"    [firstName autorelease];");
    GHTestLog(@"    firstName = [inValue retain];");
    GHTestLog(@"}");
    
    GHTestLog(@"\n");
    GHTestLog(@"-(void)setFirstName:(NSString *)inValue");
    GHTestLog(@"{");
    GHTestLog(@"    [inValue retain];");
    GHTestLog(@"    [firstName release];");
    GHTestLog(@"    firstName = inValue;");
    GHTestLog(@"}");
}

@end
