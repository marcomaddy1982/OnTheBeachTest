//
//  OBHotelViewController.h
//  OnTheBeachTest
//
//  Created by MacBook Pro Retina on 06/02/17.
//  Copyright © 2017 OnTheBeach. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OBHotelViewController : UIViewController
@property (nonatomic,weak) IBOutlet UILabel *labelTitle;
@property (nonatomic,weak) IBOutlet UILabel *labelLocation;
@property (nonatomic,weak) IBOutlet UILabel *labelDescription;
@property (nonatomic,weak) IBOutlet UILabel *labelRating;
@property (nonatomic,weak) IBOutlet UILabel *labelFacilities;
@property (nonatomic,weak) IBOutlet UICollectionView *collectionImages;
@end
