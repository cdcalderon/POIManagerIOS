//
//  POIFourSquareSessionManager.m
//  POI Manager
//
//  Created by carlos calderon on 4/14/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import "POIFourSquareSessionManager.h"
#import "AFHTTPSessionManager.h"

static NSString * const POIFoursquareBaseURLString = @"https://api.foursquare.com/v2/";

@implementation POIFourSquareSessionManager

+ (instancetype)sharedClient {
    static POIFourSquareSessionManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[POIFourSquareSessionManager alloc] initWithBaseURL:[NSURL URLWithString:POIFoursquareBaseURLString]];
    });
    return _sharedClient;
}

@end
