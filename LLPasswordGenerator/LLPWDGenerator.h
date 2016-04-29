//
//  LLPWDGenerator.h
//  LLPasswordGenerator
//
//  Created by AnarL on 16/4/29.
//  Copyright © 2016年 AnarL. All rights reserved.
//

typedef enum{
    
    NumberZeroToNine = 100,
    SpecialCharacters,
    NumberZeroToLowerF,
    NumberZeroToUpperF,
    CharacterAToZLower,
    CharacterAToZUpper,
    BinaryNumber,
    OctonaryNumber,
    
    SelfDefinedCharacters,
} PasswordType;

typedef enum{
    
    Characters5 = 200,
    Characters6,
    Characters7,
    Characters8,
    Characters9,
    Characters10,
    Characters12,
    Characters14,
    Characters16,
    Characters32,
    Characters64,
    Characters100,
    Characters128,
    Characters256,
    Characters512,
    Characters999,
    Characters1000,
    Characters1024,
    CharactersUndefined
    
} PasswordLength;

#import <Foundation/Foundation.h>

@interface LLPWDGenerator : NSObject

+ (instancetype)defaultGenerator;

- (NSString *)generatePasswordWithType:(PasswordType)type length:(PasswordLength)length;

- (NSString *)generatePasswordWithCharacters:(NSString *)characterString length:(PasswordLength)length;

- (NSString *)generatePasswordWithType:(PasswordType)type pwdLength:(NSInteger)length;

- (NSString *)generatePasswordWithCharacters:(NSString *)characterString pwdLength:(NSInteger)length;

@end
