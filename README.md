MHTextUtils
===========

Simple text truncating library for NSString created to support "Put Objective-C Back On The Map" https://objectivechackathon.appspot.com

Description
------------------

This is a dirt simple, unimpressive text truncating library for NSString. I had ran into a project recently where paragraphs of text were being passed into a UITableViewCell spiking its memory footprint. This project is a just quick way for dropping the memory usage by shortening the strings from paragraphs to a sentence or two.


Usage
------------------

    import "NSString+MHTextUtils.h"

    NSString *shortenedString = [@"lorem ipsum dolar" stringByTruncatingToFitLength:10];
    // "lorem i..."
    
If the last character before the ellipsis would be added is whitespace, we skip adding the ellipsis

    NSString *shortenedString = [@"lorem ipsum dolar" stringByTruncatingToFitLength:9];
    // "lorem " instead of "lorem ..."
    
You can also specify if you want to explicitly include or exclude an ellipsis
    
    NSString *shortenedString = [@"lorem ipsum dolar" stringByTruncatingToFitLength:9 withEllipsis:NO];
    // "lorem ips"
    
    
Adding NSString+MHTextUtils to your project
------------------    

1. Copy NSString+MHTextUtils.h and NSString+MHTextUtils.m into your project.
2. Import the category 
    import "NSString+MHTextUtils.h"
