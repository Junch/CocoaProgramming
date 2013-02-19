//
//  AppDelegate.m
//  SpeakLine
//
//  Created by wolf76 on 2/19/13.
//  Copyright (c) 2013 wolf76. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize textField = _textField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (id)init
{
    self = [super init];
    if (self){
        NSLog(@"init");
        _speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
    }
    return self;
}


- (IBAction)stopIt:(id)sender {
    NSLog(@"stopping");
    [_speechSynth stopSpeaking];
}

- (IBAction)speakIt:(id)sender {
    NSString *string = [_textField stringValue];
    if ([string length] == 0){
        NSLog(@"string from %@ is of zero-length", _textField);
        return;
    }
    
    [_speechSynth startSpeakingString:string];
    NSLog(@"Have started to say: %@", string);
}
@end
