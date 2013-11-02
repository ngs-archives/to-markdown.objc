
  //
//  TMDImage.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import "TMDImage.h"

@implementation TMDImage

- (BOOL)isVoid {
  return YES;
}

- (NSArray *)patterns {
  return @[@"img"];
}

-(NSString *)replaceText:(NSString *)text withTextCheckingResult:(NSTextCheckingResult *)result {
  if([result numberOfRanges] == 2) {
    NSRange r1 = [result rangeAtIndex:1];
    NSRange r2 = [result rangeAtIndex:2];
    NSString *attrs = [text substringWithRange:r1];
    NSString *value = [text substringWithRange:r2];
    NSString *src  = [self attributeValueWithText:attrs name:@"src"];
    NSString *alt = [self attributeValueWithText:attrs name:@"alt"];
    NSString *title = [self attributeValueWithText:attrs name:@"title"];
    


  }
  return text;
}


@end
