//
//  Car.m
//  GHUnitStudy
//
//  Created by wolf76 on 13-10-4.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import "Car.h"

@implementation Tire

@synthesize pressure;
@synthesize treadDepth;

-(id)init
{
    if(self = [self initWithPressure:34
                          treadDepth:20]){
    }
    return self;
} // init

-(id) initWithPressure:(float)p
{
    if (self = [self initWithPressure:p
                           treadDepth:20.0]){
    }
    return self;
} // initwithPressure

-(id) initWithTreadDepth:(float)td{
    if (self = [self initWithPressure:34.0
                           treadDepth:td]){
    }
    return self;
} // initWithTreadDepth

- (id) initWithPressure: (float) p
             treadDepth: (float) td
{
    if (self = [super init]) {
        pressure = p;
        treadDepth = td;
    }
    return (self);
} // initWithPressure:treadDepth:

-(NSString*) description
{
    NSString *desc;
    desc = [NSString stringWithFormat:
            @"Tire: Pressure: %.1f TreadDepth: %.1f",
            self.pressure, self.treadDepth];
    
    return desc;
} //description

@end // Tire

@implementation AllWeatherRadial

@synthesize rainHandling;
@synthesize snowHandling;

- (id) initWithPressure: (float) p
             treadDepth: (float) td
{
    if (self = [super initWithPressure: p
                            treadDepth: td]) {
        rainHandling = 23.7;
        snowHandling = 42.5;
    }
    
    return (self);
    
} // initWithPressure:treadDepth

- (NSString *) description
{
    NSString *desc;
    desc = [[NSString alloc] initWithFormat:
            @"AllWeatherRadial: %.1f / %.1f / %.1f / %.1f",
            [self pressure],
            [self treadDepth],
            [self rainHandling],
            [self snowHandling]];
    
    return (desc);
    
} // description

@end // AllWeatherRadial

////////////////////////////////////////////////////////////////////

@implementation Engine
-(NSString *)description
{
    return(@"I am an engine. Vrooom!");
} // description
@end

@implementation Slant6
-(NSString *) description
{
    return (@"I am a slant-6. VROOOM!");
} // description
@end

////////////////////////////////////////////////////////////////////

@implementation Car

@synthesize name;
@synthesize engine;

-(id) init
{
    if (self = [super init]) {
        self.name = @"car";
        tires = [NSMutableArray new];
        
        for (int i=0; i<4; i++)
            [tires addObject:[NSNull null]];
    }
    
    return (self);
} // init

-(void) dealloc
{
    self.name = nil;
    [tires release];
    [engine release];
    
    [super dealloc];
} // dealloc

-(void) setTire:(Tire *)tire
        atIndex:(int)index
{
    [tires replaceObjectAtIndex:index withObject:tire];
} // setTire: atIndex:

-(Tire*) tireAtIndex:(int)index
{
    Tire* tire = [tires objectAtIndex:index];
    return tire;
} // tireAtIndex:

-(NSString *) description
{
    NSMutableString* desc = [NSMutableString stringWithCapacity:50];
    [desc appendFormat:@"%@ has:\n", self.name];
    for (int i=0; i<4; i++)
        [desc appendFormat:@"%@\n", [self tireAtIndex:i]];
    
    [desc appendFormat:@"%@\n", engine];
    
    return desc;
} // description

@end
