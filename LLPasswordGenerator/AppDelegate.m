//
//  AppDelegate.m
//  LLPasswordGenerator
//
//  Created by AnarL on 16/4/29.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    NSArray * _types;
    
    NSArray * _charactersTypes;
    NSArray * _passwordLengths;
    
    PasswordType _type;
    PasswordLength _length;
    
    NSMutableArray * _argumentsArray;
}

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [self setup];
}


- (BOOL)setup
{
    _argumentsArray = [NSMutableArray array];
    
    self.inputChar.hidden = YES;
    self.pwdTextfield.hidden = YES;
    self.unitLabel.hidden = YES;
    
    self.number029.tag = NumberZeroToNine;
    self.specialCharacter.tag = SpecialCharacters;
    self.number02f.tag = NumberZeroToLowerF;
    self.number02F.tag = NumberZeroToUpperF;
    self.a2zchar.tag = CharacterAToZLower;
    self.A2Zchar.tag = CharacterAToZUpper;
    self.binary.tag = BinaryNumber;
    self.octonary.tag = OctonaryNumber;
    self.selfDefine.tag = SelfDefinedCharacters;
    
    _type = NumberZeroToNine;
    
    self.pwd5.tag = Characters5;
    self.pwd6.tag= Characters6;
    self.pwd7.tag = Characters7;
    self.pwd8.tag = Characters8;
    self.pwd9.tag = Characters9;
    self.pwd10.tag = Characters10;
    self.pwd12.tag = Characters12;
    self.pwd14.tag = Characters14;
    self.pwd16.tag = Characters16;
    self.pwd32.tag = Characters32;
    self.pwd64.tag = Characters64;
    self.pwd100.tag = Characters100;
    self.pwd128.tag = Characters128;
    self.pwd256.tag = Characters256;
    self.pwd512.tag = Characters512;
    self.pwd999.tag = Characters999;
    self.pwd1000.tag = Characters1000;
    self.pwd1024.tag = Characters1024;
    self.pwdUndefine.tag = CharactersUndefined;
    
    _types = @[ZERO_TO_NINE, SPECIAL_CHARACTERS, ZERO_TO_F_LOWER, ZERO_TO_F_UPPER, LOWER_CHARACTERS, UPPER_CHARACTERS, BINARY_NUMBERS, OCTONARY_NUMBERS];
    
    _length = Characters5;
    
    _charactersTypes = @[_number029, _specialCharacter, _number02f, _number02F, _a2zchar, _A2Zchar, _binary, _octonary, _selfDefine];
    _passwordLengths = @[_pwd5, _pwd6, _pwd7, _pwd8, _pwd9, _pwd10, _pwd12, _pwd14, _pwd16, _pwd32, _pwd64, _pwd100, _pwd128, _pwd256, _pwd512, _pwd999, _pwd1000, _pwd1024, _pwdUndefine];
    
    return YES;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
#pragma mark -Functions

- (IBAction)setupCharacters:(NSButton *)sender
{
    if (sender == self.selfDefine) {
        self.inputChar.hidden = !sender.state;
        for (NSButton * btn in _charactersTypes) {
            if (btn != sender) {
                btn.state = 0;
            }
        }
    } else {
        self.selfDefine.state = 0;
        self.inputChar.hidden = !self.selfDefine.state;
    }
#if 0
    for (NSButton * btn in _charactersTypes) {
        btn.state = 0;
    }
    sender.state = 1;
    _type = (PasswordType)sender.tag;
#endif
}

- (IBAction)setupPasswordLength:(NSButton *)sender
{
    if (sender.tag != CharactersUndefined) {
        self.pwdTextfield.hidden = YES;
        self.unitLabel.hidden = YES;
    } else {
        self.pwdTextfield.hidden = NO;
        self.unitLabel.hidden = NO;
    }
    for (NSButton * btn in _passwordLengths) {
        btn.state = 0;
    }
    sender.state = 1;
    _length = (PasswordLength)sender.tag;
}

- (IBAction)generatePassword:(NSButton *)sender {
    
    if ([_argumentsArray count] != 0) {
        [_argumentsArray removeAllObjects];
    }
    
    LLPWDGenerator * generator = [LLPWDGenerator defaultGenerator];
    
    for (NSButton * btn in _charactersTypes) {
        if (btn.state == 1) {            
            if (btn == self.selfDefine) {
                [_argumentsArray addObject:self.inputChar.stringValue];
            } else {
                [_argumentsArray addObject:_types[(PasswordType)btn.tag - NumberZeroToNine]];
            }
        }
    }
    
    if (_length == CharactersUndefined) {
        if ([self.pwdTextfield.stringValue isEqualToString:@""]) {
            NSAlert * alert = [NSAlert alertWithMessageText:@"Please input your password length." defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
            [alert beginSheetModalForWindow:self.window completionHandler:^(NSModalResponse returnCode) {
                
            }];
        } else {
                        self.passwordResult.string = [generator generatePasswordWithTypes:_argumentsArray pwdLength:self.pwdTextfield.integerValue];
        }
    } else {
        self.passwordResult.string = [generator generatePasswordWithTypes:_argumentsArray length:_length];
    }
    
#if 0
    if (_type == SelfDefinedCharacters && _length == CharactersUndefined) {
        if ([self.inputChar.stringValue isEqualToString:@""]) {
            NSAlert * alert = [NSAlert alertWithMessageText:@"Please input what characters you want to create password from." defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
            [alert beginSheetModalForWindow:self.window completionHandler:^(NSModalResponse returnCode) {
                
            }];
        } else {
            self.passwordResult.string = [generator generatePasswordWithCharacters:self.inputChar.stringValue pwdLength:self.pwdTextfield.integerValue];
        }
    } else if (_type == SelfDefinedCharacters && _length != CharactersUndefined) {
        if ([self.inputChar.stringValue isEqualToString:@""]) {
            NSAlert * alert = [NSAlert alertWithMessageText:@"Please input what characters you want to create password from." defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
            [alert beginSheetModalForWindow:self.window completionHandler:^(NSModalResponse returnCode) {
                
            }];
        } else {
            self.passwordResult.string = [generator generatePasswordWithCharacters:self.inputChar.stringValue length:_length];
        }
        
    } else if (_type != SelfDefinedCharacters && _length == CharactersUndefined){
        if ([self.pwdTextfield.stringValue isEqualToString:@""]) {
            NSAlert * alert = [NSAlert alertWithMessageText:@"Please input your password length." defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@""];
            [alert beginSheetModalForWindow:self.window completionHandler:^(NSModalResponse returnCode) {
                
            }];
        } else {
//            self.passwordResult.string = [generator generatePasswordWithType:_type pwdLength:self.pwdTextfield.integerValue];
        }
    } else {
//        self.passwordResult.string = [generator generatePasswordWithType:_type length:_length];
    }
#endif
}

#pragma mark -Close

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

@end
