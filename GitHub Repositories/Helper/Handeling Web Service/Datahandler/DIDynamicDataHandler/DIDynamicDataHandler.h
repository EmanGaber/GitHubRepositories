//
//  DIDynamicDataHandler.h
//  GitHub Repositories
//
//  Created by Eman Gaber on 1/1/15.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DIDynamicDataDelegate.h"

@interface DIDynamicDataHandler : NSObject

@property (nonatomic, weak) id <DIDynamicDataDelegate> delegate;

-(void)searchRepositoriesWithQuary:(NSString*)quaryText andPageNum:(NSString*)pageNum andPageSize:(NSString*)pageSize;

-(void)getRepositorDetailsWithRepoFullName:(NSString*)full_name;

@end
