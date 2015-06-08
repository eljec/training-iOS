//
//  SearchResultViewController.h
//  MyMercadolibre
//
//  Created by Julio Castillo on 6/5/15.
//  Copyright (c) 2015 Julio Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *resultTable;

- (id)initWithArrayItems:(NSMutableArray *)arrayItems;

@end
