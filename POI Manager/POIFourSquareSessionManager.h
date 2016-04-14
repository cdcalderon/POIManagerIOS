//
//  POIFourSquareSessionManager.h
//  POI Manager
//
//  Created by carlos calderon on 4/14/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface POIFourSquareSessionManager : AFHTTPSessionManager

+(instancetype)sharedClient;
@end
