//
//  Dealer.m
//  Assignment3
//

//  Copyright © 2016 nirmal. All rights reserved.
//

#import "Dealer.h"
#import "Department.h"
@implementation Dealer

-(void)addDepartment:(Department *) department{
    if(_departments==nil){
        _departments=[[NSMutableArray alloc]init];
    }
    [_departments addObject:department];
}

@end
