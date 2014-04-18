//
//  TMDParagraphTests.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMDParagraph.h"

@interface TMDParagraphTests : XCTestCase

@property (nonatomic, strong) TMDParagraph *para;

@end

@implementation TMDParagraphTests

- (void)setUp {
  [super setUp];
  [self setPara:[[TMDParagraph alloc] init]];
}

- (void)tearDown {
  [super tearDown];
  [self setPara:nil];
}


- (void)testRegex {
  NSRegularExpression *re = [self.para regexAtIndex:0];
  XCTAssertNotNil(re);
  XCTAssertEqualObjects([re pattern], @"<p\\b([^>]*)>([\\s\\S]*?)<\\/p>");
}

- (void)testReplaceText {
  NSString *text = nil;
  text = [self.para replaceText:@"<p>foo</p><p>bar</p><p>baz</p>"];
  XCTAssertEqualObjects(text, @"foo\n\nbar\n\nbaz\n\n");
}

@end
