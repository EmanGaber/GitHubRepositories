//
//  OwnerModel.h
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/4/20.
//  Copyright © 2017 Eman Gaber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OwnerModel : NSObject

@property (nonatomic, strong) NSString * owner_login;
@property (nonatomic, strong) NSString * owner_id;
@property (nonatomic, strong) NSString * owner_node_id;
@property (nonatomic, strong) NSString * owner_avatar_url;
@property (nonatomic, strong) NSString * owner_gravatar_id;
@property (nonatomic, strong) NSString * owner_url;
@property (nonatomic, strong) NSString * owner_html_url;
@property (nonatomic, strong) NSString * owner_followers_url;
@property (nonatomic, strong) NSString * owner_following_url;
@property (nonatomic, strong) NSString * owner_gists_url;
@property (nonatomic, strong) NSString * owner_starred_url;
@property (nonatomic, strong) NSString * owner_subscriptions_url;
@property (nonatomic, strong) NSString * owner_organizations_url;
@property (nonatomic, strong) NSString * owner_repos_url;
@property (nonatomic, strong) NSString * owner_events_url;
@property (nonatomic, strong) NSString * owner_received_events_url;
@property (nonatomic, strong) NSString * owner_type;
@property (nonatomic, strong) NSString * owner_site_admin;

+(OwnerModel*)getOwnerModelFromDic:(NSDictionary*)Dic;

@end
