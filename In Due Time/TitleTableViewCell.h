//
//  TitleTableViewCell.h
//  In Due Time
//
//  Created by Belén Molina del Campo on 12/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *checkboxButton;

@end
