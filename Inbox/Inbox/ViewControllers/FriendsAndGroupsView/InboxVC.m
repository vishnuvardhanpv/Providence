//
//  InboxVC.m
//  Inbox
//
//  Created by Subin Kurian on 12/5/15.
//  Copyright © 2015 Subin Kurian. All rights reserved.
//

#import "InboxVC.h"
#import "FriendsAPIManager.h"
#import "GroupsAPIManager.h"
#import "MTLJSONAdapter.h"
#import "AppDelegate.h"
#import "FriendsCollectionViewCell.h"
#import "GroupsCollectionViewCell.h"
#import "FriendViewController.h"
#import "GroupViewController.h"
#import "Constants.h"

NSString *const GroupCellIdentifier = @"GroupCell";
NSString *const FriendCellIdentifier = @"FriendCell";
NSUInteger const GroupCollectionViewTag = 11;
NSUInteger const FriendCollectionViewTag = 22;

@interface InboxVC () <GroupsCellProtocol, FriendsCellProtocol>

@property (weak, nonatomic) IBOutlet UICollectionView *groupCV;
@property (weak, nonatomic) IBOutlet UICollectionView *friendsCV;

@end

@implementation InboxVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if([AppDelegate application].dataManager.friendsArray.count == 0) {
        [self callAPIToGetFriends];
    }
    if([AppDelegate application].dataManager.groupsArray.count == 0) {
        [self callAPIToGetGroups];
    }
    
//    [self setupInbox];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)callAPIToGetFriends {
    [FriendsAPIManager getTheListOfFriendsForTheUserID:@"2" withSuccessBlock:^(id object) {
        NSLog(@"%@", object);
        [AppDelegate application].dataManager.friendsArray = [MTLJSONAdapter modelsOfClass:[Friend class] fromJSONArray:[object valueForKey:@"data"] error:nil];
        [self.friendsCV reloadData];
    } andFail:^(NSError *errorMessage) {
        NSLog(@"%@", errorMessage);
    }];
}

- (void)callAPIToGetGroups {
    [GroupsAPIManager getTheListOfGroupsForTheUserID:@"1" withSuccessBlock:^(id object) {
        NSLog(@"%@", object);
        [AppDelegate application].dataManager.groupsArray = [MTLJSONAdapter modelsOfClass:[Group class] fromJSONArray:[object valueForKey:@"data"] error:nil];
        [self.groupCV reloadData];
    } andFail:^(NSError *errorMessage) {
        NSLog(@"%@", errorMessage);
    }];
}

/*

-(void)setupInbox
{
    _GroupNameArray=[[NSMutableArray alloc]initWithObjects:@" ‍",@" ‍",@"by John",@"by Stephene",@" ‍",@" ‍",@" ‍",@"by Rocco",@"by Kadyn",@" ‍", nil];
    
    _GroupImageArray=[[NSMutableArray alloc]init];
    
    for(int i=0;i<9;i++)
    {
        [_GroupImageArray addObject:   [UIImage imageNamed:[NSString stringWithFormat:@"GP%d.png",i]]];
    }
    _FriendImageArray1=[[NSMutableArray alloc]init];
    _FriendImageArray2=[[NSMutableArray alloc]init];
    
    for(int i=0;i<17;i++)
    {
        [_FriendImageArray1 addObject:   [UIImage imageNamed:[NSString stringWithFormat:@"FR1%d.png",i]]];
        [_FriendImageArray2 addObject:   [UIImage imageNamed:[NSString stringWithFormat:@"FR2%d.png",i]]];
        
    }
    _FriendNameArray1=[[NSMutableArray alloc]initWithObjects:@"Katrina",@"Parker",@"Aspen",@"Immanuel",@"Shaniya",@"Ahmad",@"Rocco",@"Jamya",@"Chace",@"Davin",@"Kasen",@"Elise",@"Alessandra",@"Jessie",@"Nia",@"Aaron",@"Chelsea",@"Kadyn", nil];
    
    _FriendNameArray2=[[NSMutableArray alloc]initWithObjects:@"Angelica",@"Ava",@"Jaylen",@"Quentin",@"Hazel",@"Davon",@"Princess",@"Brice",@"Madeline",@"Jolie",@"Anton",@"Gideon",@"Alissa",@"Jamarion",@"Madden",@"Reagan",@"Mattie",@"Jordyn", nil];
}
 
 */

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    if(view.tag == GroupCollectionViewTag)
        return [[AppDelegate application].dataManager.groupsArray count];
    if(view.tag == FriendCollectionViewTag)
        return [[AppDelegate application].dataManager.friendsArray count];
    return 0;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(collectionView.tag == GroupCollectionViewTag) {
        GroupsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:GroupCellIdentifier forIndexPath:indexPath];
        cell.delegate = self;
        [cell populateCell:[[AppDelegate application].dataManager.groupsArray objectAtIndex:indexPath.row]];
        return cell;
    } else if(collectionView.tag == FriendCollectionViewTag) {
        FriendsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FriendCellIdentifier forIndexPath:indexPath];
        cell.delegate = self;
        [cell populateCell:[[AppDelegate application].dataManager.friendsArray objectAtIndex:indexPath.row]];
        return cell;
    }
    return nil;
}

#pragma mark - CollectionView Cell delegates
    
- (void)didTapProfileImageOfFriend:(Friend *)friendObj {
    NSLog(@"-----tappedFriendImage----- %@", friendObj);
    FriendViewController *friendView = [[FriendViewController alloc] init];
    friendView = [self.storyboard instantiateViewControllerWithIdentifier:FriendView];
    friendView.friendObj = friendObj;
    [self.navigationController pushViewController:friendView animated:YES];
}

- (void)didTapImageOfGroup:(Group *)groupObj {
    NSLog(@"******tappedGroupImage******* %@", groupObj);
    GroupViewController *groupView = [[GroupViewController alloc] init];
    groupView = [self.storyboard instantiateViewControllerWithIdentifier:GroupView];
    groupView.groupObj = groupObj;
    [self.navigationController pushViewController:groupView animated:YES];
}

@end
