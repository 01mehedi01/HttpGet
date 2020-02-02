//
//  SingleItemViewCell.h
//  HttpServerRequest
//
//  Created by Mehedi Hasan on 1/2/20.
//  Copyright © 2020 Mehedi Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingleItemViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *parkingImage;

@property (weak, nonatomic) IBOutlet UILabel *parkingLocation;

@property (weak, nonatomic) IBOutlet UILabel *parkingAddress;




@end

NS_ASSUME_NONNULL_END
