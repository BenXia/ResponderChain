//
//  CheckPleaseViewController.h
//  CheckPlease
//
//  Created by jeff on 4/28/09.
//  Copyright Jeff LaMarche 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMinimumCheckMarkAngle    50
#define kMaximumCheckMarkAngle    135
#define kMinimumCheckMarkLength   10

@interface CheckPleaseVC : BaseViewController {
    UILabel     *label;
    CGPoint     lastPreviousPoint;
    CGPoint     lastCurrentPoint;
    CGFloat     lineLengthSoFar;
}

@property (nonatomic, weak) IBOutlet UILabel *label;

- (void)eraseLabel;

@end

