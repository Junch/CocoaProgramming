//
//  RMDocument.h
//  RaiseMan
//
//  Created by wolf76 on 13-2-22.
//  Copyright (c) 2013年 com.wolf76. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RMDocument : NSDocument {
    NSMutableArray *employees;
}
- (void)setEmployees:(NSMutableArray *)a;
@end
