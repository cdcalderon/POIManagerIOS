//
//  Venue.m
//  POI Manager
//
//  Created by carlos calderon on 4/13/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//

#import "Venue.h"
#import "Contact.h"
#import "FSCategory.h"
#import "Location.h"
#import "Menu.h"

@implementation Venue

// Insert code here to add functionality to your managed object subclass

+(NSString *)keyPathForResponseObject
{
    return @"response.venues";
}
@end
