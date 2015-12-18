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

- (void)initialize
{
    self.contentHeight = 0.0;
    self.previousContentHeight = 0.0;
    self.delegate = self;
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedWebView:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.delegate = self;
    [self addGestureRecognizer:tapGestureRecognizer];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tappedWebView:)];
    panGestureRecognizer.delegate = self;
    [self addGestureRecognizer:panGestureRecognizer];
}

- (void)didMoveToSuperview
{
    [self initialize];
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

- (void)touchedWebView:(UIGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        [self performSelector:@selector(checkKlarnaWebViewHeight) withObject:nil afterDelay:0.2];
        [self performSelector:@selector(checkKlarnaWebViewHeight) withObject:nil afterDelay:0.6];
        [self performSelector:@selector(checkKlarnaWebViewHeight) withObject:nil afterDelay:1];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // Klarna Checkout is dynamically changing it's height _after_ a successful load. So we have to check for height change after some intervals to catch this height change.
    [self performSelector:@selector(checkKlarnaWebViewHeight) withObject:nil afterDelay:0.2];
    [self performSelector:@selector(checkKlarnaWebViewHeight) withObject:nil afterDelay:0.6];
    [self performSelector:@selector(checkKlarnaWebViewHeight) withObject:nil afterDelay:1];
    [self performSelector:@selector(checkKlarnaWebViewHeight) withObject:nil afterDelay:2];
}

// required for taps to be recognized for UIWebView
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer*)otherGestureRecognizer {
    return YES;
}

@end
