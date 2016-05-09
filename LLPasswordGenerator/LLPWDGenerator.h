//
//  LLPWDGenerator.h
//  LLPasswordGenerator
//
//  Created by AnarL on 16/4/29.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#define ZERO_TO_NINE @"0123456789"

#define SPECIAL_CHARACTERS @"!@#$%^&*(),.;'\" []\\{}/-+~`_="

#define ZERO_TO_F_LOWER @"0123456789abcdef"

#define ZERO_TO_F_UPPER @"0123456789ABCDEF"

#define LOWER_CHARACTERS @"abcdefghijklmnopqrstuvwxyz"

#define UPPER_CHARACTERS @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"

#define BINARY_NUMBERS @"01"

#define OCTONARY_NUMBERS @"1234567"

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

- (NSString *)generatePasswordWithTypes:(NSArray *)types length:(PasswordLength)length;

- (NSString *)generatePasswordWithTypes:(NSArray *)types pwdLength:(NSInteger)pwdLength;

@end
