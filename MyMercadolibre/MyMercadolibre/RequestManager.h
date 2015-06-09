//
//  RequestManager.h
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JCCountry.h"
#import "JCItemEntity.h"

@interface RequestManager : NSObject


- (void)getSites:(void (^) (NSMutableArray *))callBackBlock;
- (void)searchWith:(NSString *)text callBackBlock:(void (^)(NSMutableArray *))callBackBlock;
- (void)getItemById:(NSString *)id callBackBlock:(void (^) (JCItemEntity *))callBackBlock;
@end
