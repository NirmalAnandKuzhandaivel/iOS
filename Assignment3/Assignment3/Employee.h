//
//  Employee.h
//  Assignment3
//

//  Copyright © 2016 nirmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Department.h"

@interface Employee : NSObject

@property NSString *firstName;
@property NSString *LastName;
@property NSString *city;
@property NSString *address;
@property NSString *phone;
@property NSString *zip;
@property NSString *ssn;
@property(assign,nonatomic,readwrite) Department *department;


@end
