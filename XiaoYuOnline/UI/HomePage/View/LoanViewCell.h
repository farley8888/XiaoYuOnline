//
//  LoanViewCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoanViewCell;
@protocol LoanViewCellDelegate<NSObject>
- (BOOL)loanViewCell:(LoanViewCell *)cell textFieldShouldBeginEditing:(UITextField *)textField;
- (void)loanViewCell:(LoanViewCell *)cell textFieldEditingChanged:(UITextField *)textField;
- (void)loanViewCell:(LoanViewCell *)cell textViewDidEndEditing:(UITextView *)textView;
@end

@interface LoanViewCell : UITableViewCell<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *necessaryImageView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, weak) id<LoanViewCellDelegate> delegate;

@end
