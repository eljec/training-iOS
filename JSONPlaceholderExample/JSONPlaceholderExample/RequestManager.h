//
//  RequestManager.h
//  JSONPlaceholderExample
//
//  Created by Julio Castillo on 5/29/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject

- (NSMutableArray *)getAllUsers;
- (NSMutableArray *)getPostBySelectedUser;
- (NSMutableArray *)getAlbumsBySelectedUser;
- (NSMutableArray *)getPhotosByAlbum:(NSInteger)albumId;

@end
