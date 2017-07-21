//
//  OBFlightViewCell.m
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 04/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import "OBFlightViewCell.h"

@interface OBFlightViewCell() {

}

@end

@implementation OBFlightViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    [_labelAirline setText:@""];
    [_labelDepartureInfo setText:@""];
    [_labelArrivalInfo setText:@""];
    [_labelPrice setText:@""];
}

- (void)dealloc {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
