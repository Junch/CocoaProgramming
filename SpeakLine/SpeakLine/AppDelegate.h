//
//  AppDelegate.h
//  SpeakLine
//
//  Created by wolf76 on 2/19/13.
//  Copyright (c) 2013 wolf76. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSSpeechSynthesizer *_speechSynth;
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *textField;

- (IBAction)stopIt:(id)sender;
- (IBAction)speakIt:(id)sender;

@end
