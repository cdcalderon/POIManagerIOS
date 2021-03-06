//
//  Menu+CoreDataProperties.h
//  POI Manager
//
//  Created by carlos calderon on 4/13/16.
//  Copyright © 2016 carlos calderon. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Menu.h"

NS_ASSUME_NONNULL_BEGIN

@interface Menu (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *label;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSManagedObject *venue;

@end

NS_ASSUME_NONNULL_END
