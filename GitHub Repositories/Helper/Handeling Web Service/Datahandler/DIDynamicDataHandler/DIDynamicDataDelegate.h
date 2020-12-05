//
//  DIDynamicDataDelegate.m
//  GitHub Repositories
//
//  Created by Eman Gaber on 1/1/15.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DIDynamicDataDelegate <NSObject>

@required
-(void)RequestStart;
-(void)RequestEndDueToInternetError;
-(void)RequestEndDueToError:(NSError *)error;

-(void)GetRepositoriesSucces:(NSMutableArray*)repositoryArray andTotalCount: (NSString*)totalCount;
-(void)GetRepositoriesFailWithResponse:(NSString*)ErrorNum;


@end


