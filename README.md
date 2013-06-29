MHTextUtils
===========

Simple text truncating library for NSString.

Description
------------------

This is a dirt simple, unimpressive text truncating library for NSString. I had ran into a project recently where paragraphs of text were being passed into a UITableViewCell spiking its memory footprint. This project is a just quick way for dropping the memory usage by shortening the strings from paragraphs to a sentence or two.


Usage
------------------

    import "NSString+MHTextUtils.h"

    NSString *shortenedString = [@"lorem ipsum dolar" stringByTruncatingToFitLength:9];
    // lorem i...
    
    
Adding NSString+MHTextUtils to your project
------------------    

1. Copy NSString+MHTextUtils.h and NSString+MHTextUtils.m into your project.
2. Import the category 
    import "NSString+MHTextUtils.h"