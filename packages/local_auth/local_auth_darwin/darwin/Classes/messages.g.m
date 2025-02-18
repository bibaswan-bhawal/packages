// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v13.1.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "messages.g.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

/// Possible outcomes of an authentication attempt.
@implementation FLAAuthResultBox
- (instancetype)initWithValue:(FLAAuthResult)value {
  self = [super init];
  if (self) {
    _value = value;
  }
  return self;
}
@end

/// Pigeon equivalent of the subset of BiometricType used by iOS.
@implementation FLAAuthBiometricBox
- (instancetype)initWithValue:(FLAAuthBiometric)value {
  self = [super init];
  if (self) {
    _value = value;
  }
  return self;
}
@end

@interface FLAAuthStrings ()
+ (FLAAuthStrings *)fromList:(NSArray *)list;
+ (nullable FLAAuthStrings *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FLAAuthOptions ()
+ (FLAAuthOptions *)fromList:(NSArray *)list;
+ (nullable FLAAuthOptions *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FLAAuthResultDetails ()
+ (FLAAuthResultDetails *)fromList:(NSArray *)list;
+ (nullable FLAAuthResultDetails *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@interface FLAAuthBiometricWrapper ()
+ (FLAAuthBiometricWrapper *)fromList:(NSArray *)list;
+ (nullable FLAAuthBiometricWrapper *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation FLAAuthStrings
+ (instancetype)makeWithReason:(NSString *)reason
                       lockOut:(NSString *)lockOut
            goToSettingsButton:(NSString *)goToSettingsButton
       goToSettingsDescription:(NSString *)goToSettingsDescription
                  cancelButton:(NSString *)cancelButton
        localizedFallbackTitle:(nullable NSString *)localizedFallbackTitle {
  FLAAuthStrings *pigeonResult = [[FLAAuthStrings alloc] init];
  pigeonResult.reason = reason;
  pigeonResult.lockOut = lockOut;
  pigeonResult.goToSettingsButton = goToSettingsButton;
  pigeonResult.goToSettingsDescription = goToSettingsDescription;
  pigeonResult.cancelButton = cancelButton;
  pigeonResult.localizedFallbackTitle = localizedFallbackTitle;
  return pigeonResult;
}
+ (FLAAuthStrings *)fromList:(NSArray *)list {
  FLAAuthStrings *pigeonResult = [[FLAAuthStrings alloc] init];
  pigeonResult.reason = GetNullableObjectAtIndex(list, 0);
  pigeonResult.lockOut = GetNullableObjectAtIndex(list, 1);
  pigeonResult.goToSettingsButton = GetNullableObjectAtIndex(list, 2);
  pigeonResult.goToSettingsDescription = GetNullableObjectAtIndex(list, 3);
  pigeonResult.cancelButton = GetNullableObjectAtIndex(list, 4);
  pigeonResult.localizedFallbackTitle = GetNullableObjectAtIndex(list, 5);
  return pigeonResult;
}
+ (nullable FLAAuthStrings *)nullableFromList:(NSArray *)list {
  return (list) ? [FLAAuthStrings fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    self.reason ?: [NSNull null],
    self.lockOut ?: [NSNull null],
    self.goToSettingsButton ?: [NSNull null],
    self.goToSettingsDescription ?: [NSNull null],
    self.cancelButton ?: [NSNull null],
    self.localizedFallbackTitle ?: [NSNull null],
  ];
}
@end

@implementation FLAAuthOptions
+ (instancetype)makeWithBiometricOnly:(BOOL)biometricOnly
                               sticky:(BOOL)sticky
                      useErrorDialogs:(BOOL)useErrorDialogs {
  FLAAuthOptions *pigeonResult = [[FLAAuthOptions alloc] init];
  pigeonResult.biometricOnly = biometricOnly;
  pigeonResult.sticky = sticky;
  pigeonResult.useErrorDialogs = useErrorDialogs;
  return pigeonResult;
}
+ (FLAAuthOptions *)fromList:(NSArray *)list {
  FLAAuthOptions *pigeonResult = [[FLAAuthOptions alloc] init];
  pigeonResult.biometricOnly = [GetNullableObjectAtIndex(list, 0) boolValue];
  pigeonResult.sticky = [GetNullableObjectAtIndex(list, 1) boolValue];
  pigeonResult.useErrorDialogs = [GetNullableObjectAtIndex(list, 2) boolValue];
  return pigeonResult;
}
+ (nullable FLAAuthOptions *)nullableFromList:(NSArray *)list {
  return (list) ? [FLAAuthOptions fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.biometricOnly),
    @(self.sticky),
    @(self.useErrorDialogs),
  ];
}
@end

@implementation FLAAuthResultDetails
+ (instancetype)makeWithResult:(FLAAuthResult)result
                  errorMessage:(nullable NSString *)errorMessage
                  errorDetails:(nullable NSString *)errorDetails {
  FLAAuthResultDetails *pigeonResult = [[FLAAuthResultDetails alloc] init];
  pigeonResult.result = result;
  pigeonResult.errorMessage = errorMessage;
  pigeonResult.errorDetails = errorDetails;
  return pigeonResult;
}
+ (FLAAuthResultDetails *)fromList:(NSArray *)list {
  FLAAuthResultDetails *pigeonResult = [[FLAAuthResultDetails alloc] init];
  pigeonResult.result = [GetNullableObjectAtIndex(list, 0) integerValue];
  pigeonResult.errorMessage = GetNullableObjectAtIndex(list, 1);
  pigeonResult.errorDetails = GetNullableObjectAtIndex(list, 2);
  return pigeonResult;
}
+ (nullable FLAAuthResultDetails *)nullableFromList:(NSArray *)list {
  return (list) ? [FLAAuthResultDetails fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.result),
    self.errorMessage ?: [NSNull null],
    self.errorDetails ?: [NSNull null],
  ];
}
@end

@implementation FLAAuthBiometricWrapper
+ (instancetype)makeWithValue:(FLAAuthBiometric)value {
  FLAAuthBiometricWrapper *pigeonResult = [[FLAAuthBiometricWrapper alloc] init];
  pigeonResult.value = value;
  return pigeonResult;
}
+ (FLAAuthBiometricWrapper *)fromList:(NSArray *)list {
  FLAAuthBiometricWrapper *pigeonResult = [[FLAAuthBiometricWrapper alloc] init];
  pigeonResult.value = [GetNullableObjectAtIndex(list, 0) integerValue];
  return pigeonResult;
}
+ (nullable FLAAuthBiometricWrapper *)nullableFromList:(NSArray *)list {
  return (list) ? [FLAAuthBiometricWrapper fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    @(self.value),
  ];
}
@end

@interface FLALocalAuthApiCodecReader : FlutterStandardReader
@end
@implementation FLALocalAuthApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128:
      return [FLAAuthBiometricWrapper fromList:[self readValue]];
    case 129:
      return [FLAAuthOptions fromList:[self readValue]];
    case 130:
      return [FLAAuthResultDetails fromList:[self readValue]];
    case 131:
      return [FLAAuthStrings fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface FLALocalAuthApiCodecWriter : FlutterStandardWriter
@end
@implementation FLALocalAuthApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[FLAAuthBiometricWrapper class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FLAAuthOptions class]]) {
    [self writeByte:129];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FLAAuthResultDetails class]]) {
    [self writeByte:130];
    [self writeValue:[value toList]];
  } else if ([value isKindOfClass:[FLAAuthStrings class]]) {
    [self writeByte:131];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface FLALocalAuthApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLALocalAuthApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLALocalAuthApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLALocalAuthApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FLALocalAuthApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    FLALocalAuthApiCodecReaderWriter *readerWriter =
        [[FLALocalAuthApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void SetUpFLALocalAuthApi(id<FlutterBinaryMessenger> binaryMessenger,
                          NSObject<FLALocalAuthApi> *api) {
  /// Returns true if this device supports authentication.
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.local_auth_darwin.LocalAuthApi.isDeviceSupported"
        binaryMessenger:binaryMessenger
                  codec:FLALocalAuthApiGetCodec()];
    if (api) {
      NSCAssert(
          [api respondsToSelector:@selector(isDeviceSupportedWithError:)],
          @"FLALocalAuthApi api (%@) doesn't respond to @selector(isDeviceSupportedWithError:)",
          api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSNumber *output = [api isDeviceSupportedWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  /// Returns true if this device can support biometric authentication, whether
  /// any biometrics are enrolled or not.
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:
               @"dev.flutter.pigeon.local_auth_darwin.LocalAuthApi.deviceCanSupportBiometrics"
        binaryMessenger:binaryMessenger
                  codec:FLALocalAuthApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(deviceCanSupportBiometricsWithError:)],
                @"FLALocalAuthApi api (%@) doesn't respond to "
                @"@selector(deviceCanSupportBiometricsWithError:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSNumber *output = [api deviceCanSupportBiometricsWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  /// Returns the biometric types that are enrolled, and can thus be used
  /// without additional setup.
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.local_auth_darwin.LocalAuthApi.getEnrolledBiometrics"
        binaryMessenger:binaryMessenger
                  codec:FLALocalAuthApiGetCodec()];
    if (api) {
      NSCAssert(
          [api respondsToSelector:@selector(getEnrolledBiometricsWithError:)],
          @"FLALocalAuthApi api (%@) doesn't respond to @selector(getEnrolledBiometricsWithError:)",
          api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSArray<FLAAuthBiometricWrapper *> *output = [api getEnrolledBiometricsWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
  /// Attempts to authenticate the user with the provided [options], and using
  /// [strings] for any UI.
  {
    FlutterBasicMessageChannel *channel = [[FlutterBasicMessageChannel alloc]
           initWithName:@"dev.flutter.pigeon.local_auth_darwin.LocalAuthApi.authenticate"
        binaryMessenger:binaryMessenger
                  codec:FLALocalAuthApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(authenticateWithOptions:strings:completion:)],
                @"FLALocalAuthApi api (%@) doesn't respond to "
                @"@selector(authenticateWithOptions:strings:completion:)",
                api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FLAAuthOptions *arg_options = GetNullableObjectAtIndex(args, 0);
        FLAAuthStrings *arg_strings = GetNullableObjectAtIndex(args, 1);
        [api authenticateWithOptions:arg_options
                             strings:arg_strings
                          completion:^(FLAAuthResultDetails *_Nullable output,
                                       FlutterError *_Nullable error) {
                            callback(wrapResult(output, error));
                          }];
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
