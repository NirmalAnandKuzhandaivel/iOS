//
//  main.m
//  Assignment3
//

//  Copyright © 2016 nirmal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Department.h"
#import "Employee.h"
#import "Dealer.h"
#import "Vehicle.h"
#import "NSString+NSStringCategory.h"



int alphabeticalCheck(NSString *str);
int phoneNumberCheck(NSString *phoneNo);
int alphaNumericCheck(NSString *str1);
void saveDatatoDisk(Dealer *dealer);
void loadDataFromDisk();


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        char dName[2048]={ 0} ,dPhone[2048]={ 0 } ;
        char deaName[2048]={ 0},deaPhone[2048]={ 0 },deaCity[2048]={ 0 },deaAddress[2048]={ 0 },vMake[2048]={ 0 },
        vModel[2048]={ 0 },veType[2048]={ 0 };
        
        char eFirstName[2048]={0}, eLastName[2048]={0}, eCity[2048]={0}, eAddress[2048]={0}, ePhone[2048]={0},
        eZip[2048]={0}, eSSN[2048]={0};
        
        //Get the Dealer Details
        
        NSLog(@"Enter the Dealer Details");
        NSLog(@"Dealer Name(Only Alphabets):");
        scanf("%s",deaName);
        NSLog(@"Dealer Phone No(Only Numbers up to 10 digits");
        scanf("%s",deaPhone);
        NSLog(@"Dealer City(Only Alphabets):");
        scanf("%s",deaCity);
        NSLog(@"Dealer Address(Only Alphanumeric");
        scanf("%s",deaAddress);
        
        NSString *dealerName = [NSString stringWithUTF8String:deaName];
        NSString *dealerPhone= [NSString stringWithUTF8String:deaPhone];
        NSString *dealerCity = [NSString stringWithUTF8String:deaCity];
        NSString *dealerAddress= [NSString stringWithUTF8String:deaAddress];
        
        dealerName=[dealerName formatString:dealerName];
        dealerPhone=[dealerPhone formatNumberString:dealerPhone];
        dealerCity=[dealerCity formatString:dealerCity];
       
        
        if(alphabeticalCheck(dealerName)==1){
            NSLog(@" Error !! Enter only alphabets for Department Name");
            exit(0);
        }
        if(phoneNumberCheck(dealerPhone)==1){
            NSLog(@"Error !! Enter only 10 digit Nos for Phone no");
            exit(0);
        }
        if(alphabeticalCheck(dealerCity)==1){
            NSLog(@" Error !! Enter only alphabets for Dealer City");
            exit(0);
        }
        
        if(alphaNumericCheck(dealerAddress)==1){
            NSLog(@" Error !! Enter only Number and alphabets for Department Name");
            exit(0);
        }
        
        
        
        Dealer *dealer=[[Dealer alloc]init];
        dealer.name=dealerName;
        dealer.address=dealerAddress;
        dealer.city=dealerCity;
        dealer.phone=dealerPhone;
        
        //Get the Department Details
        
        NSLog(@"Enter the Department Details");
        NSLog(@"Department Name(Only Alphabets):");
        scanf("%s",dName);
        NSLog(@"Phone No(Only Numbers up to 10 digits");
        scanf("%s",dPhone);
        
        
        NSString *deptName = [NSString stringWithUTF8String:dName];
        NSString *deptPhone= [NSString stringWithUTF8String:dPhone];
        
        deptPhone=[deptPhone formatNumberString:deptPhone];
        deptName=[deptName formatString:deptName];
        
        
        if(alphabeticalCheck(deptName)==1){
            NSLog(@" Error !! Enter only alphabets for Department Name");
            exit(0);
        }
        if(phoneNumberCheck(deptPhone)==1){
            NSLog(@"Error !! Enter only 10 digit Nos for Phone no");
            exit(0);
        }
        
        Department *dept=[[Department alloc]init];
        dept.name=deptName;
        dept.phone=deptPhone;
        dept.dealer=dealer;
        
        [dealer addDepartment:dept];

        
        
        double miles,price;
        NSInteger vRating;
       
        
       
        
        BOOL value=YES;
        while(value){
            
            NSLog(@"1: Add a Vehicle  2: List Vehicle  3: Search Vehicle 4: Add Employee 5: List Employees 6: Modify a Vehicle 7: Load Data from File");
            
            int option;
            scanf("%d",&option);
            
            switch(option){
                case 1:
                {
                    //Get the Vehicle Details
                    
                    NSLog(@"Enter the Vehicle Details");
                    NSLog(@"Vehicle Make(Only Alphabets):");
                    scanf("%s",vMake);
                    NSLog(@"Vehicle Model(Only Alphabets):");
                    scanf("%s",vModel);
                    NSLog(@"Vehicle Type(Only Alphabets):");
                    scanf("%s",veType);
                    NSLog(@"Miles(Only Decimals):");
                    scanf("%lf",&miles);
                    NSLog(@"Price(Only Decimals):");
                    scanf("%lf",&price);
                    NSLog(@"Vehicle Rating");
                    scanf("%li",&vRating);
                    
                    
                    NSString *vmake=[NSString stringWithUTF8String:vMake];
                    NSString *vmodel=[NSString stringWithUTF8String:vModel];
                    NSString *vtype=[NSString stringWithUTF8String:veType];
                    
                    Vehicle *vehicle=[[Vehicle alloc]initWithVehicleModel:vmodel];
                    vehicle.miles=[NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithDouble:miles]decimalValue]];
                    vehicle.price=[NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithDouble:price]decimalValue]];
                    vehicle.year=[NSDate date];
                    vehicle.rating=vRating;
                    vehicle.department=dept;
                    vehicle.make=[vmake formatString:vmake];
                    vehicle.type=[vtype formatString:vtype];
                    [dept addVehicle:vehicle];
                    saveDatatoDisk(dealer);
                    
                    break;
                }
                case 2:
                {
                    //List the Vehicles
                    
                    [dept listVehicles];
                    break;
                }
                    
                case 3:
                {
                    //Search the Vehicles
                    
                    NSString *searchModel;
                    char model[2048]={ 0 };
                    NSLog(@"Enter the Vehicle Model");
                    scanf("%s",model);
                    searchModel=[NSString stringWithUTF8String:model];
                    NSMutableArray<Vehicle* >   *searchedVehicles=[[NSMutableArray<Vehicle* > alloc]init];
                    searchedVehicles=[dept searchVehicles:searchModel];
                    if(searchedVehicles!=nil){
                    for(Vehicle *veh in searchedVehicles){
                        NSLog(@"Vehicle Make %@",veh.make);
                        NSLog(@"Vehicle Model %@",veh.model);
                        NSLog(@"Vehicle Type %@",veh.type);
                        NSLog(@"%@",veh.price);
                        NSLog(@"%li",veh.rating);
                    }
                    }else{
                        NSLog(@"%@ Model Not Present",searchModel);
                    }
                    break;
                }
                    
                case 4:
                {
                    //Get the Employee Details
                    
                    NSLog(@"Enter the Employee Details");
                    NSLog(@"First Name(Only Alphabets):");
                    scanf("%s",eFirstName);
                    NSLog(@"Last Name(Only Alphabets):");
                    scanf("%s",eLastName);
                    NSLog(@"City(Only Alphabets):");
                    scanf("%s",eCity);
                    NSLog(@"Address(Only Alphabets):");
                    scanf("%s",eAddress);
                    NSLog(@"Phone(Only Numeric):");
                    scanf("%s",ePhone);
                    NSLog(@"Employee Zip(Only Numeric):");
                    scanf("%s",eZip);
                    NSLog(@"Employee SSN(Only Numeric):");
                    scanf("%s",eSSN);
                    
                    Employee *employee = [Employee alloc];
                    NSString *efirstName = [NSString stringWithUTF8String:eFirstName];
                    NSString *elastName = [NSString stringWithUTF8String:eLastName];
                    NSString *ecity = [NSString stringWithUTF8String:eCity];
                    NSString *eaddress = [NSString stringWithUTF8String:eAddress];
                    NSString *ephone = [NSString stringWithUTF8String:ePhone];
                    NSString *ezip = [NSString stringWithUTF8String:eZip];
                    NSString *essn = [NSString stringWithUTF8String:eSSN];
                    
                    employee.firstName=[efirstName formatString:efirstName];
                    employee.LastName=[elastName formatString:elastName];
                    employee.city=[ecity formatString:ecity];
                    employee.address=eaddress;
                    employee.phone=[ephone formatNumberString:ephone];
                    employee.zip=[ezip formatNumberString:ezip];
                    employee.ssn=[essn formatNumberString:essn];
        
                    
                    [dept addEmployee:employee];
                    saveDatatoDisk(dealer);
                    break;
                }
                    
                case 5:
                {
                    //List the Employees
                    
                    [dept listEmployees];
                    break;
                }
                    
                case 6:
                {
                    NSString *searchVehicleName,*vehicleModel;
                    char name[2048]={ 0 },model[2048]={ 0 };
                    NSLog(@"Enter the Vehicle Name whose Model is to be modified");
                    scanf("%s",name);
                    searchVehicleName=[NSString stringWithUTF8String:name];
                    Vehicle *v=[dept modifyVehicle:searchVehicleName];
                    searchVehicleName=[NSString stringWithUTF8String:name];
                    NSLog(@"The Model of the vehicle is %@",v.model);
                    
                    NSLog(@"Enter the New Vehicle Model");
                    scanf("%s",model);
                    
                    vehicleModel=[NSString stringWithUTF8String:model];
                    [v initWithVehicleModel:vehicleModel];
                    saveDatatoDisk(dealer);
                    break;
                }
                
                case 7:
                {
                    loadDataFromDisk();
                    break;
                }
                
                default:
                {
                    NSLog(@"Incorrect Details entered");
                    break;
                }
         }
            
            int c;
            NSLog(@"Do you wish to continue 1-CONTINUE/0 - EXIT");
            scanf("%d",&c);
            NSLog(@"%d",c);
            if(c == 1)
                value=YES;
            else
                value=NO;
            
        }
    
      
     
      
    }
    return 0;
}

//Validation for Alphabets

int alphabeticalCheck(NSString *str){
    
    NSString *myregex = @"^[A-Za-z]+$";
    int i=0;
    NSPredicate *deptNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myregex];
    if (![deptNameTest evaluateWithObject:str])  {
        i=1;
    }
    return i;
    
}

//Validation for Phone Number

int phoneNumberCheck(NSString *phoneNo){
    
    NSString *phoneRegex = @"[0-9]{10}";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    BOOL matches = [test evaluateWithObject:phoneNo];
    int i=0;
    if(!matches){
        i=1;
    }
    return i;
}

//Validation for Alphanumeric

int alphaNumericCheck(NSString *str1){
    
    NSString *myregex = @"^[A-Za-z0-9 ]+$";
    int i=0;
    NSPredicate *deptNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", myregex];
    if (![deptNameTest evaluateWithObject:str1])  {
        i=1;
    }
    return i;
}



void saveDatatoDisk(Dealer *dealer){
   
    
    [NSKeyedArchiver archiveRootObject:dealer toFile:@"/Users/kuzhandaivel.n/Documents/dealer.plist"];
    
    
}

void loadDataFromDisk(){
    
    Dealer *dealer=[[NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/kuzhandaivel.n/Documents/dealer.plist"] retain];
    NSLog(@"Dealer Details");
    NSLog(@"Dealer Name : %@ | Dealer City : %@ | Dealer Address : %@ | Dealer Phone : %@" , dealer.name,dealer.city,dealer.address,dealer.phone);
    NSLog(@"====================================================================================================================================");
    
    for(Department *department in dealer.departments){
        NSLog(@"Department Details");
        NSLog(@"Department Name : %@ | Department Phone : %@" , department.name,department.phone);
        NSLog(@"====================================================================================================================================");
        for(Vehicle *vehicle in department.vehicles){
            NSLog(@"Vehicle Details");
            NSLog(@"Vehicle Make : %@ | Vehicle Model : %@ | Vehicle Type : %@ | Vehicle Rating : %ld" , vehicle.make,vehicle.model,vehicle.type,(long)vehicle.rating);
            NSLog(@"Vehicle Price : %@ | Vehicle Year : %@ | Vehicle Department : %@" , vehicle.price,vehicle.year,vehicle.department.name);
            NSLog(@"====================================================================================================================================");
            
        }
        
        for(Employee *employee in department.employees){
            NSLog(@"Employee Details");
            NSLog(@"Employee firstname : %@ | Employee  LastName : %@ | Employee city : %@ | Employee address : %@" , employee.firstName,employee.LastName,employee.city,employee.address);
            NSLog(@"Employee ssn : %@ | Employee zip : %@ | Employee Department : %@" , employee.ssn,employee.zip,employee.department.name);
            NSLog(@"====================================================================================================================================");
            
        }
        
    }
    
}



