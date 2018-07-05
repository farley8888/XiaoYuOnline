//
//  XYLoanViewCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYLoanViewCell;
@protocol XYLoanViewCellDelegate<NSObject>
- (BOOL)loanViewCell:(XYLoanViewCell *)cell textFieldShouldBeginEditing:(UITextField *)textField;
- (void)loanViewCell:(XYLoanViewCell *)cell textFieldEditingChanged:(UITextField *)textField;
- (void)loanViewCell:(XYLoanViewCell *)cell textViewDidEndEditing:(UITextView *)textView;
@end

@interface XYLoanViewCell : UITableViewCell<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *necessaryImageView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, weak) id<XYLoanViewCellDelegate> delegate;

@end
