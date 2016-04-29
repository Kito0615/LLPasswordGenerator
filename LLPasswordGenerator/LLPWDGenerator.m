//
//  LLPWDGenerator.m
//  LLPasswordGenerator
//
//  Created by AnarL on 16/4/29.
//  Copyright © 2016年 AnarL. All rights reserved.
//

#import "LLPWDGenerator.h"

@interface LLPWDGenerator()
{
    NSArray * _lengths;
}
@end

@implementation LLPWDGenerator

- (instancetype)init
{
    if (self = [super init]) {
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

- (NSString *)generatePasswordWithTypes:(NSArray *)types length:(PasswordLength)length
{
    return [self generatePasswordWithTypes:types pwdLength:[_lengths[length - Characters5] integerValue]];
}

- (NSString *)generatePasswordWithTypes:(NSArray *)types pwdLength:(NSInteger)pwdLength
{
    NSMutableString * characters = [NSMutableString string];
    
    for (NSString * character in types) {
        [characters appendString:character];
    }
    
    return [self generatePasswordWithCharacters:characters pwdLength:pwdLength];
}
@end
