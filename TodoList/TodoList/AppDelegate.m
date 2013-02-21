//
//  AppDelegate.m
//  TodoList
//
//  Created by wolf76 on 2/21/13.
//  Copyright (c) 2013 wolf76. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    tasks = [[NSMutableArray alloc] init];
}

- (IBAction)add:(id)sender
{
    NSString *value = [_textField stringValue];
    [tasks addObject:value];
    [_tableView reloadData];
    [_textField setStringValue:@""];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    NSInteger num = (NSInteger)[tasks count];
    return num;
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
    return [tasks objectAtIndex:rowIndex];
}

@end
