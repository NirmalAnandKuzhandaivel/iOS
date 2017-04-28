//
//  NSString+NSStringCategory.m
//  Assignment3
//
//  Created by Nirmal Anand Kuzhandaivel on 10/20/16.
//  Copyright © 2016 nirmal. All rights reserved.
//

#import "NSString+NSStringCategory.h"

@implementation NSString (NSStringCategory)

-(NSString *)formatString:(NSString *) stringToFormat{
    
    NSString *trimmedString = nil;
    NSCharacterSet *numbersSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789!@#$%^&*() "];
    trimmedString = [stringToFormat stringByTrimmingCharactersInSet:numbersSet];
    
    return trimmedString;
    
}

-(NSString *)formatNumberString:(NSString *) stringToFormat;{
    
    NSString *trimmedString = nil;
    NSCharacterSet *numbersSet = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz!@#$%^&*() "];
    trimmedString = [stringToFormat stringByTrimmingCharactersInSet:numbersSet];
    
    return trimmedString;
}

@end
