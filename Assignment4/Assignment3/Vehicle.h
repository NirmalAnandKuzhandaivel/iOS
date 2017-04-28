//
//  Vehicle.h
//  Assignment3
//
//  Created by Nirmal Anand Kuzhandaivel on 10/21/16.
//  Copyright © 2016 nirmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Department.h"

@interface Vehicle : NSObject<NSCoding>


@property NSString *make;
@property NSDecimalNumber *miles;
@property(readonly) NSString *model;
@property NSString *photo;
@property NSDecimalNumber *price;
@property NSInteger rating;
@property NSString *type;
@property NSDate *year;
@property Department *department;

- (id)initWithVehicleModel:(NSString *) model;

@end
