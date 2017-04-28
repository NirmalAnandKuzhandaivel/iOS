//
//  Vehicle.h
//  Assignment3
//

//  Copyright © 2016 nirmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Department.h"

@interface Vehicle : NSObject

@property NSString *make;
@property NSDecimalNumber *miles;
@property NSString *model;
@property NSString *photo;
@property NSDecimalNumber *price;
@property NSInteger rating;
@property NSString *type;
@property NSDate *year;
@property Department *department;


@end
