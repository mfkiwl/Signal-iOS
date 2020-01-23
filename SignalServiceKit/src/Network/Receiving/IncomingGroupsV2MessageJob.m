//
//  Copyright (c) 2020 Open Whisper Systems. All rights reserved.
//

#import "IncomingGroupsV2MessageJob.h"
#import <SignalServiceKit/SignalServiceKit-Swift.h>

NS_ASSUME_NONNULL_BEGIN

@implementation IncomingGroupsV2MessageJob

+ (NSString *)collection
{
    return @"IncomingGroupsV2MessageJob";
}

- (instancetype)initWithEnvelopeData:(NSData *)envelopeData
                       plaintextData:(NSData *_Nullable)plaintextData
                     wasReceivedByUD:(BOOL)wasReceivedByUD
{
    OWSAssertDebug(envelopeData);

    self = [super init];
    if (!self) {
        return self;
    }

    _envelopeData = envelopeData;
    _plaintextData = plaintextData;
    _wasReceivedByUD = wasReceivedByUD;
    _createdAt = [NSDate new];

    return self;
}

// --- CODE GENERATION MARKER

// This snippet is generated by /Scripts/sds_codegen/sds_generate.py. Do not manually edit it, instead run
// `sds_codegen.sh`.

// clang-format off

- (instancetype)initWithGrdbId:(int64_t)grdbId
                      uniqueId:(NSString *)uniqueId
                       createdAt:(NSDate *)createdAt
                    envelopeData:(NSData *)envelopeData
                   plaintextData:(nullable NSData *)plaintextData
                 wasReceivedByUD:(BOOL)wasReceivedByUD
{
    self = [super initWithGrdbId:grdbId
                        uniqueId:uniqueId];

    if (!self) {
        return self;
    }

    _createdAt = createdAt;
    _envelopeData = envelopeData;
    _plaintextData = plaintextData;
    _wasReceivedByUD = wasReceivedByUD;

    return self;
}

// clang-format on

// --- CODE GENERATION MARKER

- (nullable instancetype)initWithCoder:(NSCoder *)coder
{
    return [super initWithCoder:coder];
}

- (nullable SSKProtoEnvelope *)envelope
{
    NSError *error;
    SSKProtoEnvelope *_Nullable result = [SSKProtoEnvelope parseData:self.envelopeData error:&error];

    if (error) {
        OWSFailDebug(@"paring SSKProtoEnvelope failed with error: %@", error);
        return nil;
    }

    return result;
}

@end

NS_ASSUME_NONNULL_END
