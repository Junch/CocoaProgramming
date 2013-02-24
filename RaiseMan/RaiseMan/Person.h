//
//  Person.h
//  RaiseMan
//
//  Created by wolf76 on 13-2-22.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString *personName;
    float expectedRaise;
}

@property (readwrite, copy) NSString *personName;
@property (readwrite) float expectedRaise;

@end
