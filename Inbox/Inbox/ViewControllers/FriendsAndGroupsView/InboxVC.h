//
//  InboxVC.h
//  Inbox
//
//  Created by Subin Kurian on 12/5/15.
//  Copyright © 2015 Subin Kurian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InboxVC : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)NSMutableArray *GroupImageArray;
@property(nonatomic,strong)NSMutableArray *GroupNameArray;
@property(nonatomic,strong)NSMutableArray *FriendImageArray1;
@property(nonatomic,strong)NSMutableArray *FriendNameArray1;
@property(nonatomic,strong)NSMutableArray *FriendImageArray2;
@property(nonatomic,strong)NSMutableArray *FriendNameArray2;

@end
