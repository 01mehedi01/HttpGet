//
//  ViewController.h
//  HttpServerRequest
//
//  Created by Mehedi Hasan on 1/2/20.
//  Copyright © 2020 Mehedi Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@property(strong , nonatomic) NSMutableArray *myitem ;


@end

