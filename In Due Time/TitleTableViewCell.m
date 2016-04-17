//
//  TitleTableViewCell.m
//  In Due Time
//
//  Created by Belén Molina del Campo on 12/04/2016.
//  Copyright © 2016 Belén Molina del Campo. All rights reserved.
//

#import "TitleTableViewCell.h"

@implementation TitleTableViewCell

- (void)awakeFromNib {
    self.titleLabel.text = nil;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)prepareForReuse {
    self.titleLabel.text = nil;
    
    UIImage *initialCheckboxImage = [UIImage imageNamed:@"Unchecked Checkbox.png"];
    [self.checkboxButton setImage:initialCheckboxImage forState:UIControlStateNormal];
}
- (IBAction)changeCheckboxValue:(id)sender {
}
@end
