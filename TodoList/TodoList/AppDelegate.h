//
//  AppDelegate.h
//  TodoList
//
//  Created by wolf76 on 2/21/13.
//  Copyright (c) 2013 wolf76. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSMutableArray *tasks;
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTableView *tableView;

- (IBAction)add:(id)sender;
@end
