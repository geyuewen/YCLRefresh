//
//  YCLRefreshFooter.m
//  customer
//
//  Created by 木木木 on 2017/9/12.
//  Copyright © 2017年 Ningbo Otoc Automobile Service Co.,ltd. All rights reserved.
//

#define KYCLScreenWidth    CGRectGetMaxX([[UIScreen mainScreen] bounds])
#define YCLkht(aCGFlot) ((CGFloat)(aCGFlot) * (KYCLScreenWidth / 375.0))
//颜色值
#define YCLFUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



#import "YCLRefreshFooter.h"

@interface YCLRefreshFooter ()

@property (strong, nonatomic) UIView *line0;
@property (strong, nonatomic) UIView *line1;

@end


@implementation YCLRefreshFooter

- (void)prepare{
    [super prepare];
    
    self.automaticallyHidden = YES;
    self.refreshingTitleHidden = YES;
//    self.stateLabel.backgroundColor = kYCLBGColor;
    self.stateLabel.font = [UIFont systemFontOfSize:YCLkht(14)];
    self.stateLabel.textColor = [YCLRefreshFooter colorWithHex:0xCCCCCC];
    [self setTitle:@"  我是有底线的  " forState:MJRefreshStateNoMoreData];
    [self setTitle:@"" forState:MJRefreshStateIdle];

}

- (void)placeSubviews{
    [super placeSubviews];
    self.automaticallyChangeAlpha = YES;

    CGFloat width = ceilf([self.stateLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)
                                                             options:NSStringDrawingUsesLineFragmentOrigin
                                                          attributes:@{NSFontAttributeName : self.stateLabel.font}
                                                             context:nil].size.width);
                     
    self.line0.frame = CGRectMake(YCLkht(15), self.bounds.size.height/2.0, (self.bounds.size.width - width)/2.0 - YCLkht(15), 0.5);
    
    self.line1.frame = CGRectMake((self.bounds.size.width + width)/2.0, self.bounds.size.height/2.0, (self.bounds.size.width - width)/2.0 - YCLkht(15), 0.5);
}

- (void)setState:(MJRefreshState)state
{
    [super setState:state];
    
    self.line0.hidden = self.line1.hidden = state != MJRefreshStateNoMoreData;
}

- (UIView *)line0{
    if (!_line0) {
        _line0 = [[UIView alloc]initWithFrame:CGRectZero];
        _line0.backgroundColor = [YCLRefreshFooter colorWithHex:0xE6E6E6];
        _line0.hidden = YES;
        [self insertSubview:_line0 belowSubview:self.stateLabel];
    }
    return _line0;
}

- (UIView *)line1{
    if (!_line1) {
        _line1 = [[UIView alloc]initWithFrame:CGRectZero];
        _line1.backgroundColor = [YCLRefreshFooter colorWithHex:0xE6E6E6];
        _line1.hidden = YES;
        [self insertSubview:_line1 belowSubview:self.stateLabel];
    }
    return _line1;
}

+ (UIColor *)colorWithHex:(NSInteger)hex{
        return [UIColor colorWithRed:((hex & 0xFF0000) >> 8*2)/255.0
                               green:((hex & 0x00FF00) >> 8*1)/255.0
                                blue:((hex & 0x0000FF) >> 8*0)/255.0
                               alpha:1];
}

@end
