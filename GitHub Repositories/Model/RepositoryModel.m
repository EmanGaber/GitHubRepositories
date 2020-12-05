//
//  RepositoryModel.m
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/4/20.
//  Copyright © 2017 Eman Gaber. All rights reserved.
//

#import "RepositoryModel.h"
#import "General.h"

@implementation RepositoryModel

+(RepositoryModel*)getRepositoryModelFromDic:(NSDictionary*)Dic
{
    RepositoryModel* model =[RepositoryModel new];
    
    [model setRepository_id:[General CheckNull:Dic [@"id"]]];
    [model setRepository_name:[General CheckNull:Dic [@"name"]]];
    [model setRepository_full_name:[General CheckNull:Dic [@"full_name"]]];
    [model setRepository_owner:[OwnerModel getOwnerModelFromDic:Dic [@"owner"]]];
    [model setRepository_created_at:[General CheckNull:Dic [@"created_at"]]];
    [model setRepository_description:[General CheckNull:Dic [@"description"]]];

    return model;
}
@end
