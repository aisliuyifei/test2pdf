//
//  SCViewController.h
//  test2pdf
//
//  Created by wupeng on 12-12-10.
//  Copyright (c) 2012年 Galiumsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreText/CoreText.h>
@interface SCViewController : UIViewController<MFMailComposeViewControllerDelegate>

-(IBAction)buttonClicked:(id)sender;
-(IBAction)button2Clicked:(id)sender;

@end
