//
//  OBHotelImageViewCell.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 06/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OBHotelImageViewCell : UICollectionViewCell
@property (nonatomic,weak) IBOutlet UIImageView *imgViewHotel;
@property (nonatomic,weak) IBOutlet UIActivityIndicatorView *indicatorLoading;
@end
