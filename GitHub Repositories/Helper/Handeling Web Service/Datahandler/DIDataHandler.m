//
//  DIStaticDataHandler.m
//  GitHub Repositories
//
//  Created by Eman Gaber on 1/1/15.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

#import "DIDataHandler.h"
#import "DIDynamicDataHandler.h"

@interface DIDataHandler ()

@property (nonatomic, strong) DIDynamicDataHandler * dynamicDataHandler;

@end

@implementation DIDataHandler
#pragma mark - Initialization

- (id)init{
    
	self = [super init];
    
	if (self){
		
       self.dynamicDataHandler = [[DIDynamicDataHandler alloc] init];
        
	}
    
	return self;
}

+ (DIDataHandler *) sharedInstance {
    
    static DIDataHandler *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        
        _sharedInstance = [[DIDataHandler alloc] init];
    });
    
    return _sharedInstance;
}


-(void)searchRepositoriesWithQuary:(NSString*)quaryText andPageNum:(NSString*)pageNum andPageSize:(NSString*)pageSize WithDelegate:(id <DIDynamicDataDelegate>)delegate
{
    self.dynamicDataHandler.delegate=delegate;
    [self.dynamicDataHandler searchRepositoriesWithQuary:quaryText andPageNum:pageNum andPageSize:pageSize];
    
}

@end
