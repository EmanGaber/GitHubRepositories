
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
    
}

#pragma mark - GetRepositoriesList
-(void)searchRepositoriesWithQuary:(NSString*)quaryText andPageNum:(NSString*)pageNum andPageSize:(NSString*)pageSize
{
    id <DIDynamicDataDelegate> delegatess =_delegate;
    AFHTTPRequestOperationManager * ses = [AFHTTPRequestOperationManager manager];
    
    [delegatess RequestStart];
    
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
            
            if ([resultDic[@"message"] isEqualToString:@"Only the first 1000 search results are available"] || [resultDic[@"message"] isEqualToString:@ "https://api.github.com/search/repositories?q=Hellow&page=18&per_page=10"]) {
                if ([delegatess respondsToSelector:@selector(GetRepositoriesFailWithResponse:)])
                    [delegatess GetRepositoriesFailWithResponse:responseObject];
                
            }else {
                NSArray* itemsArray = resultDic[@"items"];
                NSMutableArray* finalRepoArray =[NSMutableArray new];
                
                for (NSDictionary * dic in itemsArray) {
                    
                    [finalRepoArray addObject:[RepositoryModel getRepositoryModelFromDic:dic]];
                    
                }
                
                NSString* totalCount = [NSString stringWithFormat:@"%@",resultDic[@"total_count"]];
                

                [delegatess GetRepositoriesSucces:finalRepoArray andTotalCount: totalCount];
            }
            
        }else
            
        {
            
            if ([delegatess respondsToSelector:@selector(GetRepositoriesFailWithResponse:)])
                [delegatess GetRepositoriesFailWithResponse:responseObject];
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //NSLog(@"%@",operation.responseObject);
        //NSLog(@"%@",error);
        
        if ([delegatess respondsToSelector:@selector(GetRepositoriesFailWithResponse:)])
            [delegatess GetRepositoriesFailWithResponse:error.localizedDescription];
    }];
}


@end


