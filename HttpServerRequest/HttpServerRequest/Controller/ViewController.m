//
//  ViewController.m
//  HttpServerRequest
//
//  Created by Mehedi Hasan on 1/2/20.
//  Copyright © 2020 Mehedi Hasan. All rights reserved.
//

#import "ViewController.h"
#import "SingleItemViewCell.h"
#import "WebServices.h"


@interface ViewController ()



@end

@implementation ViewController
@synthesize myitem ;


  NSString * mainstr;
  NSMutableArray * address;
  NSMutableArray * location;
  NSMutableArray * imagearr;

  NSDictionary * allResponse;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myitem = [[NSMutableArray alloc]initWithObjects:@"Mehedi Hasan",@"Fatima Tuj-Jhoura",@"Rabby",@"Rasel Mhamud", nil];
    [self requestdata];
}


//*********************** Get  Request From Server *******************************************
-(void)requestdata
{
    mainstr = [NSString stringWithFormat:@"https://ubarcarparkingbd.000webhostapp.com/api/get"];
    
    [WebServices executequery:mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error) {
        NSLog(@"Data: %@", dbdata);
        if (dbdata!=nil)
        {
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"Response Data: %@", maindic);
            
            address = [[NSMutableArray alloc]init];
            location = [[NSMutableArray alloc]init];
            imagearr = [[NSMutableArray alloc]init];
            
            allResponse = [maindic objectForKey:@"result"];
            
            for(NSDictionary * containDic in allResponse){
                NSString * loc = [containDic objectForKey:@"home_owner_location"];
                [location addObject:loc];
                //NSLog(@"loc: %@", loc);
                NSString * addr = [containDic objectForKey:@"home_owner_address"];
                [address addObject:addr];
               // NSLog(@"addr: %@", addr);
                
                NSString * img = [containDic objectForKey:@"home_owner_parking_image"];
                [imagearr addObject:img];
                NSLog(@"image: %@", img);
                
                
            }
            [self.myTableView reloadData];
            
        }
    }];
}

////******************* * Table View DataSource And Dalegate ************************

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"cell";
    
    SingleItemViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[SingleItemViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
      ///*************** initilize image from server ******************
    
    NSArray * baseUrl = [NSArray arrayWithObjects:@"https://ubarcarparkingbd.000webhostapp.com/", imagearr[indexPath.row] , nil];
    NSArray * finalImagePath = [baseUrl componentsJoinedByString:@""];
    NSLog(@"image path: %@", finalImagePath);

        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: finalImagePath]];
    
    

    cell.parkingImage.image = [UIImage imageWithData: imageData];
    cell.parkingLocation.text = location[indexPath.row];
    cell.parkingAddress.text = address[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return location.count;
}
///////************* *****  Specific cell click happen ******************************
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",(long)indexPath.row);
   // printf("%s", indexPath.row);
}






@end
