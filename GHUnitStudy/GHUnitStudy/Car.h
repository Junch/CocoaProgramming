//
//  Car.h
//  GHUnitStudy
//
//  Created by wolf76 on 13-10-4.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tire : NSObject

@property float pressure;
@property float treadDepth;

-(id)initWithPressure: (float)pressure;
-(id)initWithTreadDepth: (float)treadDepth;
-(id)initWithPressure: (float)pressure
           treadDepth: (float)treadDepth;
@end // Tire

@interface AllWeatherRadial : Tire

@property float rainHandling;
@property float snowHandling;

@end // AllWeatherRadial

///////////////////////////////////////////////////

@interface Engine : NSObject
@end // Engine

@interface Slant6: Engine
@end // Slant6

@interface Car : NSObject {
    NSMutableArray *tires;
}

@property (copy) NSString* name;
@property (retain) Engine* engine;

-(void) setTire: (Tire *) tire
        atIndex: (int) index;
-(Tire *) tireAtIndex: (int) index;
@end


