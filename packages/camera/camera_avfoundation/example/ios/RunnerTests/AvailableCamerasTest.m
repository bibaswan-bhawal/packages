// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

@import camera_avfoundation;
@import camera_avfoundation.Test;
@import XCTest;
@import AVFoundation;
#import <OCMock/OCMock.h>
#import "MockFLTThreadSafeFlutterResult.h"

@interface AvailableCamerasTest : XCTestCase
@end

@implementation AvailableCamerasTest

- (void)testAvailableCamerasShouldReturnAllCamerasOnMultiCameraIPhone {
  CameraPlugin *camera = [[CameraPlugin alloc] initWithRegistry:nil messenger:nil];
  XCTestExpectation *expectation =
      [[XCTestExpectation alloc] initWithDescription:@"Result finished"];

  // Internal cameras:
  AVCaptureDevice *wideAngleCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([wideAngleCamera uniqueID]).andReturn(@"0");
  OCMStub([wideAngleCamera position]).andReturn(AVCaptureDevicePositionBack);

  AVCaptureDevice *frontFacingCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([frontFacingCamera uniqueID]).andReturn(@"1");
  OCMStub([frontFacingCamera position]).andReturn(AVCaptureDevicePositionFront);

  AVCaptureDevice *ultraWideCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([ultraWideCamera uniqueID]).andReturn(@"2");
  OCMStub([ultraWideCamera position]).andReturn(AVCaptureDevicePositionBack);

  AVCaptureDevice *telephotoCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([telephotoCamera uniqueID]).andReturn(@"3");
  OCMStub([telephotoCamera position]).andReturn(AVCaptureDevicePositionBack);

  NSMutableArray *requiredTypes =
      [@[ AVCaptureDeviceTypeBuiltInWideAngleCamera, AVCaptureDeviceTypeBuiltInTelephotoCamera ]
          mutableCopy];
  if (@available(iOS 13.0, *)) {
    [requiredTypes addObject:AVCaptureDeviceTypeBuiltInUltraWideCamera];
  }
  if (@available(iOS 17.0, *)) {
    [requiredTypes addObject:AVCaptureDeviceTypeExternal];
  }
  id discoverySessionMock = OCMClassMock([AVCaptureDeviceDiscoverySession class]);
  OCMStub([discoverySessionMock discoverySessionWithDeviceTypes:requiredTypes
                                                      mediaType:AVMediaTypeVideo
                                                       position:AVCaptureDevicePositionUnspecified])
      .andReturn(discoverySessionMock);

  NSMutableArray *cameras = [NSMutableArray array];
  [cameras addObjectsFromArray:@[ wideAngleCamera, frontFacingCamera, telephotoCamera ]];
  if (@available(iOS 13.0, *)) {
    [cameras addObject:ultraWideCamera];
  }
  OCMStub([discoverySessionMock devices]).andReturn([NSArray arrayWithArray:cameras]);

  MockFLTThreadSafeFlutterResult *resultObject =
      [[MockFLTThreadSafeFlutterResult alloc] initWithExpectation:expectation];

  // Set up method call
  FlutterMethodCall *call = [FlutterMethodCall methodCallWithMethodName:@"availableCameras"
                                                              arguments:nil];

  [camera handleMethodCallAsync:call result:resultObject];

  // Verify the result
  NSDictionary *dictionaryResult = (NSDictionary *)resultObject.receivedResult;
  if (@available(iOS 13.0, *)) {
    XCTAssertTrue([dictionaryResult count] == 4);
  } else {
    XCTAssertTrue([dictionaryResult count] == 3);
  }
}
- (void)testAvailableCamerasShouldReturnExternalCameraIfAvailable {
  CameraPlugin *camera = [[CameraPlugin alloc] initWithRegistry:nil messenger:nil];
  XCTestExpectation *expectation =
      [[XCTestExpectation alloc] initWithDescription:@"Result finished"];

  // Internal Cameras:
  AVCaptureDevice *wideAngleCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([wideAngleCamera uniqueID]).andReturn(@"0");
  OCMStub([wideAngleCamera position]).andReturn(AVCaptureDevicePositionBack);

  AVCaptureDevice *frontFacingCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([frontFacingCamera uniqueID]).andReturn(@"1");
  OCMStub([frontFacingCamera position]).andReturn(AVCaptureDevicePositionFront);

  AVCaptureDevice *ultraWideCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([ultraWideCamera uniqueID]).andReturn(@"2");
  OCMStub([ultraWideCamera position]).andReturn(AVCaptureDevicePositionBack);

  AVCaptureDevice *telephotoCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([telephotoCamera uniqueID]).andReturn(@"3");
  OCMStub([telephotoCamera position]).andReturn(AVCaptureDevicePositionBack);

  // External Camera (iPhone doesn't support external camera):
  AVCaptureDevice *externalCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([externalCamera uniqueID]).andReturn(@"4");
  OCMStub([externalCamera position]).andReturn(AVCaptureDevicePositionUnspecified);

  NSMutableArray *requiredTypes =
      [@[ AVCaptureDeviceTypeBuiltInWideAngleCamera, AVCaptureDeviceTypeBuiltInTelephotoCamera ]
          mutableCopy];
  if (@available(iOS 13.0, *)) {
    [requiredTypes addObject:AVCaptureDeviceTypeBuiltInUltraWideCamera];
  }
  if (@available(iOS 17.0, *)) {
    [requiredTypes addObject:AVCaptureDeviceTypeExternal];
  }
  id discoverySessionMock = OCMClassMock([AVCaptureDeviceDiscoverySession class]);
  OCMStub([discoverySessionMock discoverySessionWithDeviceTypes:requiredTypes
                                                      mediaType:AVMediaTypeVideo
                                                       position:AVCaptureDevicePositionUnspecified])
      .andReturn(discoverySessionMock);

  NSMutableArray *cameras = [NSMutableArray array];
  [cameras addObjectsFromArray:@[ wideAngleCamera, frontFacingCamera, telephotoCamera ]];
  if (@available(iOS 13.0, *)) {
    [cameras addObject:ultraWideCamera];
  }
  if (@available(iOS 17.0, *)) {
    [cameras addObject:externalCamera];
  }
  OCMStub([discoverySessionMock devices]).andReturn([NSArray arrayWithArray:cameras]);

  MockFLTThreadSafeFlutterResult *resultObject =
      [[MockFLTThreadSafeFlutterResult alloc] initWithExpectation:expectation];

  // Set up method call
  FlutterMethodCall *call = [FlutterMethodCall methodCallWithMethodName:@"availableCameras"
                                                              arguments:nil];

  [camera handleMethodCallAsync:call result:resultObject];

  // Verify the result
  NSArray *dictionaryResult = (NSArray *)resultObject.receivedResult;
  if (@available(iOS 17.0, *)) {
    XCTAssertTrue([dictionaryResult count] == 5);
    NSDictionary *externalCameraResult = dictionaryResult[4];
    XCTAssertEqualObjects(externalCameraResult[@"name"], @"4");
    XCTAssertEqualObjects(externalCameraResult[@"lensFacing"], @"external");
  } else if (@available(iOS 13.0, *)) {
    XCTAssertTrue([dictionaryResult count] == 4);
  } else {
    XCTAssertTrue([dictionaryResult count] == 3);
  }
}
- (void)testAvailableCamerasShouldReturnOneCameraOnSingleCameraIPhone {
  CameraPlugin *camera = [[CameraPlugin alloc] initWithRegistry:nil messenger:nil];
  XCTestExpectation *expectation =
      [[XCTestExpectation alloc] initWithDescription:@"Result finished"];

  // Internal Cameras:
  AVCaptureDevice *wideAngleCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([wideAngleCamera uniqueID]).andReturn(@"0");
  OCMStub([wideAngleCamera position]).andReturn(AVCaptureDevicePositionBack);

  AVCaptureDevice *frontFacingCamera = OCMClassMock([AVCaptureDevice class]);
  OCMStub([frontFacingCamera uniqueID]).andReturn(@"1");
  OCMStub([frontFacingCamera position]).andReturn(AVCaptureDevicePositionFront);

  NSMutableArray *requiredTypes =
      [@[ AVCaptureDeviceTypeBuiltInWideAngleCamera, AVCaptureDeviceTypeBuiltInTelephotoCamera ]
          mutableCopy];
  if (@available(iOS 13.0, *)) {
    [requiredTypes addObject:AVCaptureDeviceTypeBuiltInUltraWideCamera];
  }
  if (@available(iOS 17.0, *)) {
    [requiredTypes addObject:AVCaptureDeviceTypeExternal];
  }
  id discoverySessionMock = OCMClassMock([AVCaptureDeviceDiscoverySession class]);
  OCMStub([discoverySessionMock discoverySessionWithDeviceTypes:requiredTypes
                                                      mediaType:AVMediaTypeVideo
                                                       position:AVCaptureDevicePositionUnspecified])
      .andReturn(discoverySessionMock);

  NSMutableArray *cameras = [NSMutableArray array];
  [cameras addObjectsFromArray:@[ wideAngleCamera, frontFacingCamera ]];
  OCMStub([discoverySessionMock devices]).andReturn([NSArray arrayWithArray:cameras]);

  MockFLTThreadSafeFlutterResult *resultObject =
      [[MockFLTThreadSafeFlutterResult alloc] initWithExpectation:expectation];

  // Set up method call
  FlutterMethodCall *call = [FlutterMethodCall methodCallWithMethodName:@"availableCameras"
                                                              arguments:nil];

  [camera handleMethodCallAsync:call result:resultObject];

  // Verify the result
  NSDictionary *dictionaryResult = (NSDictionary *)resultObject.receivedResult;
  XCTAssertTrue([dictionaryResult count] == 2);
}

@end
