//
//  AppDelegate.h
//  LLPasswordGenerator
//
//  Created by AnarL on 16/4/29.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LLPWDGenerator.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSButton *number029;
@property (weak) IBOutlet NSButton *specialCharacter;
@property (weak) IBOutlet NSButton *number02f;
@property (weak) IBOutlet NSButton *number02F;
@property (weak) IBOutlet NSButton *a2zchar;
@property (weak) IBOutlet NSButton *A2Zchar;
@property (weak) IBOutlet NSButton *binary;
@property (weak) IBOutlet NSButton *octonary;
@property (weak) IBOutlet NSButton *selfDefine;

@property (weak) IBOutlet NSTextField *inputChar;


@property (weak) IBOutlet NSButton *pwd5;
@property (weak) IBOutlet NSButton *pwd6;
@property (weak) IBOutlet NSButton *pwd7;
@property (weak) IBOutlet NSButton *pwd8;
@property (weak) IBOutlet NSButton *pwd9;
@property (weak) IBOutlet NSButton *pwd10;
@property (weak) IBOutlet NSButton *pwd12;
@property (weak) IBOutlet NSButton *pwd14;
@property (weak) IBOutlet NSButton *pwd16;
@property (weak) IBOutlet NSButton *pwd32;
@property (weak) IBOutlet NSButton *pwd64;
@property (weak) IBOutlet NSButton *pwd100;
@property (weak) IBOutlet NSButton *pwd128;
@property (weak) IBOutlet NSButton *pwd256;
@property (weak) IBOutlet NSButton *pwd512;
@property (weak) IBOutlet NSButton *pwd999;
@property (weak) IBOutlet NSButton *pwd1000;
@property (weak) IBOutlet NSButton *pwd1024;

@property (weak) IBOutlet NSButton *pwdUndefine;
@property (weak) IBOutlet NSTextField *pwdTextfield;
@property (weak) IBOutlet NSTextField *unitLabel;

- (IBAction)setupCharacters:(NSButton *)sender;

- (IBAction)setupPasswordLength:(NSButton *)sender;

- (IBAction)generatePassword:(NSButton *)sender;

@property (unsafe_unretained) IBOutlet NSTextView *passwordResult;
@end

