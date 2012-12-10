//
//  SCViewController.m
//  test2pdf
//
//  Created by wupeng on 12-12-10.
//  Copyright (c) 2012年 Galiumsoft. All rights reserved.
//

#import "SCViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface SCViewController ()

@end

@implementation SCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonClicked:(id)sender{
    NSMutableData *pdfData = [NSMutableData data];
    
    // Points the pdf converter to the mutable data object and to the UIView to be converted
    UIGraphicsBeginPDFContextToData(pdfData, self.view.bounds, nil);
    UIGraphicsBeginPDFPage();
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
    
    
    // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
    
    [self.view.layer renderInContext:pdfContext];
    
    // remove PDF rendering context
    UIGraphicsEndPDFContext();
    
    // Retrieves the document directories from the iOS device
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:@"test.pdf"];
    
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
    NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
    

    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@"test pdf"];
    [controller setToRecipients:[NSArray arrayWithObject:@"wupeng@galiumsoft.com"]];
    NSArray *bccRecipients = [NSArray arrayWithObject:@"stormchaser@foxmail.com"];
    [controller setBccRecipients:bccRecipients];
    
    
    [controller addAttachmentData:pdfData mimeType:@"application/pdf" fileName:@"test.pdf"];
    
    
    [controller setMessageBody:@"test pdf convert and send：" isHTML:YES];
    [self presentViewController:controller animated:YES completion:nil];
}

-(IBAction)button2Clicked:(id)sender{
    NSMutableData *pdfData = [NSMutableData data];
    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, CFSTR("testpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasdf\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasd\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasd\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasdftestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasdf\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasd\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasd\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasdftestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasdf\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasd\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasd\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasdftestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasdf\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasd\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasd\ntestpasdasdasdsadasdfdsafldsafsdakfjdsklafjsdafjlsdjfklsdfjkassadjflsadkjfklsdjfsdlkafjksdlajfklsdjfklsdajfklsdajfkldsajflkasdjfklsadjfklsadjfkljasdlfjlskajflksdjfklajflkjalskfjlksajflksdjflksajdfkljsalkfjklasjflasjdflkajsldfja;sldjflskadjflksadjflkdsjfklsadgsahkldsajfklsdajfldsjaflkjsadlfjsal;fjs;aldfjsladjflsadjf;lsadjflkasdf"), NULL);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
    UIGraphicsBeginPDFContextToData(pdfData, CGRectZero, nil);
    CFRange currentRange = CFRangeMake(0, 0);
    NSInteger currentPage = 0;
    BOOL done = NO;
    do {
        // Mark the beginning of a new page.
        UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
        // Draw a page number at the bottom of each page.
        currentPage++;
        [self drawPageNumber:currentPage];
        // Render the current page and update the current range to
        // point to the beginning of the next page.
        currentRange = [self renderPage:currentPage withTextRange:currentRange andFramesetter:framesetter];
        // If we're at the end of the text, exit the loop.
        if (currentRange.location == CFAttributedStringGetLength((CFAttributedStringRef)currentText))
            done = YES;
    } while (!done);
    UIGraphicsEndPDFContext();
    // Release the framewetter.
    CFRelease(framesetter);
    CFRelease(currentText);
    
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:@"test2.pdf"];
    
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
    NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
    MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@"test pdf"];
    [controller setToRecipients:[NSArray arrayWithObject:@"wupeng@galiumsoft.com"]];
    NSArray *bccRecipients = [NSArray arrayWithObject:@"stormchaser@foxmail.com"];
    [controller setBccRecipients:bccRecipients];
    
    
    [controller addAttachmentData:pdfData mimeType:@"application/pdf" fileName:@"test.pdf"];
    
    
    [controller setMessageBody:@"test pdf convert and send：" isHTML:YES];
    [self presentViewController:controller animated:YES completion:nil];

    
}
- (CFRange)renderPage:(NSInteger)pageNum withTextRange:(CFRange)currentRange
       andFramesetter:(CTFramesetterRef)framesetter
{
    // Get the graphics context.
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    // Create a path object to enclose the text. Use 72 point
    // margins all around the text.
    CGRect    frameRect = CGRectMake(72, 72, 468, 648);
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    // Get the frame that will do the rendering.
    // The currentRange variable specifies only the starting point. The framesetter
    // lays out as much text as will fit into the frame.
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
    CGPathRelease(framePath);
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, 792);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    // Draw the frame.
    CTFrameDraw(frameRef, currentContext);
    // Update the current range based on what was drawn.
    currentRange = CTFrameGetVisibleStringRange(frameRef);
    currentRange.location += currentRange.length;
    currentRange.length = 0;
    CFRelease(frameRef);
    return currentRange;
}
- (void)drawPageNumber:(NSInteger)pageNum
{
    NSString *pageString = [NSString stringWithFormat:@"Page %d", pageNum];
    UIFont *theFont = [UIFont systemFontOfSize:12];
    CGSize maxSize = CGSizeMake(612, 72);
    CGSize pageStringSize = [pageString sizeWithFont:theFont
                                   constrainedToSize:maxSize
                                       lineBreakMode:UILineBreakModeClip];
    CGRect stringRect = CGRectMake(((612.0 - pageStringSize.width) / 2.0),
                                   720.0 + ((72.0 - pageStringSize.height) / 2.0),
                                   pageStringSize.width,
                                   pageStringSize.height);
    [pageString drawInRect:stringRect withFont:theFont];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
    if (result == MFMailComposeResultSent) {
        [self showAlert:@"邮件已进入后台发送" withTitle:@"提醒"];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)showAlert:(NSString *)message withTitle:(NSString*)title{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}

@end
