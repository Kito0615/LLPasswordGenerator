//
//  LLPWDGenerator.m
//  LLPasswordGenerator
//
//  Created by AnarL on 16/4/29.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "LLPWDGenerator.h"
#define ZERO_TO_NINE @"0123456789"

#define SPECIAL_CHARACTERS @"!@#$%^&*(),.;'\" []\\{}/-+~`_="

#define ZERO_TO_F_LOWER @"0123456789abcdef"

#define ZERO_TO_F_UPPER @"0123456789ABCDEF"

#define LOWER_CHARACTERS @"abcdefghijklmnopqrstuvwxyz"

#define UPPER_CHARACTERS @"ABCDEFGHIJKLMNOPQRSTUVWXYZ"

#define BINARY_NUMBERS @"01"

#define OCTONARY_NUMBERS @"1234567"
@interface LLPWDGenerator()
{
    NSArray * _lengths;
    NSArray * _types;
}
@end

@implementation LLPWDGenerator

- (instancetype)init
{
    if (self = [super init]) {
        _types = @[ZERO_TO_NINE, SPECIAL_CHARACTERS, ZERO_TO_F_LOWER, ZERO_TO_F_UPPER, LOWER_CHARACTERS, UPPER_CHARACTERS, BINARY_NUMBERS, OCTONARY_NUMBERS];
        _lengths = @[@(5),@(6),@(7),@(8),@(9),@(10),@(12),@(14),@(16),@(32),@(64),@(100),@(128),@(256),@(512),@(999),@(1000),@(1024)];
    }
    return self;
}

+ (instancetype)defaultGenerator
{
    static LLPWDGenerator * instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LLPWDGenerator alloc] init];
    });
    return instance;
}

- (NSString *)generatePasswordWithType:(PasswordType)type length:(PasswordLength)length
{
    return [self generatePasswordWithCharacters:_types[type - NumberZeroToNine] pwdLength:[_lengths[length - Characters5] integerValue]];
}

- (NSString *)generatePasswordWithType:(PasswordType)type pwdLength:(NSInteger)length
{
    return [self generatePasswordWithCharacters:_types[type - NumberZeroToNine] pwdLength:length];
}

- (NSString *)generatePasswordWithCharacters:(NSString *)characterString length:(PasswordLength)length
{
    return [self generatePasswordWithCharacters:characterString pwdLength:[_lengths[length - Characters5] integerValue]];
}

-(NSString *)generatePasswordWithCharacters:(NSString *)characterString pwdLength:(NSInteger)length
{
    NSMutableString * result = [NSMutableString string];
    
    for (int i = 0; i < length; i ++) {
        
        int index = arc4random() % characterString.length;
        
        [result appendFormat:@"%c", [characterString characterAtIndex:index]];
        
    }
    
    return result;
}
@end
