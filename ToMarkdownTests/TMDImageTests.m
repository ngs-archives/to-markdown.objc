//
//  TMDImageTests.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMDImage.h"

@interface TMDImageTests : XCTestCase

@property (nonatomic, strong) TMDImage *img;

@end

@implementation TMDImageTests

- (void)setUp {
  [super setUp];
  [self setImg:[[TMDImage alloc] init]];
}

- (void)tearDown {
  [super tearDown];
  [self setImg:nil];
}


- (void)testRegex {
  NSRegularExpression *re = [self.img regexAtIndex:0];
  XCTAssertNotNil(re);
  XCTAssertEqualObjects([re pattern], @"<img\\b([^>]*)\\/?>");
}

- (void)testReplaceText {
  NSString *text = nil;
  text = [self.img replaceText:@"foo <img src=\"foo.jpg\" alt=\"bar\"> bar <img src=\"foo.jpg\" alt=\"bar\" title=\"baz\"> qux"];
  XCTAssertEqualObjects(text, @"foo ![bar](foo.jpg) bar ![bar](foo.jpg \"baz\") qux");
}

@end
