//
//  NBKlarnaWebView.m
//  NBKlarnaWebView
//
//  Created by Niklas Berglund on 12/11/15.
//

#import "NBKlarnaWebView.h"

@implementation NBKlarnaWebView
{
    
}

- (void)didMoveToSuperview
{
    self.contentHeight = 0.0;
    self.previousContentHeight = 0.0;
}

- (void)checkKlarnaWebViewHeight
{
    NSInteger height = self.scrollView.contentSize.height;
    
    if (height != self.contentHeight) {
        self.previousContentHeight = self.contentHeight;
        self.contentHeight = height;
        if (self.klarnaDelegate) {
            if ([self.klarnaDelegate respondsToSelector:@selector(klarnaWebView:didChangeContentHeightTo:)]) {
                [self.klarnaDelegate klarnaWebView:self didChangeContentHeightTo:self.contentHeight];
            }
        }
    }
}

@end
