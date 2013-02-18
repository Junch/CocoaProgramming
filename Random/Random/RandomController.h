//
//  RandomController.h
//  Random
//
//  Created by wolf76 on 2/18/13.
//  Copyright (c) 2013 wolf76. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomController : NSObject {
    IBOutlet NSTextField *textField;
}
-(IBAction) seed:(id)sender;
-(IBAction) generate:(id)sender;
@end
