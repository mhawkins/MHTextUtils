//
//  NSString+MHTextUtils.m
//  MHTextUtils
//
//  Created by Matt Hawkins on 6/29/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "NSString+MHTextUtils.h"

static NSString *kEllipsis = @"...";
static int kEllipsisLength = 3;

@implementation NSString (MHTextUtils)

-(NSString *)stringByTruncatingToFitLength:(int)length withEllipsis:(BOOL)useEllipsis
{
    // If the string in question is less than the limit, return a copy of it
    if([self length] <= length)
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

-(NSString *)stringByTruncatingToFitLength:(int)length
{
    // Assume we want an ellipsis
    return [self stringByTruncatingToFitLength:length withEllipsis:YES];
}

@end
