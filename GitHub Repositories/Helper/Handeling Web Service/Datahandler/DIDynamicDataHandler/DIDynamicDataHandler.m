
//
//  DIDynamicDataHandler.m
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/4/20.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

#import "DIDynamicDataHandler.h"
#import "SSConstaints.h"
#import "Reachability.h"
#import "AFHTTPRequestOperationManager.h"
#import "General.h"
#import "RepositoryModel.h"

@implementation DIDynamicDataHandler
{
    
    BOOL failed;
    BOOL checkStatus;
    
    NSUserDefaults* defaults;
    Reachability *reachability;
    NetworkStatus internetStatus;
}

#pragma mark - GetRepositoriesList
-(void)searchRepositoriesWithQuery:(NSString*)quaryText andPageNum:(NSString*)pageNum andPageSize:(NSString*)pageSize
{
    reachability = [Reachability reachabilityForInternetConnection];
    internetStatus = [reachability currentReachabilityStatus];
    
    
    id <DIDynamicDataDelegate> delegatess =_delegate;
    if (internetStatus == ReachableViaWiFi || internetStatus == ReachableViaWWAN)
    {
        AFHTTPRequestOperationManager * ses = [AFHTTPRequestOperationManager manager];
        
        [delegatess requestStart];
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        ses.responseSerializer=responseSerializer;
        ses.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
        [ses.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        NSString* url = [NSString stringWithFormat:@"%@%@?q=%@&page=%@&per_page=%@",WEBSERVICE_BASE_URL,REPOSITORIES_URL,quaryText,pageNum,pageSize];
        
        NSString* urlwithPercentEscapes = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        
        NSLog(@"serviceurl+++ %@", urlwithPercentEscapes);
        
        [ses GET:urlwithPercentEscapes parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"%@",responseObject);
            NSLog(@"%@",operation.response);
            
            
            if (responseObject != nil){
                NSDictionary* resultDic = responseObject;
                
                if ([resultDic[@"message"] isEqualToString:@"Only the first 1000 search results are available"]) {
                    if ([delegatess respondsToSelector:@selector(getRepositoriesFailWithResponse:)])
                        [delegatess getRepositoriesFailWithResponse:responseObject];
                    
                }else {
                    NSArray* itemsArray = resultDic[@"items"];
                    NSMutableArray* finalRepoArray =[NSMutableArray new];
                    
                    for (NSDictionary * dic in itemsArray) {
                        
                        [finalRepoArray addObject:[RepositoryModel getRepositoryModelFromDic:dic]];
                        
                    }
                    
                    NSString* totalCount = [NSString stringWithFormat:@"%@",resultDic[@"total_count"]];
                    
                    
                    [delegatess getRepositoriesSucces:finalRepoArray andTotalCount: totalCount];
                }
                
            }else
            {
                
                if ([delegatess respondsToSelector:@selector(getRepositoriesFailWithResponse:)])
                    [delegatess getRepositoriesFailWithResponse:responseObject];
                
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //NSLog(@"%@",operation.responseObject);
            //NSLog(@"%@",error);
            
            if ([delegatess respondsToSelector:@selector(getRepositoriesFailWithResponse:)])
                [delegatess getRepositoriesFailWithResponse:error.localizedDescription];
        }];
    }
    else
    {
        if ([delegatess respondsToSelector:@selector(requestEndDueToInternetError)])
            [delegatess requestEndDueToInternetError];
        
    }
}


-(void)getRepositorDetailsWithRepoFullName:(NSString*)full_name
{
    reachability = [Reachability reachabilityForInternetConnection];
    internetStatus = [reachability currentReachabilityStatus];
    
    id <DIDynamicDataDelegate> delegatess =_delegate;
    if (internetStatus == ReachableViaWiFi || internetStatus == ReachableViaWWAN)
    {
        AFHTTPRequestOperationManager * ses = [AFHTTPRequestOperationManager manager];
        
        [delegatess requestStart];
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        ses.responseSerializer=responseSerializer;
        ses.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
        [ses.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        
        NSString* url = [NSString stringWithFormat:@"%@%@%@",WEBSERVICE_BASE_URL,REPOSITORY_DETAILS_URL,full_name];
        
        NSString* urlwithPercentEscapes = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        
        NSLog(@"serviceurl+++ %@", urlwithPercentEscapes);
        
        [ses GET:urlwithPercentEscapes parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSLog(@"%@",responseObject);
            NSLog(@"%@",operation.response);
            
            
            if (responseObject != nil){
                NSDictionary* resultDic = responseObject;
                
                if ([resultDic[@"message"] isEqualToString:@"Not Found"]) {
                    if ([delegatess respondsToSelector:@selector(getRepositoriesFailWithResponse:)])
                        [delegatess getRepositoriesFailWithResponse:@"Repository not found!"];
                    
                }else {
                    NSDictionary* repoDic = resultDic;
                    
                    RepositoryModel* repoModel = [RepositoryModel getRepositoryModelFromDic:repoDic];
                    
                    [delegatess getRepositoryDetailsSucces:repoModel];
                    
                }
                
                
                
            }else
                
            {
                
                if ([delegatess respondsToSelector:@selector(getRepositoriesFailWithResponse:)])
                    [delegatess getRepositoriesFailWithResponse:responseObject];
                
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //NSLog(@"%@",operation.responseObject);
            //NSLog(@"%@",error);
            
            if ([delegatess respondsToSelector:@selector(getRepositoriesFailWithResponse:)])
                [delegatess getRepositoriesFailWithResponse:error.localizedDescription];
        }];
    }
    else
    {
        if ([delegatess respondsToSelector:@selector(requestEndDueToInternetError)])
            [delegatess requestEndDueToInternetError];
        
    }
}
@end


