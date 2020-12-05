//
//  DIDataHandler.h
//  GitHub Repositories
//
//  Created by Eman Gaber on 1/1/15.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DIDynamicDataDelegate.h"

@interface DIDataHandler: NSObject

+ (DIDataHandler *) sharedInstance;

-(void)searchRepositoriesWithQuary:(NSString*)quaryText andPageNum:(NSString*)pageNum andPageSize:(NSString*)pageSize WithDelegate:(id <DIDynamicDataDelegate>)delegate;

-(void)getRepositorDetailsWithRepoFullName:(NSString*)full_name WithDelegate:(id <DIDynamicDataDelegate>)delegate;

@end
