//
//  DIDynamicDataDelegate.m
//  GitHub Repositories
//
//  Created by Eman Gaber on 1/1/15.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RepositoryModel.h"

@protocol DIDynamicDataDelegate <NSObject>

@required
-(void)requestStart;
-(void)requestEndDueToInternetError;
-(void)requestEndDueToError:(NSError *)error;


@optional
-(void)getRepositoriesSucces:(NSMutableArray*)repositoryArray andTotalCount: (NSString*)totalCount;
-(void)getRepositoriesFailWithResponse:(NSString*)ErrorNum;

-(void)getRepositoryDetailsSucces:(RepositoryModel*)repositoryModel;



@end


