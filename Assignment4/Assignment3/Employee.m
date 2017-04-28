//
//  Employee.m
//  Assignment3
//

//  Copyright © 2016 nirmal. All rights reserved.
//

#import "Employee.h"

@implementation Employee

- (id)initWithCoder:(NSCoder *)coder {
    self = [self init];
    self.firstName = [coder decodeObjectForKey:@"firstName"];
    self.LastName    = [coder decodeObjectForKey:@"LastName"];
    self.city = [coder decodeObjectForKey:@"city"];
    self.address = [coder decodeObjectForKey:@"address"];
    self.phone    = [coder decodeObjectForKey:@"phone"];
    self.zip = [coder decodeObjectForKey:@"zip"];
    self.department = [coder decodeObjectForKey:@"department"];
    
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_firstName forKey:@"firstName"];
    [aCoder encodeObject:_LastName forKey:@"LastName"];
    [aCoder encodeObject:_address forKey:@"address"];
    [aCoder encodeObject:_phone forKey:@"phone"];
    [aCoder encodeObject:_city forKey:@"city"];
    [aCoder encodeObject:_zip forKey:@"zip"];
    [aCoder encodeObject:_ssn forKey:@"department"];
}



@end
