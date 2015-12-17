//
//  NBKlarnaWebView.h
//  NBKlarnaWebView
//
//  Created by Niklas Berglund on 12/11/15.
//

#import <UIKit/UIKit.h>
#import "NBKlarnaWebViewDelegate.h"

@interface NBKlarnaWebView : UIWebView<UIWebViewDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, weak) NSObject<NBKlarnaWebViewDelegate> *klarnaDelegate;

@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) CGFloat previousContentHeight;

@end
