//
//  YKTextField.h
//  YKTextField
//
//  Created by zouyuk on 2022/9/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YKTextField : UITextField

/// 占位符颜色
@property (nonatomic, strong) UIColor *placeholderColor;
/// 占位符字体
@property (nonatomic, strong) UIFont *placeholderFont;
/// 最多输入字数
@property (nonatomic, assign) NSInteger maxTextLength;

/// 初始化
/// @param frame 位置
/// @param placeholder 占位符
/// @param placeholderColor 占位符颜色
/// @param placeholderFont 占位符字体
/// @param maxTextLength 最多输入字数
- (instancetype)initWithFrame:(CGRect)frame
                    textColor:(UIColor *)textColor
                     textFont:(UIFont *)textFont
                  placeholder:(NSString *)placeholder
             placeholderColor:(UIColor *)placeholderColor
              placeholderFont:(UIFont *)placeholderFont
                maxTextLength:(NSInteger)maxTextLength;

@end

NS_ASSUME_NONNULL_END
