//
//  CFNetworkTest.c
//  GHUnitStudy
//
//  Created by wolf76 on 10/29/13.
//  Copyright (c) 2013 com.wolf76. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GHUnit/GHUnit.h>
#import <CFNetwork/CFNetwork.h>


@interface NSURLConnectionTest : GHTestCase
@end

@implementation NSURLConnectionTest

-(void) testNSURLConnection
{
    NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]];
    NSURLResponse * response = nil;
    NSError * error = nil;
    NSData * data = [NSURLConnection sendSynchronousRequest:urlRequest
                                          returningResponse:&response
                                                      error:&error];
    if (error == nil)
    {
        // Parse data here
        NSString* htmlStr = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        
        GHTestLog(htmlStr);
    }
}

@end

