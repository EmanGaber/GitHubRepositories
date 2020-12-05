//
//  OwnerModel.m
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/4/20.
//  Copyright © 2017 Eman Gaber. All rights reserved.
//

#import "OwnerModel.h"
#import "General.h"

@implementation OwnerModel

+(OwnerModel*)getOwnerModelFromDic:(NSDictionary*)Dic;
{
    OwnerModel* model =[OwnerModel new];

    [model setOwner_login:[General CheckNull:Dic [@"login"]]];
    [model setOwner_id:[General CheckNull:Dic [@"id"]]];
    [model setOwner_node_id:[General CheckNull:Dic [@"node_id"]]];
    [model setOwner_avatar_url:[General CheckNull:Dic [@"avatar_url"]]];
    [model setOwner_gravatar_id:[General CheckNull:Dic [@"gravatar_id"]]];
    [model setOwner_url:[General CheckNull:Dic [@"url"]]];
    [model setOwner_html_url:[General CheckNull:Dic [@"html_url"]]];
    [model setOwner_followers_url:[General CheckNull:Dic [@"followers_url"]]];
    [model setOwner_following_url:[General CheckNull:Dic [@"following_url"]]];
    [model setOwner_gists_url:[General CheckNull:Dic [@"gists_url"]]];
    [model setOwner_starred_url:[General CheckNull:Dic [@"starred_url"]]];
    [model setOwner_subscriptions_url:[General CheckNull:Dic [@"subscriptions_url"]]];
    [model setOwner_organizations_url:[General CheckNull:Dic [@"organizations_url"]]];
    [model setOwner_repos_url:[General CheckNull:Dic [@"repos_url"]]];
    [model setOwner_events_url:[General CheckNull:Dic [@"events_url"]]];
    [model setOwner_received_events_url:[General CheckNull:Dic [@"received_events_url"]]];
    [model setOwner_type:[General CheckNull:Dic [@"type"]]];
    [model setOwner_site_admin:[General CheckNull:Dic [@"site_admin"]]];
    
    return model;
}

@end
