//
//  TMDElementTests.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMDElement.h"

@interface TMDElementTests : XCTestCase

@end

@implementation TMDElementTests

- (void)testAttributeValue {
  TMDElement *e = [[TMDElement alloc] init];
  NSString *str = nil;
  str = [e attributeValueWithText:@"href=\"foo\""
                                       name:@"href"];
  XCTAssertEqualObjects(str, @"foo");
  str = [e attributeValueWithText:@"href=\"foo\""
                             name:@"target"];
  XCTAssertNil(str);
  str = [e attributeValueWithText:@""
                             name:@"target"];
  XCTAssertNil(str);
}

@end
