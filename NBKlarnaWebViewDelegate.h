//
//  NBKlarnaWebViewDelegate.h
//  NBKlarnaWebView
//
//  Created by Niklas Berglund on 12/11/15.
//

#import <Foundation/Foundation.h>

@class NBKlarnaWebView;

@protocol NBKlarnaWebViewDelegate <NSObject>

- (void)klarnaWebView:(NBKlarnaWebView *)klarnaWebView didChangeContentHeightTo:(CGFloat)contentHeight;

@end
