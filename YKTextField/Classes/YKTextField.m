//
//  YKTextField.m
//  YKTextField
//
//  Created by zouyuk on 2022/9/18.
//

#import "YKTextField.h"

@implementation YKTextField

- (instancetype)initWithFrame:(CGRect)frame
                    textColor:(UIColor *)textColor
                     textFont:(UIFont *)textFont
                  placeholder:(NSString *)placeholder
             placeholderColor:(UIColor *)placeholderColor
              placeholderFont:(UIFont *)placeholderFont
                maxTextLength:(NSInteger)maxTextLength
{
    if(self = [super initWithFrame:frame]){
        self.textColor = textColor;
        self.font = textFont;
        self.placeholder = placeholder;
        self.placeholderColor = placeholderColor;
        self.placeholderFont = placeholderFont;
        self.maxTextLength = maxTextLength;
    }
    return self;
}

-(void)setMaxTextLength:(NSInteger)maxTextLength{
    _maxTextLength = maxTextLength;
    [self addTarget:self action:@selector(my_textFieldTextDidChange) forControlEvents:UIControlEventEditingChanged];
}

-(void)setPlaceholder:(NSString *)placeholder{
    if (placeholder.length) {
        UIColor *tmpTextColor = UIColor.lightGrayColor;
        UIFont *tmpTextFont = self.font;
        if (self.placeholderColor) {
            tmpTextColor = self.placeholderColor;
        }
        if (self.placeholderFont) {
            tmpTextFont = self.placeholderFont;
        }
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:placeholder attributes:
                                          @{NSForegroundColorAttributeName:tmpTextColor,
                                            NSFontAttributeName:tmpTextFont
                                            }];
        self.attributedPlaceholder = attrString;
    }else{
        self.attributedPlaceholder = nil;
    }
    
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor = placeholderColor;
    [self setPlaceholder:self.placeholder];
}

-(void)setPlaceholderFont:(UIFont *)placeholderFont{
    _placeholderFont = placeholderFont;
    [self setPlaceholder:self.placeholder];
}

- (void)my_textFieldTextDidChange {
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.maxTextLength > 0 && toBeString.length > self.maxTextLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.maxTextLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.maxTextLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.maxTextLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.maxTextLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}


@end
