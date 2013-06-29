//
//  NSString+MHTextUtils.m
//  MHTextUtils
//
//  Created by Matt Hawkins on 6/29/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//

#import "NSString+MHTextUtils.h"

static NSString *kEllipsis = @"...";
static int kEllipsisLength = 3;

@implementation NSString (MHTextUtils)

-(NSString *)stringTruncatedToLength:(int)length withEllipsis:(BOOL)useEllipsis
{
    // If the string in question is less than the limit, return a copy of it
    if([self length] < length)
    {
        return [self copy];
    }
    // Otherwise, truncate
    else
    {        
        // Truncated placeholder
        NSString *truncatedString = nil;
        
        // If we're using an ellipsis
        if(useEllipsis)
        {
            // Truncate the string with enough room to add an ellipsis
            truncatedString = [self substringWithRange:NSMakeRange(0, length-kEllipsisLength)];
            
            // If the last character is whitespace, don't add the ellipsis
            unichar lastCharacter = [truncatedString characterAtIndex:truncatedString.length-1];
            
            // Get our whitespace characters
            NSCharacterSet *whitespaceCharacters = [NSCharacterSet whitespaceAndNewlineCharacterSet];
            
            // If the last character is not whitespace, add the ellipsis
            if(![whitespaceCharacters characterIsMember:lastCharacter])
            {
                truncatedString = [truncatedString stringByAppendingString:kEllipsis];
            }
        }
        // If no ellipsis, do a simple substring
        else
        {
            truncatedString = [self substringWithRange:NSMakeRange(0, length)];
        }
        
        return truncatedString;
    }
}

-(NSString *)stringTruncatedToLength:(int)length
{
    return [self stringTruncatedToLength:length withEllipsis:YES];
}

@end
