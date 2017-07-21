//
//  OBFlightViewCell.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 04/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OBFlightViewCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel *labelAirline;
@property (nonatomic,weak) IBOutlet UILabel *labelDepartureInfo;
@property (nonatomic,weak) IBOutlet UILabel *labelArrivalInfo;
@property (nonatomic,weak) IBOutlet UILabel *labelPrice;
@end
