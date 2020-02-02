//
//  SingleItemViewCell.m
//  HttpServerRequest
//
//  Created by Mehedi Hasan on 1/2/20.
//  Copyright © 2020 Mehedi Hasan. All rights reserved.
//

#import "SingleItemViewCell.h"

@implementation SingleItemViewCell
@synthesize parkingImage,parkingLocation,parkingAddress;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        
    }
    
    return  self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
