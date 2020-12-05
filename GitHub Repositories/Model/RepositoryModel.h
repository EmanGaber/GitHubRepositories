//
//  RepositoryModel.h
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/4/20.
//  Copyright © 2017 Eman Gaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OwnerModel.h"

@interface RepositoryModel : NSObject

@property (nonatomic, strong) NSString * repository_id;
@property (nonatomic, strong) NSString * repository_name;
@property (nonatomic, strong) NSString * repository_full_name;
@property (nonatomic, strong) NSString * repository_SCR_TYP;
@property (nonatomic, strong) OwnerModel * repository_owner;
@property (nonatomic, strong) NSString *  repository_created_at;
@property (nonatomic, strong) NSString *  repository_description;

+(RepositoryModel*)getRepositoryModelFromDic:(NSDictionary*)Dic;

@end


