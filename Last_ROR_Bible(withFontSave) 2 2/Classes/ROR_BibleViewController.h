//
//  ROR_BibleViewController.h
//  ROR_Bible
//
//  Created by IMM (Emerging Technologies & Re-engineering) on 3/22/11.
//  Copyright 2011 BLW Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "LibraryViewController.h"
#import "BibleBooksViewController.h"
#import "ChaptersViewController.h"
#import "MyStuffViewController.h"
#import "SearchModifiedViewController.h"
#import "Autocomplete.h"
#import "SettingsViewController.h"
#import "ReferencesViewController.h"
#import "MenuWebView.h"
#import "SearchModifiedViewController.h"



// Jinlong: Add UIScrollViewDelegate
@interface ROR_BibleViewController : UIViewController <UIScrollViewDelegate, UINavigationControllerDelegate, UIPopoverControllerDelegate, UIWebViewDelegate, UIGestureRecognizerDelegate, MFMailComposeViewControllerDelegate>{
	IBOutlet UITableView *suggestionTable;
	
	Autocomplete *autocomplete;
	
	NSArray	*suggestions;
	
	UIPopoverController *popoverController;
	UIPopoverController *popoverController2;
	UIPopoverController *popoverController3;
	UIPopoverController *popoverController4;
	UIPopoverController *popoverController5;
	UIPopoverController *popoverController6;
	UIPopoverController *popoverController7;
    UIPopoverController *popoverController8;

	IBOutlet UITextField *bkMarkBooksField;
	IBOutlet UITextField *bkMarkChapField;
	IBOutlet UITextField *bkMarkVerseField;
	IBOutlet UITextField *titleField;
	IBOutlet UITextField *authorsField;
	IBOutlet UITextField *contactUsEmail;
	IBOutlet UITextView *textViewForNote;
	IBOutlet UIView *bookMarkView;
	IBOutlet UITextView *contactUsSubject;
	IBOutlet UIView *referenceView;
	IBOutlet UIView *notesView;
	IBOutlet UIView *notesIntroView;
	IBOutlet UIView *contactUsView;
	//IBOutlet MenuWebView *display2;
	IBOutlet UIScrollView *pageScrollView;
	//IBOutlet MenuWebView *display3;
	IBOutlet UIWebView *displayRef;
	IBOutlet UIButton *btn_library;
	IBOutlet UIButton *btn_browse;
	IBOutlet UIButton *btn_myStuff;
    IBOutlet UIButton *btn_search;
	IBOutlet UIButton *btn_notes;
	IBOutlet UIButton *btn_settings;
	IBOutlet UILabel *label;
	IBOutlet UILabel *refLabel;
	IBOutlet UILabel *notesLabel;
	IBOutlet UIActivityIndicatorView *activityIndicator;
	UIButton *btnPointer;
	UIButton *btnPointer2;
	NSString *bookName;
	NSString *referenceName;
	NSString *titleName;
	NSString *authorName;
	NSString *authorandSeperator;
	NSString *authorandTitle;
	NSString *filePath;
	NSString *filePathWithExtension;
	NSString *myString;
	NSString *forFonts;
	NSMutableArray *noteTitleandAuthors;
	NSMutableArray *bookmarkedScriptures;
	NSMutableArray *buttons;
	//NSString *checkRotation;
	UILongPressGestureRecognizer *longPressGestureRecognizer;
	UITapGestureRecognizer *tapGestureRecognizer;
	id detailItem;
	id chapter;
	id verse;
	id articles;
	id concordance;
	id personalWord;
	id takeTour;
	id KJV;
	id otherBooks;
	id contactUs;
	id oneYear;
	id twoYears;
	id getNote;
	id getBookmark;
	int checker;
	int another;
	int bkmkChecker;
	int fontChecker;
	int fontSizeChecker;
	id rotationSwitch;
	id checkRotation;
	id changeFont;
	id forRef;
	int sliderValue;
	int checkRefId;
	NSString *extVerse;
	NSString *bookRep;
	NSString *bookRep2;
	
	//UIWebView *webViewReference;
	CGSize sizeOfBible;
	IBOutlet UIButton *backButton;

	//Jinlong: Following variables are needed to swipe webview
	//UIGestureRecognizer *swipeUpRecognizer;
	//UIGestureRecognizer *swipeDownRecognizer;
	MenuWebView* prevPage;
	MenuWebView* curPage;
	MenuWebView* nextPage;
	int			 pageNum;
	int			 curTopY;
	int			 totalHeight;
	BOOL		 bAllRefesh;
	int			 nRefreshCounter;
}

//-(void)viewCreator;
@property CGSize sizeOfBible;
@property int sliderValue;
@property int checkRefId;
@property (nonatomic, retain) id articles;
@property (nonatomic, retain) id changeFont;
@property (nonatomic, retain) id detailItem;
@property (nonatomic, retain) id chapter;
@property (nonatomic, retain) NSString *extVerse;
@property (nonatomic, retain) NSString *bookRep;
@property (nonatomic, retain) NSString *bookRep2;
@property (nonatomic, retain) id verse;
@property (nonatomic, retain) id concordance;
@property (nonatomic, retain) id personalWord;
@property (nonatomic, retain) id takeTour;
@property (nonatomic, retain) id KJV;
@property (nonatomic, retain) id otherBooks;
@property (nonatomic, retain) id contactUs;
@property (nonatomic, retain) id oneYear;
@property (nonatomic, retain) id twoYears;
@property (nonatomic, retain) id getNote;
@property (nonatomic, retain) id getBookmark;
@property (nonatomic, retain) id rotationSwitch;
@property (nonatomic, retain) id forRef;
@property (nonatomic, retain) NSMutableArray *noteTitleandAuthors;
@property (nonatomic, retain) NSMutableArray *bookmarkedScriptures;
@property (nonatomic, retain) UIPopoverController *popoverController; 
@property (nonatomic, retain) UIPopoverController *popoverController2;
@property (nonatomic, retain) UIPopoverController *popoverController3;
@property (nonatomic, retain) UIPopoverController *popoverController4;
@property (nonatomic, retain) UIPopoverController *popoverController5;
@property (nonatomic, retain) UIPopoverController *popoverController6;
@property (nonatomic, retain) UIPopoverController *popoverController7;
@property (nonatomic, retain) UIPopoverController *popoverController8;

@property(nonatomic,retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) UIButton *btn_library;
@property (nonatomic, retain) UIButton *btn_browse;
@property (nonatomic, retain) UIButton *btn_myStuff;
@property (nonatomic, retain) UIButton *btn_search;
@property (nonatomic, retain) UIButton *btn_notes;
@property (nonatomic, retain) UIButton *btn_settings;
-(IBAction)displayNoteIntroView:(id)sender;
-(IBAction)btnShowSettings:(id)sender;
-(IBAction)btnShowNotes:(id)sender;
-(IBAction)btnShowBrowse:(id)sender;
-(IBAction)btnShowLibrary:(id)sender;
-(IBAction)btnShowMyStuff:(id)sender;
-(IBAction)btnSearch:(id)sender;
-(IBAction)btnShowReferences:(id)sender;
-(IBAction)goBack:(UIButton *)sender;
-(IBAction)saveNotes:(id)sender;
-(IBAction)doneWithNotes:(id)sender;
- (IBAction)textDidChange:(id)textField;
- (IBAction)textEditBegin:(id)textField;
//-(IBAction) loadWebViewWithFileInTMP:(id)sender;
-(IBAction)createNote:(id)sender;
-(IBAction)createBookmark:(id)sender;
-(IBAction)cancelBookmark:(id)sender;
-(IBAction)createTopBookmark:(id)sender;
-(IBAction)cancelNote:(id)sender;
-(IBAction)cancelContactUs:(id)sender;
-(IBAction)sendMail:(id)sender;
-(void)doTheWork:(id)object;
-(void)getVerseId;
-(void)displayNoteIntroView;
-(void)generate;
-(void)changeFont:(int) size;
- (NSDictionary *)parseQueryString:(NSString *)query ;
//- (void)createGestureRecognizers;
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)getFrameForRotation;
@property (retain, nonatomic) UITextField *bkMarkBooksField;
@property (nonatomic, retain) UITableView *suggestionTable;
//@property (retain, nonatomic) MenuWebView *display2;
@property (retain, nonatomic) UIScrollView *pageScrollView;
@property (retain, nonatomic) UIWebView *displayRef;
@property (retain, nonatomic) UILabel *label;
@property (retain, nonatomic) id checkRotation;
//-(void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer;

@property (nonatomic, retain) UIButton *backButton;

- (IBAction)onBackButton:(id)sender;

// JinLong: Page swiping
- (void)loadPageScrollView;
- (void)loadUrlRequest:(NSURLRequest*) req;
- (int) getWebContentHeight: (UIWebView*)webView;
- (int) getPageOffsetY: (UIWebView*) webView;
@property (retain, nonatomic) MenuWebView* prevPage;
@property (retain, nonatomic) MenuWebView* curPage;
@property (retain, nonatomic) MenuWebView* nextPage;
//@property (nonatomic, retain) UIGestureRecognizer *swipeUpRecognizer;
//@property (nonatomic, retain) UIGestureRecognizer *swipeDownRecognizer;
@end

