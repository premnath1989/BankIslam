//
//  MYKID.h
//  MyID
//
//  Created by Jerry on 2/15/13.
//  Copyright (c) 2013 SecureMetric Technology Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYKID : NSObject
{
    NSString* name; // 150 char
    NSString* ICNo; // 12 char
    NSString* birthCertNo; //15 char
    NSString* gender;
	NSString* citizenship; //18 char
	NSDate* registrationDate;
	NSString* POB;  //80 char
	NSDate* DOB;
	NSString* address1; //30char
	NSString* address2;
	NSString* address3;
	NSString* postcode; //6 char
	NSString* city; //24 char
	NSString* state; //30 char
    
    //Father Info
    NSString* fatherName;
	NSString* fatherICNo;
	NSString* fatherResidentType;
	NSString* fatherRace;
	NSString* fatherReligion;
    
    //Mother Info
    NSString* motherName;
    NSString* motherICNo;
    NSString* motherResidentType;
    NSString* motherRace;
    NSString* motherReligion;
}

@property (readonly) NSString* name;
@property (readonly) NSString* ICNo;
@property (readonly) NSString* birthCertNo;
@property (readonly) NSString* gender;
@property (readonly) NSString* citizenship;
@property (readonly) NSDate* registrationDate;
@property (readonly) NSString* POB;
@property (readonly) NSDate* DOB;
@property (readonly) NSString* address1;
@property (readonly) NSString* address2;
@property (readonly) NSString* address3;
@property (readonly) NSString* postcode;
@property (readonly) NSString* city;
@property (readonly) NSString* state;
@property (readonly) NSString* fatherName;
@property (readonly) NSString* fatherICNo;
@property (readonly) NSString* fatherResidentType;
@property (readonly) NSString* fatherRace;
@property (readonly) NSString* fatherReligion;
@property (readonly) NSString* motherName;
@property (readonly) NSString* motherICNo;
@property (readonly) NSString* motherResidentType;
@property (readonly) NSString* motherRace;
@property (readonly) NSString* motherReligion;
@end
