//
//  MYKAD.h
//  MyID
//
//  Created by Jerry on 2/15/13.
//  Copyright (c) 2013 SecureMetric Technology Sdn. Bhd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYKAD : NSObject
{
    NSString *name;
    NSString *gmpcName;
    NSString *kptName;
    NSString *ICNo;
    NSString *oldICNo;
    NSDate *DOB;
    NSString *POB;
    NSString *gender;
    NSString* citizenship;
    NSDate* issueDate;
    NSString *race;
    NSString *religion;
    NSString *address1;
    NSString *address2;
    NSString *address3;
    NSString *postcode;
    NSString *city;
    NSString *state;
}
@property(readonly) NSString* name;
@property(readonly) NSString* gmpcName;
@property(readonly) NSString* kptName;
@property(readonly) NSString* ICNo;
@property(readonly) NSString* oldICNo;
@property(readonly) NSDate* DOB;
@property(readonly) NSString* POB;
@property(readonly) NSString* gender;
@property(readonly) NSString* citizenship;
@property(readonly) NSDate* issueDate;
@property(readonly) NSString* race;
@property(readonly) NSString* religion;
@property(readonly) NSString* address1;
@property(readonly) NSString* address2;
@property(readonly) NSString* address3;
@property(readonly) NSString* postcode;
@property(readonly) NSString* city;
@property(readonly) NSString* state;

@end
