//
//  General.m
//  MBC_v1
//
//  Created by Eman Gaber on 4/12/15.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

#import "General.h"

@implementation General

#pragma mark TopTenArray Methods
+(id)sharedInstance{
    static General *MyManager = nil;
    @synchronized(self) {
        if (MyManager == nil)
            MyManager = [[self alloc] init];
    }
    
    return MyManager;
}


-(id)init{
    if (self = [super init]) {
        
    }
    
    return self;
}


+(NSString*)CheckNull:(id)string
{
    if (! ((string== nil) ||(string  == (id)[NSNull null])) )
    {
        NSString* result =[NSString stringWithFormat:@"%@",string];
        
        if ([result rangeOfString:@"1900"].location != NSNotFound)
            
        return [NSString stringWithFormat:@"-"];
    else
        if (! ((string== nil) ||(string  == (id)[NSNull null])))
        {
            return result;
        }else
            return[NSString new];

    }
        else
            return[NSString new];
    
}


+(NSArray*)CheckNullArray:(id)string
{
                if (! ((string== nil) ||(string  == (id)[NSNull null])))
            
                return string;
            else
                return[NSArray new];
        
}


@end
