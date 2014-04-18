//
//  TMDItalicTests.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMDItalic.h"

@interface TMDItalicTests : XCTestCase

@property (nonatomic, strong) TMDItalic *i;

@end

@implementation TMDItalicTests

- (void)setUp {
  [super setUp];
  [self setI:[[TMDItalic alloc] init]];
}

- (void)tearDown {
  [super tearDown];
  [self setI:nil];
}


- (void)testRegex {
  NSRegularExpression *re = nil;
  re = [self.i regexAtIndex:0];
  XCTAssertEqualObjects([re pattern], @"<i\\b([^>]*)>([\\s\\S]*?)<\\/i>");
  re = [self.i regexAtIndex:1];
  XCTAssertEqualObjects([re pattern], @"<em\\b([^>]*)>([\\s\\S]*?)<\\/em>");
}

- (void)testReplaceText {
  NSString *text = nil;
  text = [self.i replaceText:@"foo <i class=\"foo\">Bar</i> baz"];
  XCTAssertEqualObjects(text, @"foo _Bar_ baz");
  text = [self.i replaceText:@"<em class=\"foo\">Bar</em>"];
  XCTAssertEqualObjects(text, @"_Bar_");
  text = [self.i replaceText:@"<a class=\"foo\">Bar</a>"];
  XCTAssertEqualObjects(text, @"<a class=\"foo\">Bar</a>");
  text = [self.i replaceText:@"<i>Bar</i>"];
  XCTAssertEqualObjects(text, @"_Bar_");
  text = [self.i replaceText:@"<em>Bar</em>"];
  XCTAssertEqualObjects(text, @"_Bar_");
  text = [self.i replaceText:@"<a>Bar</a>"];
  XCTAssertEqualObjects(text, @"<a>Bar</a>");
}

@end
