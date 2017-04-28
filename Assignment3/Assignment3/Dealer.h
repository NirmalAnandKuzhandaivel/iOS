//
//  Dealer.h
//  Assignment3
//

//  Copyright © 2016 nirmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Department.h"
@interface Dealer : NSObject

@property(assign,nonatomic,readwrite) NSString *name;
@property(assign,nonatomic,readwrite) NSString *city;
@property(assign,nonatomic,readwrite) NSString *address;
@property(assign,nonatomic,readwrite) NSString *phone;
@property NSMutableArray<Department* > *departments;

-(void)addDepartment:(Department *) department;

@end
