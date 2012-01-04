//
//  ROR_BibleViewController.m
//  ROR_Bible
//
//  Created by IMM (Emerging Technologies & Re-engineering) on 3/22/11.
//  Copyright 2011 BLW Inc. All rights reserved.
//

#import "ROR_BibleViewController.h"
#import "BibleBooksViewController.h"
#import "UserDataManager.h"

@implementation ROR_BibleViewController
@synthesize popoverController,popoverController2,popoverController3, popoverController4,popoverController5,popoverController6, popoverController7, popoverController8,btn_myStuff,btn_library,btn_browse,btn_search;

@synthesize detailItem, /*display2, */displayRef, chapter, verse, articles, label, concordance, personalWord, KJV, otherBooks, rotationSwitch,checkRotation, changeFont, sliderValue, forRef, extVerse, bookRep, bookRep2;
@synthesize activityIndicator, oneYear, twoYears,btn_notes,btn_settings, noteTitleandAuthors,getNote, bkMarkBooksField, suggestionTable, bookmarkedScriptures, getBookmark,contactUs, takeTour, checkRefId;
@synthesize backButton;
@synthesize sizeOfBible;
//jinlong
@synthesize pageScrollView;
@synthesize curPage, nextPage, prevPage/*, swipeUpRecognizer, swipeDownRecognizer*/;

-(void)NoteClicked:(id)sender
{
	NSLog(@"NoteClicked");
	[self displayNoteIntroView];
}
-(void)BookmarkClicked:(id)sender
{
	NSLog(@"BookmarkClicked");
	[self generate];
	
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender 
{
	BOOL can = [super canPerformAction:action withSender:sender];    
	if (action == @selector(NoteClicked:)
		|| action == @selector(BookmarkClicked:))
	{
		can = YES; 
	} 
	else {
		can = NO;
	}	
	
	return can;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[UserDataManager loadData];
	
	backButton.hidden = YES;
	[label setTextColor:[UIColor blackColor]];
	UIMenuItem *customMenuItem1 = [[[UIMenuItem alloc] initWithTitle:@"Copy" action:@selector(onCopy:)] autorelease];
    UIMenuItem *customMenuItem2 = [[[UIMenuItem alloc] initWithTitle:@"Highlight" action:@selector(HighlightClicked:)] autorelease];
	UIMenuItem *customMenuItem3 = [[[UIMenuItem alloc] initWithTitle:@"Note" action:@selector(NoteClicked:)] autorelease];
    UIMenuItem *customMenuItem4 = [[[UIMenuItem alloc] initWithTitle:@"Bookmark" action:@selector(BookmarkClicked:)] autorelease];
	
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:customMenuItem1, customMenuItem2, customMenuItem3, customMenuItem4, nil]];
	
	//JinLong: Show scrollview
	[self loadPageScrollView];
	
	/*display2.bibleViewController = self;
	
	[display2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
														[[NSBundle mainBundle] pathForResource:@"GenesisBookxmltrans" ofType:@"htm"]isDirectory:NO]]];
//	[display2 setContentStretch:CGRectMake(0, 0, 0, 0)]
	[label setText:@"Genesis 1:1"];
	*/
	
	NSString *fileName2 = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/lastArray.txt"];
//	NSString *bookmarkFile = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/bookmarks.txt"];
	 
	if(noteTitleandAuthors == nil){
		noteTitleandAuthors = [[NSMutableArray alloc] initWithContentsOfFile:fileName2];
		//[noteTitleandAuthors]
		
	}
	if(bookmarkedScriptures == nil){
		//bookmarkedScriptures = [[NSMutableArray alloc] initWithContentsOfFile:bookmarkFile];
		bookmarkedScriptures = [[NSMutableArray alloc] initWithArray:[UserDataManager getBookmarks]];
	}
	
	
	
	//tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
		//														   action:@selector(handleTap:)];
	//tapGestureRecognizer.delegate = self;
	//tapGestureRecognizer.numberOfTapsRequired = 2;
	//[self.display2 addGestureRecognizer:tapGestureRecognizer];
	//[tapGestureRecognizer release];
	
	
	
	//longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
																//action:@selector(handleLongPress:)];
	//longPressGestureRecognizer.delegate = self;
	//longPressGestureRecognizer.minimumPressDuration = 2.0;
	//[display2 addGestureRecognizer:longPressGestureRecognizer];
	//[referenceView addGestureRecognizer:longPressGestureRecognizer];
	//[textViewForNote addGestureRecognizer:longPressGestureRecognizer];
	
	//[longPressGestureRecognizer release];
	
	
	
	buttons = [[NSMutableArray alloc] init];
	
//	autocomplete = [[Autocomplete alloc] initWithArray:[[NSArray alloc] initWithObjects:@"Genesis", @"Exodus", @"Leviticus", @"Numbers", @"Deuteronomy", @"Joshua", @"Judges",
//														                                 @"Ruth", @"1 Samuel", @"2 Samuel", @"1 Kings", @"2 kings", @"1 Chronicles", @"2 Chronicles",
//														                                 @"Ezra", @"Nehemiah", @"Esther", @"Job", @"Psalm", @"Proverbs", @"Ecclesiastes", @"Song of Solomon", 
//														                                 @"Isaiah", @"Jerremiah", @"Lamentations", @"Ezekiel", @"Daniel", @"Hosea", @"Joel", @"Amos", @"Obadiah", 
//														                                 @"Jonah", @"Micah", @"Nahum", @"Habakkuk", @"Zephaniah", @"Haggai", @"Zechariah", @"Malachi", 
//														                                  @"Matthew", @"Mark", @"Luke", @"John", @"Acts", @"Romans", @"1 Corinthians", @"2 Corinthians", @"Galatians", @"Ephesians", 
//														                                  @"Philippians", @"Colossians", @"1 Thessalonians", @"2 Thessalonians", @"1 Timothy", @"2 Timothy", @"Titus", @"Philemon", 
//														                                  @"Hebrews", @"James", @"1 Peter", @"2 Peter", @"1 John", @"2 John", @"3 John", @"Jude", @"Revelation", nil]];
//	
    autocomplete=[[Autocomplete alloc] initWithArray:[[NSArray alloc] initWithObjects:@"Gen",@"Exo",@"Lev",@"Num",@"Deu",@"Jos",@"Jud",@"Rutth",@"1 Sam",@"2 Sam",@"1 Kings",@"2 Kings",@"1 Chr",@"2 Chr",@"Ezra",@"Neh",@"Esth",@"Job",@"Psalm",@"Pro",@"Ecc",@"Song",@"Isa",@"Jerr",@"Lam",@"Eze",@"Dan",@"Hos",@"Joe",@"Amos",@"Obadiah",@"Jon",@"Mic",@"Nah",@"Hab",@"Zep",@"Hag",@"Zec",@"Mal",@"Matt",@"Mark",@"Luke",@"John",@"Acts",@"Rom",@"1 Cor",@"2 Cor",@"Gal",@"Eph",@"Phil",@"Col",@"1 The",@"2 The",@"1 Tim",@"2 Tim",@"Titus",@"Phile",@"Heb",@"James",@"1 Peter",@"2 Peter",@"1 John",@"Jude",@"Rev" ,nil]];
    bkMarkBooksField.autocorrectionType = UITextAutocorrectionTypeNo;
	
	//[self getVerseId];
	//[self createGestureRecognizers];
	
	
}

- (void)viewDidDisappear:(BOOL)animated 
{
    [super viewDidDisappear:animated];
	
    [[UIMenuController sharedMenuController] setMenuItems:nil];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:
(UIGestureRecognizer *)otherGestureRecognizer {
	return YES;
}
- (void)generate
{
	[bookMarkView setHidden:NO];
	[suggestionTable setHidden: YES]; //added by ZheZhun
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if([[[request URL] scheme] isEqualToString:@"myapp"]) { 
		
		NSDictionary *arguments = [self parseQueryString:[[request URL] query]];
		
		NSString *selectorStr = [arguments valueForKey:@"selector"];
		SEL selector = NSSelectorFromString(selectorStr);
		
		NSString *verseID = [arguments valueForKey:@"verseID"];
		
		if([self respondsToSelector:selector]) {
			[self performSelector:selector withObject:verseID];
		} else {
			//alert user of invalid URL
		}
		return NO;
    }
    return YES;
}

- (NSDictionary *)parseQueryString:(NSString *)query {
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6]; //autorelease];
	NSArray *pairs = [query componentsSeparatedByString:@"&"];
	
	for (NSString *pair in pairs) {
		NSArray *elements = [pair componentsSeparatedByString:@"="];
		NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		
		[dict setObject:val forKey:key];
		}
	return dict;
	[dict release];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
	
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
	[activityIndicator stopAnimating];
	
	NSString *str = self.verse;
    
	// JinLong: display each pages
	int height = (int)pageScrollView.frame.size.height;
	
	if (webView.tag == 0)
	{
		[prevPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
														   @"document.getElementById('%@').scrollIntoView(true);", str]];
		
		if (str ==nil || [str isEqualToString:@""])
		{
			[prevPage stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:
															  @"self.scrollTo(0, %i);", curTopY - height]];
		}
		else
		{
			[prevPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
															   @"self.scrollBy(0, %i);", -height]];
		}
		
		if (bAllRefesh)
			nRefreshCounter++;
	}
	
	if (webView.tag == 1)
	{
		if (str != nil || [str isEqualToString:@""] == NO)
		{
			[curPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
															  @"document.getElementById('%@').scrollIntoView(true);", str]];
		}
		curTopY = -[self getPageOffsetY:curPage];
		if (bAllRefesh)
			nRefreshCounter++;
		totalHeight = [self getWebContentHeight:curPage];
	}
	
	if (webView.tag == 2)
	{
		[nextPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
														   @"document.getElementById('%@').scrollIntoView(true);", str]];
		
		if (str ==nil || [str isEqualToString:@""])
		{
			[nextPage stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:
															  @"self.scrollTo(0, %i);", curTopY + height]];
		}
		else
		{
			[nextPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
															   @"self.scrollBy(0, %i);", height]];
		}
		
		if (bAllRefesh)
			nRefreshCounter++;
	}
	
	if (nRefreshCounter == 3 && bAllRefesh == TRUE)
	{
		bAllRefesh = FALSE;
		nRefreshCounter = 0;
		verse = nil;	
	}
	
	/*if (webView.tag != 1)
		return;
	*/
	totalHeight = [self getWebContentHeight:curPage];

	/*
	[self.display2 stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
															@"document.getElementById('%@').scrollIntoView(true);", str]];
//	[self.display2 stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
//															@"document.getElementById('%@');", str]];
	verse = nil;
	
	*/
	
	NSString *strRef = self.chapter;
    [self.displayRef stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
															  @"document.getElementById('%@').scrollIntoView(true);", strRef]];
//	[self.displayRef stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
//															  @"document.getElementById('%@');", strRef]];
	chapter = nil;
	
	
	if (bkmkChecker == 2) {
		NSString *strBookmark = self.getBookmark;
		[/*self.display2*/curPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
																@"document.getElementById('%@').scrollIntoView(true);", strBookmark]];
//        [self.display2 stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
//																@"document.getElementById('%@');", strBookmark]];
		getBookmark = nil;
		bkmkChecker = 1;
	}
	
	if (fontChecker == 2) {
		NSString *strFont = self.changeFont;
		[/*self.display2*/curPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
																@"document.styleSheets[0].cssRules[0].style.fontFamily = '%@';", strFont]];
		
		[/*self.display2*/curPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
																@"document.styleSheets[0].cssRules[1].style.fontFamily = '%@';", strFont]];
		
		[/*self.display2*/curPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
																@"document.styleSheets[0].cssRules[2].style.fontFamily = '%@';", strFont]];
		
		NSString *str2 = forFonts;
		[/*self.display2*/curPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
																@"document.getElementById('%@').scrollIntoView(true);", str2]];
//		[self.display2 stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
//																@"document.getElementById('%@');", str2]];
	}
	
	if (fontSizeChecker == 2) {
		NSString *strFontSize = [NSString stringWithFormat:@"%@", [NSNumber numberWithInt:self.sliderValue]];
		[/*self.display2*/curPage stringByEvaluatingJavaScriptFromString: [[NSString alloc] initWithFormat:
																@"document.styleSheets[0].cssRules[2].style.fontSize = '%@'px;", strFontSize]];

	}
	
	NSMutableArray * highlightWords = [UserDataManager getHighlightItems];
	for (HighlightItem* item in highlightWords)
	{
		[/*display2*/curPage highlightString:item];
	}
	
	int font = [[NSUserDefaults standardUserDefaults] integerForKey: @"fontsize"];
	[self changeFont: font];
	[self setSliderValue: font];
}


-(IBAction)sendMail:(id)sender{
	if([MFMailComposeViewController canSendMail]) {
		MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
		mailCont.mailComposeDelegate = self;
		
		[mailCont setSubject:[contactUsEmail text]];
		[mailCont setToRecipients:[NSArray arrayWithObject:@"iehioze@yahoo.com"]];
		[mailCont setMessageBody:[contactUsSubject text] isHTML:NO];
		
		[self presentModalViewController:mailCont animated:YES];
		[mailCont release];
	}
	
	else {
		
		NSLog(@"Device is unable to send email in its current state.");
		
	}
	
	[contactUsView setHidden:YES];
	
	
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
	[self dismissModalViewControllerAnimated:YES];
}


-(IBAction)createNote:(id)sender{
	titleName = [titleField text];
	authorName = [authorsField text];
	authorandSeperator = [titleName stringByAppendingString:@"  -"];
	authorandTitle = [authorandSeperator stringByAppendingString:authorName];
	
	[notesLabel setText:authorandTitle];
	
	
	[notesView setHidden:NO];
	
	[authorsField resignFirstResponder];
	
	[titleField resignFirstResponder];
	
	[notesIntroView setHidden:YES];
	[textViewForNote setText:nil];
	checker = 2;
	another = 2;
}

-(IBAction)createBookmark:(id)sender{
	NSString *bkBooks = [bkMarkBooksField text];
	NSString *bkChapter = [bkMarkChapField text];
	NSString *bkVerse = [bkMarkVerseField text];
	
	NSString *booksandSpace = [bkBooks stringByAppendingString:@" "];
	NSString *booksandChapter = [booksandSpace stringByAppendingString:bkChapter];
	NSString *bookChapterandC = [booksandChapter stringByAppendingString:@":"];
	NSString *bookChapandVerse = [bookChapterandC stringByAppendingString:bkVerse];
	
	[bookmarkedScriptures addObject:bookChapandVerse];
	[UserDataManager addBookmark: bookChapandVerse];
	
	[bkMarkVerseField resignFirstResponder];
	
	[bookMarkView setHidden:YES];
	
}

-(IBAction)cancelBookmark:(id)sender{
	
	[bkMarkBooksField resignFirstResponder];
	
	[bkMarkVerseField resignFirstResponder];
	
	[bkMarkChapField resignFirstResponder];
	
	[bookMarkView setHidden:YES];
}

-(IBAction)createTopBookmark:(id)sender{
	[bookmarkedScriptures addObject:[label text]];
	[UserDataManager addBookmark: [label text]];
	NSString *title = [[NSString alloc] initWithFormat:@"You just bookmarked %@.", [label text]];
	NSString *message = [[NSString alloc] initWithFormat:@"Click OK to continue"];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
	[title release];
	[message release];
	
	
}


-(IBAction)cancelNote:(id)sender{
	
	[authorsField resignFirstResponder];
	
	[titleField resignFirstResponder];
	
	[notesIntroView setHidden:YES];
}

-(IBAction)cancelContactUs:(id)sender{
	[contactUsView setHidden:YES];
	
}





-(IBAction)btnShowReferences:(id)sender{
	if ([referenceView isHidden]) {
		[referenceView setHidden:NO];
	}
	else {
		[referenceView setHidden:YES];
	}
	
}

-(void)doTheWork:(NSString*)object{
	
	extVerse = object;
	
	
	NSArray *refBook=[extVerse componentsSeparatedByString:@" "];
	bookRep = [NSString stringWithFormat:@"%@",[refBook objectAtIndex:0]];
	bookRep2 = [NSString stringWithFormat:@"%@",[refBook objectAtIndex:1]];
	
	NSLog(@"this is the argument %@", object);
	
		
	checkRefId = 1;
	
	
	ReferencesViewController *refViewController = 
	[[ReferencesViewController alloc]      
	 initWithNibName:@"ReferencesViewController" bundle:[NSBundle mainBundle]];
	
	refViewController.navigationItem.title = @"References";
	UINavigationController *navController = 
	[[UINavigationController alloc] 
	 initWithRootViewController:refViewController];
	
	UIPopoverController *popover = 
	[[UIPopoverController alloc] 
	 initWithContentViewController:navController]; 
	
	popover.delegate = self;
	[refViewController release];
	[navController release];
	
	
	self.popoverController7 = popover;
	[popover release];
	
	[self.popoverController7 presentPopoverFromRect:/*display2*/curPage.bounds inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
	
}





-(IBAction)displayNoteIntroView:(id)sender{
	if ([notesIntroView isHidden]) {
		[notesIntroView setHidden:NO];
	}
	else {
		[notesIntroView setHidden:YES];
	}
	
	
}

-(void)displayNoteIntroView{
	if ([notesIntroView isHidden]) {
		[notesIntroView setHidden:NO];
	}
	else {
		[notesIntroView setHidden:YES];
	}
}


-(IBAction)goBack:(UIButton *)sender{
	[displayRef goBack];
}


-(IBAction)saveNotes:(id)sender{
	filePath = [@"Documents/" stringByAppendingString:[notesLabel text]];
	filePathWithExtension = [filePath stringByAppendingString:@".txt"];
	NSFileManager *fileManager = [NSFileManager defaultManager]; 
	NSString *fileName = [NSHomeDirectory() stringByAppendingPathComponent:filePathWithExtension];
	NSData *data = [[textViewForNote text]
					dataUsingEncoding:NSASCIIStringEncoding];
	if(another == 2){
		BOOL fileCreationSuccess = [fileManager createFileAtPath:fileName contents:nil attributes:nil];
		if(fileCreationSuccess == YES){
			
		}
		another = 1;
	}
	[data writeToFile:fileName atomically:YES];
	if(checker == 2){
		[noteTitleandAuthors addObject:[notesLabel text]];
		checker = 1;
		
	}
	
}


-(IBAction)doneWithNotes:(id)sender{
	filePath = [@"Documents/" stringByAppendingString:[notesLabel text]];
	filePathWithExtension = [filePath stringByAppendingString:@".txt"];
	NSFileManager *fileManager = [NSFileManager defaultManager]; 
	NSString *fileName = [NSHomeDirectory() stringByAppendingPathComponent:filePathWithExtension];
	NSData *data = [[textViewForNote text]
					dataUsingEncoding:NSASCIIStringEncoding];
	if(another == 2){
	BOOL fileCreationSuccess = [fileManager createFileAtPath:fileName contents:nil attributes:nil];
	if(fileCreationSuccess == YES){
		
	}
		another = 1;
	}
	[data writeToFile:fileName atomically:YES];
	if(checker == 2){
	[noteTitleandAuthors addObject:[notesLabel text]];
		checker = 1;
	
	}
	
	[authorsField resignFirstResponder];
	
	[textViewForNote setText:nil];
	
	[notesView setHidden:YES];
}


-(IBAction)btnShowSettings:(id)sender{
	SettingsViewController *settingsViewController = 
	[[SettingsViewController alloc]      
	 initWithNibName:@"SettingsViewController" bundle:[NSBundle mainBundle]];
	
	settingsViewController.navigationItem.title = @"Settings";
	UINavigationController *navController = 
	[[UINavigationController alloc] 
	 initWithRootViewController:settingsViewController];
	
	UIPopoverController *popover = 
	[[UIPopoverController alloc] 
	 initWithContentViewController:navController]; 
	
	popover.delegate = self;
	[settingsViewController release];
	[navController release];
	
	
	self.popoverController6 = popover;
	[popover release];
	// }
	
	CGRect popoverRect = [self.view convertRect:[btn_settings frame] fromView:[btn_settings superview]];
	
	popoverRect.size.width = MIN(popoverRect.size.width, 100);
	
	[self.popoverController6 presentPopoverFromRect:popoverRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
	
	
	
	
}


-(IBAction)btnShowNotes:(id)sender { 
	
		MyNotesViewController *myNotesViewController = 
		[[MyNotesViewController alloc]      
		 initWithNibName:@"MyNotesViewController" bundle:[NSBundle mainBundle]];
		
        myNotesViewController.navigationItem.title = @"My Notes";
        UINavigationController *navController = 
		[[UINavigationController alloc] 
		 initWithRootViewController:myNotesViewController];
		
        UIPopoverController *popover = 
		[[UIPopoverController alloc] 
		 initWithContentViewController:navController]; 
		
        popover.delegate = self;
        [myNotesViewController release];
        [navController release];
		
		
        self.popoverController5 = popover;
        [popover release];
   // }
	
	CGRect popoverRect = [self.view convertRect:[btn_notes frame] fromView:[btn_notes superview]];
	
	popoverRect.size.width = MIN(popoverRect.size.width, 100);
	
	[self.popoverController5 presentPopoverFromRect:popoverRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
	
	
}


-(IBAction)btnShowMyStuff:(id)sender { 
    
    if (self.popoverController3 == nil) {
        MyStuffViewController *myStuffViewController = 
		[[MyStuffViewController alloc]      
		 initWithNibName:@"MyStuffViewController" bundle:[NSBundle mainBundle]];
		
        myStuffViewController.navigationItem.title = @"My Stuff";
        UINavigationController *navController = 
		[[UINavigationController alloc] 
		 initWithRootViewController:myStuffViewController];
		
        UIPopoverController *popover = 
		[[UIPopoverController alloc] 
		 initWithContentViewController:navController]; 
		
        popover.delegate = self;
        [myStuffViewController release];
        [navController release];
		
        self.popoverController3 = popover;
        [popover release];
    }
	
	CGRect popoverRect = [self.view convertRect:[btn_myStuff frame] fromView:[btn_myStuff superview]];
	
	popoverRect.size.width = MIN(popoverRect.size.width, 100);
	
	[self.popoverController3 presentPopoverFromRect:popoverRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

//akbar ali khan ---------------------------------------------------------------------

-(IBAction)btnSearch:(id)sender { 
    
    if (self.popoverController8 == nil) {
       SearchModifiedViewController  *mySearchModifiedViewController = 
		[[SearchModifiedViewController alloc]      
		 initWithNibName:@"SearchModifiedViewController" bundle:[NSBundle mainBundle]];
		
        mySearchModifiedViewController.navigationItem.title = @"Search" ;
        UINavigationController *navController = 
		[[UINavigationController alloc] 
		 initWithRootViewController:mySearchModifiedViewController];
		
        UIPopoverController *popover = 
		[[UIPopoverController alloc] 
		 initWithContentViewController:navController]; 
		
        popover.delegate = self;
        [mySearchModifiedViewController release];
        [navController release];
		
        self.popoverController8 = popover;
        [popover release];
    }
	
	CGRect popoverRect = [self.view convertRect:[btn_search frame] fromView:[btn_search superview]];
	
	popoverRect.size.width = MIN(popoverRect.size.width, 90);
	
	[self.popoverController8 presentPopoverFromRect:popoverRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}



//----------------------------------------------------------------------





-(IBAction)btnShowBrowse:(id)sender { 
    if (self.popoverController2 == nil) {
        BibleBooksViewController *bibleBookViewController = 
		[[BibleBooksViewController alloc]      
		 initWithNibName:@"BibleBooksViewController" 
		 bundle:[NSBundle mainBundle]]; 
        if (self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown){
            bibleBookViewController.rotate = NO;
        }else{
            bibleBookViewController.rotate = YES;
        }
		[bibleBookViewController.tableView setScrollEnabled:NO];
        bibleBookViewController.navigationItem.title = @"Bible Books";
        UINavigationController *navController2 = 
		[[UINavigationController alloc] 
		 init];
		[navController2 pushViewController:bibleBookViewController animated:YES];
        UIPopoverController *popover = 
		[[UIPopoverController alloc] 
		 initWithContentViewController:navController2]; 
		
        popover.delegate = self;
		
        [bibleBookViewController release];
        [navController2 release];
		
//		popover.popoverContentSize=CGSizeMake(405, 830);
        
        popover.popoverContentSize=sizeOfBible;
        self.popoverController2 = popover;
        [popover release];
    }
//    popoverController2.popoverContentSize=sizeOfBible;
	if ([popoverController2 isPopoverVisible]){
		[self.popoverController2 dismissPopoverAnimated:YES];
	}
	
	CGRect popoverRect = [self.view convertRect:[btn_browse frame] fromView:[btn_browse superview]];
	
	//popoverRect.size.width = MIN(popoverRect.size.width, 100);
	
	[self.popoverController2 presentPopoverFromRect:popoverRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
	
}

-(IBAction)btnShowLibrary:(id)sender { 
	
    if (self.popoverController == nil) {
        LibraryViewController *libraryViewController = 
		[[LibraryViewController alloc]      
		 initWithNibName:@"LibraryViewController" bundle:[NSBundle mainBundle]];
		
        libraryViewController.navigationItem.title = @"Library";
        UINavigationController *navController = 
		[[UINavigationController alloc] 
		 initWithRootViewController:libraryViewController];
		
        UIPopoverController *popover = 
		[[UIPopoverController alloc] 
		 initWithContentViewController:navController]; 
		
        popover.delegate = self;
        [libraryViewController release];
        [navController release];
		
        self.popoverController = popover;
        [popover release];
    }
	
	CGRect popoverRect = [self.view convertRect:[btn_library frame] fromView:[btn_library superview]];
	
	popoverRect.size.width = MIN(popoverRect.size.width, 100);
	
	[self.popoverController presentPopoverFromRect:popoverRect inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
	
}


- (void)setVerse:(id)newVerse {
	
    if (verse != newVerse) {
        [verse release];
        verse = [newVerse retain];
		
		forFonts = verse;
		bookName = [detailItem stringByAppendingString:@"Bookxmltrans"];
		/*
		[display2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															[[NSBundle mainBundle] pathForResource:
															 [[NSString alloc] initWithFormat:@"%@", bookName] ofType:@"htm"]isDirectory:NO]]];
		 */
		
		// Jinlong: display verse
		NSURLRequest *urlReq = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:
																  [[NSBundle mainBundle] pathForResource:
																   [[NSString alloc] initWithFormat:@"%@", bookName] ofType:@"htm"]isDirectory:NO]];
		
		
		[self loadUrlRequest:urlReq];
		[urlReq release];
		
		[label setText:verse];

	}
	if (popoverController2 != nil) {
		[popoverController2 dismissPopoverAnimated:YES];
	}        
	
}


- (void)setChapter:(id)newChapter {
	
    if (chapter != newChapter) {
        [chapter release];
        chapter = [newChapter retain];
		
				
		self.forRef = chapter;
		referenceName = [detailItem stringByAppendingString:@"Ref"];
		[displayRef loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															  [[NSBundle mainBundle] pathForResource:
															  [[NSString alloc] initWithFormat:@"%@", referenceName] ofType:@"htm"]isDirectory:NO]]];
		
		[refLabel setText:[detailItem stringByAppendingString:@" References"]];
	}
	
	
}

- (void)setArticles:(id)newArticles {
	
    if (articles != newArticles) {
        [articles release];
        articles = [newArticles retain];
		
		/*[display2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															[[NSBundle mainBundle] pathForResource:
															 [[NSString alloc] initWithFormat:@"%@", articles] ofType:@"htm"]isDirectory:NO]]];*/
		NSURLRequest *urlReq = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:
																  [[NSBundle mainBundle] pathForResource:
																   [[NSString alloc] initWithFormat:@"%@", articles] ofType:@"htm"]isDirectory:NO]];
		[self loadUrlRequest:urlReq];
		[urlReq release];
		
		[label setText:articles];
		articles = nil;
    }
	
    if (popoverController != nil) {
		[popoverController dismissPopoverAnimated:YES];
	}        
	
}


- (void)setConcordance:(id)newConcordance {
	
    if (concordance != newConcordance) {
        [concordance release];
        concordance = [newConcordance retain];
		
		/*[display2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															[[NSBundle mainBundle] pathForResource:
															 [[NSString alloc] initWithFormat:@"%@", concordance] ofType:@"html"]isDirectory:NO]]];*/
		//JinLong
		NSURLRequest *urlReq = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:
																  [[NSBundle mainBundle] pathForResource:
																   [[NSString alloc] initWithFormat:@"%@", concordance] ofType:@"html"]isDirectory:NO]];
		[self loadUrlRequest:urlReq];
		[urlReq release];
		
		//[display2 release];
		[label setText:concordance];
		concordance = nil;
    }
	
    if (popoverController != nil) {
		[popoverController dismissPopoverAnimated:YES];
	}        
	
}

- (void)setPersonalWord:(id)newPersonalWord {
	
    if (personalWord != newPersonalWord) {
        [personalWord release];
        personalWord = [newPersonalWord retain];
		
		/*[display2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															[[NSBundle mainBundle] pathForResource:
															 @"Personal_word" ofType:@"htm"]isDirectory:NO]]];*/
		//JinLong
		NSURLRequest *urlReq = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:
																  [[NSBundle mainBundle] pathForResource:
																   @"Personal_word" ofType:@"htm"]isDirectory:NO]];
		[self loadUrlRequest:urlReq];
		[urlReq release];
		
		[label setText:personalWord];
		personalWord = nil;
    }
	
    if (popoverController != nil) {
		[popoverController dismissPopoverAnimated:YES];
	}        
	
}


- (void)setKJV:(id)newKJV {
	
    if (KJV != newKJV) {
        [KJV release];
        KJV = [newKJV retain];
		
		/*[display2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															[[NSBundle mainBundle] pathForResource:
															 @"GenesisBookxmltrans" ofType:@"htm"]isDirectory:NO]]];*/
		//JinLong
		NSURLRequest *urlReq = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:
																  [[NSBundle mainBundle] pathForResource:
																   @"GenesisBookxmltrans" ofType:@"htm"]isDirectory:NO]];
		
		[self loadUrlRequest:urlReq];
		[urlReq release];

		[label setText:@"Genesis 1:1"];
        
		KJV = nil;
    }
	
    if (popoverController != nil) {
		[popoverController dismissPopoverAnimated:YES];
	}        
	
}


- (void)setOtherBooks:(id)newOtherBooks {
	
    if (otherBooks != newOtherBooks) {
        [otherBooks release];
        otherBooks = [newOtherBooks retain];
		
		
		NSString *urlString = @"http://www.christembassydigitalmedia.com/DMM/mobileLW/erorBible/e-books_section.php";
		/*NSURLRequest *urlRequest =  [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
		[display2 loadRequest:urlRequest];*/
		
		//JinLong
		NSURLRequest *urlRequest =  [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
		[self loadUrlRequest:urlRequest];
		[urlRequest release];
		
		[activityIndicator startAnimating];
		[label setText:@"Other Books by the Authors"];
		otherBooks = nil;
    }
	
    if (popoverController3 != nil) {
		[popoverController3 dismissPopoverAnimated:YES];
	}        
	
}


- (void)setTakeTour:(id)newTakeTour {
	
    if (takeTour != newTakeTour) {
        [takeTour release];
        takeTour = [newTakeTour retain];
		
		
		NSString *urlString = @"http://www.christembassydigitalmedia.com/DMM/mobileLW/erorBible/video_tour.php";
		/*NSURLRequest *urlRequest =  [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
		[display2 loadRequest:urlRequest];*/
		
		//JinLong
		NSURLRequest *urlRequest =  [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
		[self loadUrlRequest:urlRequest];
		[urlRequest release];
		
		[activityIndicator startAnimating];
		[label setText:@"Video Tour"];
		takeTour = nil;
    }
	
    if (popoverController3 != nil) {
		[popoverController3 dismissPopoverAnimated:YES];
	}        
	
}


- (void)setContactUs:(id)newContactUs {
	
    if (contactUs != newContactUs) {
        [contactUs release];
        contactUs = [newContactUs retain];
		
		//[contactUsView setHidden:NO];
		
		NSString *urlString = @"http://www.christembassydigitalmedia.com/DMM/mobileLW/erorBible/Contact_us_form.php";
		/*NSURLRequest *urlRequest =  [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
		[display2 loadRequest:urlRequest];*/
		
		//JinLong
		NSURLRequest *urlRequest =  [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString]];
		[self loadUrlRequest:urlRequest];
		[urlRequest release];
		
		[activityIndicator startAnimating];
		[label setText:@"Contact Us"];
		contactUs = nil;
    }
	
    if (popoverController3 != nil) {
		[popoverController3 dismissPopoverAnimated:YES];
	}        
	
}

- (void)setOneYear:(id)newOneYear {
	
    if (oneYear != newOneYear) {
        [oneYear release];
        oneYear = [newOneYear retain];
		
		/*[display2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															[[NSBundle mainBundle] pathForResource:
															 @"OneYearStudyPlan" ofType:@"htm"]isDirectory:NO]]];*/
		//JinLong
		NSURLRequest *urlReq = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:
																  [[NSBundle mainBundle] pathForResource:
																   @"OneYearStudyPlan" ofType:@"htm"]isDirectory:NO]];
		
		[self loadUrlRequest:urlReq];
		[urlReq release];
		
		[label setText:@"One-Year Study Plan"];
		oneYear = nil;
    }
	
    if (popoverController3 != nil) {
		[popoverController3 dismissPopoverAnimated:YES];
	} 
	
	if (popoverController != nil) {
		[popoverController dismissPopoverAnimated:YES];
	}        
	
}

- (void)setTwoYears:(id)newTwoYears {
	
    if (twoYears != newTwoYears) {
        [twoYears release];
        twoYears = [newTwoYears retain];
		
		/*[display2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
															[[NSBundle mainBundle] pathForResource:
															 @"TwoYearStudyPlan" ofType:@"htm"]isDirectory:NO]]];*/
		//JinLong
		NSURLRequest *urlReq = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:
																  [[NSBundle mainBundle] pathForResource:
																   @"TwoYearStudyPlan" ofType:@"htm"]isDirectory:NO]];
		[self loadUrlRequest:urlReq];
		[urlReq release];
		
		[label setText:@"Two-Year Study Plan"];
		twoYears = nil;
    }
	
    if (popoverController3 != nil) {
		[popoverController3 dismissPopoverAnimated:YES];
	}
	if (popoverController != nil) {
		[popoverController dismissPopoverAnimated:YES];
	}        
	
}

- (void)setGetNote:(id)newGetNote {
	
    if (getNote != newGetNote) {
        [getNote release];
        getNote = [newGetNote retain];
		
		
		filePath = [@"Documents/" stringByAppendingString:getNote];
		filePathWithExtension = [filePath stringByAppendingString:@".txt"];
		
		NSFileManager *fileManager = [NSFileManager defaultManager];
		NSData *data;
		//NSString *dataValue;
		NSString *fileName =
		[NSHomeDirectory() stringByAppendingPathComponent:filePathWithExtension]; 
		data = [fileManager contentsAtPath:fileName];
		NSString* aStr;
		aStr = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
		
		if ([notesView isHidden]) {
			[notesView setHidden:NO];
		}
		
		[textViewForNote setText:aStr];
		[notesLabel setText:getNote];
		getNote = nil;
    }
	
    if (popoverController3 != nil) {
		[popoverController3 dismissPopoverAnimated:YES];
	}
	
	if (popoverController5 != nil) {
		[popoverController5 dismissPopoverAnimated:YES];
	}
	
	
}

- (void)setCheckRotation:(id)newCheckRotation {
	
    if (checkRotation != newCheckRotation) {
        [checkRotation release];
        checkRotation = [newCheckRotation retain];
		
		if ([checkRotation isEqualToString:@"ON"]) {
		
			/*[display2 reload];
			[display2 setBackgroundColor:[UIColor clearColor]];
			[display2 setBackgroundColor:[UIColor grayColor]];
			
			[display2 setOpaque:NO];*/
			
			[curPage reload];
			[prevPage reload];
			[nextPage reload];
			
			[curPage setBackgroundColor:[UIColor clearColor]];
			[curPage setBackgroundColor:[UIColor grayColor]];
			[curPage setOpaque:NO];
			
			[prevPage setBackgroundColor:[UIColor clearColor]];
			[prevPage setBackgroundColor:[UIColor grayColor]];
			[prevPage setOpaque:NO];
			
			[nextPage setBackgroundColor:[UIColor clearColor]];
			[nextPage setBackgroundColor:[UIColor grayColor]];
			[nextPage setOpaque:NO];
			
			
		}
		
		else
		if ([checkRotation isEqualToString:@"OFF"]) {
			/*[display2 reload];
			[display2 setBackgroundColor:[UIColor clearColor]];
			[display2 setBackgroundColor:[UIColor whiteColor]];
			
			[display2 setOpaque:NO];*/
			[curPage reload];
			[prevPage reload];
			[nextPage reload];
			
			[curPage setBackgroundColor:[UIColor clearColor]];
			[curPage setBackgroundColor:[UIColor whiteColor]];
			[curPage setOpaque:NO];
			
			[prevPage setBackgroundColor:[UIColor clearColor]];
			[prevPage setBackgroundColor:[UIColor whiteColor]];
			[prevPage setOpaque:NO];
			
			
			[nextPage setBackgroundColor:[UIColor clearColor]];
			[nextPage setBackgroundColor:[UIColor whiteColor]];
			[nextPage setOpaque:NO];
    }
	}

	
	//if (popoverController6 != nil) {
		//[popoverController6 dismissPopoverAnimated:YES];
	//}
	
	
}

- (void)setRotationSwitch:(id)newRotationSwitch {
	
    if (rotationSwitch != newRotationSwitch) {
        [rotationSwitch release];
        rotationSwitch = [newRotationSwitch retain];
		
	}
	
}

- (void)setChangeFont:(id)newChangeFont {
	
    if (changeFont != newChangeFont) {
        [changeFont release];
        changeFont = [newChangeFont retain];
		
		//[display2 reload];
		
		//JinLong
		[curPage reload];
		[prevPage reload];
		[nextPage reload];
		
		fontChecker = 2;
	}
	
	if (popoverController6 != nil) {
		[popoverController6 dismissPopoverAnimated:YES];
		}
		
	}

- (void)setSliderValue:(int)newSliderValue {
	
    if (newSliderValue < 0) newSliderValue = 0;
	if (newSliderValue > 100) newSliderValue = 100;
	sliderValue = newSliderValue;  
	
	[self changeFont: newSliderValue];//added by Zhezhun
//	[display2 reload]; //Marked by ZheZhun
	fontSizeChecker = 2;
}
//Added by ZhezHun
- (void) changeFont:(int) size
{
	if (size%10 != 0) {
		return;
	}
	int fontsize = 100 + size;
	[[NSUserDefaults standardUserDefaults] setInteger: size forKey: @"fontsize"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	NSString *jsString = [[NSString alloc] initWithFormat:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%d%%'", fontsize];    
	//[display2 stringByEvaluatingJavaScriptFromString:jsString];
	//Jinlong
	[curPage stringByEvaluatingJavaScriptFromString:jsString];
	[prevPage stringByEvaluatingJavaScriptFromString:jsString];
	[nextPage stringByEvaluatingJavaScriptFromString:jsString];
	[jsString release];
}
//End
- (void)setGetBookmark:(id)newGetBookmark {
	
    if (getBookmark != newGetBookmark) {
        [getBookmark release];
        getBookmark = [newGetBookmark retain];
		
		NSArray *components=[getBookmark componentsSeparatedByString:@" "];
		NSString *firstpart = [NSString stringWithFormat:@"%@",[components objectAtIndex:0]];
		NSString *secondpart = [NSString stringWithFormat:@"%@",[components objectAtIndex:1]];
        
		if([firstpart isEqualToString:@"1"] ||[firstpart isEqualToString:@"2"] || [firstpart isEqualToString:@"3"]){
		NSString *complement = [firstpart stringByAppendingString:@" "];
		NSString *thePart = [complement stringByAppendingString:secondpart];
		NSString *theBook2 = [thePart stringByAppendingString:@"Bookxmltrans"];
		/*[display2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:
																[[NSBundle mainBundle] pathForResource:
																 [[NSString alloc] initWithFormat:@"%@", theBook2] ofType:@"htm"]isDirectory:NO]]];*/
			//Jinlong
		NSURLRequest *urlReq = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:
																	  [[NSBundle mainBundle] pathForResource:
																	   [[NSString alloc] initWithFormat:@"%@", theBook2] ofType:@"htm"]isDirectory:NO]];
		[self loadUrlRequest:urlReq];
		[urlReq release];
		}		
		else
		{
			//Changed by ZheZhun
			NSString *theBook = [firstpart stringByAppendingString:@"Bookxmltrans"];
			NSString* strResource = [[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"%@", theBook] ofType:@"htm"];
			if (strResource) {
				//[display2 loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: strResource isDirectory:NO]]];
				//Jinlong
				NSURLRequest *urlReq = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath: strResource isDirectory:NO]];
				[self loadUrlRequest:urlReq];
				[urlReq release];
			}
			//End Change
		}
			bkmkChecker = 2;
		[label setText:getBookmark];
    }
	
    if (popoverController3 != nil) {
		[popoverController3 dismissPopoverAnimated:YES];
	}
	
	
}

-(void)getVerseId {
	
	NSString *filePath2 = @"Documents/verseId.htm";
	NSFileManager *fileManager2 = [NSFileManager defaultManager];
	NSString *fileName2 = [NSHomeDirectory() stringByAppendingPathComponent:filePath2];
	
	//data = [startHTML dataUsingEncoding:NSASCIIStringEncoding];
	
	BOOL fileCreationSuccess = [fileManager2 createFileAtPath:fileName2 contents:nil attributes:nil];
	if(fileCreationSuccess == YES){
		NSLog(@"Directory %@ created successfully!", fileName2);
	}
	
	
	
	NSString *infoSouceFile2 = [[NSBundle mainBundle] pathForResource:@"GenesisBookxmltrans" ofType:@"htm"];
	
	NSString *infoText2 = [NSString stringWithContentsOfFile:infoSouceFile2 encoding:NSUTF8StringEncoding error:nil];
	NSArray *components;
	NSMutableArray *verseIds2 = [[NSMutableArray alloc] init];
	
	NSArray *allLinedStrings2 = [infoText2 componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	for (int t = 0; t < [allLinedStrings2 count]; t++) {
		NSString *strsInOneLine2 = [allLinedStrings2 objectAtIndex:t];
		components=[strsInOneLine2 componentsSeparatedByString:@"\""];
		NSString *idComponent = [NSString stringWithFormat:@"%@",[components objectAtIndex:0]];
		[verseIds2 addObject:idComponent];
		
	}
	//[verseIds2 addObject:infoText2];
	[verseIds2 writeToFile:fileName2 atomically:YES];
	[verseIds2 release];
	//[components release];
	
	
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
	if ([rotationSwitch isEqualToString:@"ON"]) {
		return YES;
	}
	else
		if ([rotationSwitch isEqualToString:@"OFF"]){
			return NO;
		}
//    [self getFrameForRotation];
	return YES;
}
- (void)getFrameForRotation
{
    if (self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        sizeOfBible = CGSizeMake(405, 830);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"rotateP" object:nil];
    }else{
        sizeOfBible = CGSizeMake(610, 610);
        [[NSNotificationCenter defaultCenter] postNotificationName:@"rotateL" object:nil];
    }
    popoverController2.popoverContentSize = sizeOfBible;

}
//Added by ZheZhun
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    bookMarkView.frame = CGRectMake(119, 110, 390, 206);
    [self getFrameForRotation];
	
	//JinLong
	CGRect frame = pageScrollView.frame;
	
	frame.origin.x = 0; frame.origin.y = 0;
	prevPage.frame = frame;
	
	frame.origin.x = frame.size.width;
	curPage.frame = frame;
	
	frame.origin.x = 2 * frame.size.width;
	nextPage.frame = frame;
	
	frame.origin.x = frame.size.width;
	[pageScrollView setContentOffset:frame.origin];
	[pageScrollView sizeToFit];
	pageScrollView.contentSize = CGSizeMake(pageScrollView.frame.size.width * 3, pageScrollView.frame.size.height);
	
	[curPage reload];
	[prevPage reload];
	[nextPage reload];
	
//    if (fromInterfaceOrientation == UIInterfaceOrientationPortrait || fromInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
//        sizeOfBible = CGSizeMake(600, 600);
//    }else{
//        sizeOfBible = CGSizeMake(405, 830);
//    }
//    [self btnShowBrowse:nil];
}

//End
-(void)viewWillAppear:(BOOL)animated{
    [self getFrameForRotation];
//	if (self.interfaceOrientation == UIInterfaceOrientationPortrait || self.interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {
//        sizeOfBible = CGSizeMake(600, 600);
//    }else{
//        sizeOfBible = CGSizeMake(405, 830);
//    }
//    [self btnShowBrowse:nil];
}



- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	//[notesView release];
	//[notesIntroView release];
	//[referenceView release];
	[super viewDidUnload];
}

- (void)dealloc {
	//[mailCont release];
	[checkRotation release];
	[bookmarkedScriptures release];
	[noteTitleandAuthors release];
	[popoverController release];
	[detailItem release];
	[chapter release];
	[verse release];
	[popoverController2 release];
	//[display2 release];
	[displayRef release];
	[referenceView release];
	[bookName release];
	[concordance release];
	[personalWord release];
	[articles release];
	[KJV release];
	[activityIndicator release];
	[otherBooks release];
	[popoverController3 release];
	[popoverController5 release];
	[popoverController6 release];
	[popoverController7 release];
	[label release];
	[btn_settings release];
	[btn_browse release];
	[btn_library release];
	[btn_myStuff release];
	[btn_notes release];
	[oneYear release];
	[twoYears release];
	[referenceName release];
	[getNote release];
	[buttons release];
	[bkMarkBooksField release];
	[suggestionTable release];
	[suggestions release];
	[getBookmark release];
	[changeFont release];
	[forRef release];
	
	//jinlong
	[pageScrollView release];
	[prevPage release];
	[curPage release];
	[nextPage release];
	//[swipeUpRecognizer release];
	//[swipeDownRecognizer release];
    [super dealloc];
}

- (IBAction)textEditBegin:(id)textField
{
	[bookMarkView addSubview:suggestionTable];
	[suggestionTable setHidden:NO];
}

- (IBAction)textDidChange:(id)textField
{
	[suggestions release];
	suggestions = [[NSArray alloc] initWithArray:[autocomplete GetSuggestions:((UITextField*)textField).text]];
	[suggestionTable setHidden:NO];
	//[self.view addSubview:suggestionTable];
	[suggestionTable reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (suggestions)
	{
		return [suggestions count];
	}
	
	return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
	{
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	// Configure the cell.
	cell.textLabel.text = [suggestions objectAtIndex:indexPath.row];	
	
    return cell;
}



// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	bkMarkBooksField.text = [suggestions objectAtIndex:indexPath.row];
	[suggestionTable removeFromSuperview];
	[bkMarkBooksField resignFirstResponder];
}


- (IBAction)onBackButton:(id)sender {
	//[display2 onBackButton];

	//jinlong
	[curPage onBackButton];
	[prevPage reload];
	[nextPage reload];
}

// jinlong
- (void) loadPageScrollView
{
	pageScrollView.pagingEnabled = YES;
	pageScrollView.contentSize = CGSizeMake(pageScrollView.frame.size.width * 3, pageScrollView.frame.size.height + 50);
    pageScrollView.showsHorizontalScrollIndicator = NO;
    pageScrollView.showsVerticalScrollIndicator = NO;
    pageScrollView.scrollsToTop = NO;
    pageScrollView.delegate = self;
	pageScrollView.decelerationRate = UIScrollViewDecelerationRateFast;
	
	//self.swipeUpRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gotoPrevPage)];
	//self.swipeDownRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gotoNextPage)];
	//[(UISwipeGestureRecognizer *)self.swipeUpRecognizer setDirection:UISwipeGestureRecognizerDirectionUp];
	//[(UISwipeGestureRecognizer *)self.swipeDownRecognizer setDirection:UISwipeGestureRecognizerDirectionDown];
	//[(UISwipeGestureRecognizer *)self.swipeUpRecognizer setDelegate:self];
	//[(UISwipeGestureRecognizer *)self.swipeDownRecognizer setDelegate:self];
	//[pageScrollView addGestureRecognizer:self.swipeDownRecognizer];
	//[pageScrollView addGestureRecognizer:self.swipeUpRecognizer];
	
	// pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
	
	CGRect frame = pageScrollView.frame;
	
	frame.origin.x = 0; frame.origin.y = 0;
	prevPage = [[MenuWebView alloc] initWithFrame: frame];
	prevPage.delegate = self;
	prevPage.tag = 0;
	prevPage.bibleViewController = self;
	[pageScrollView addSubview: prevPage];
	
	CGRect curframe = frame; 
	curframe.origin.x = frame.size.width;
	curPage = [[MenuWebView alloc] initWithFrame: curframe];
	curPage.delegate = self;
	curPage.tag = 1;
	curPage.bibleViewController = self;
	[pageScrollView addSubview: curPage];
	
	
	frame.origin.x = frame.size.width*2;
	nextPage = [[MenuWebView alloc] initWithFrame: frame];
	nextPage.delegate = self;
	nextPage.tag = 2;
	nextPage.bibleViewController = self;
	[pageScrollView addSubview: nextPage];
	[pageScrollView scrollRectToVisible:curframe animated:NO];
	
	NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:
																  [[NSBundle mainBundle] pathForResource:@"GenesisBookxmltrans" ofType:@"htm"]isDirectory:NO]];
	pageNum = 1;
	curTopY = -8;
	
	[self loadUrlRequest:urlRequest];	
	[urlRequest release];
	
	[label setText:@"Genesis 1:1"];
}

- (void)loadUrlRequest:(NSURLRequest*) req
{
	bAllRefesh = TRUE;
	nRefreshCounter = 0;
	
	[curPage loadRequest: req];
	[prevPage loadRequest: req];
	[nextPage loadRequest: req];
}

-(int) getWebContentHeight: (UIWebView*)webView
{
	NSString *str = [webView stringByEvaluatingJavaScriptFromString:
					 @"document.documentElement.scrollHeight"];
	
	return [str intValue];
}

-(int) getPageOffsetY: (UIWebView*) webView
{
	NSString *str = [webView stringByEvaluatingJavaScriptFromString:
					 @"document.body.getBoundingClientRect().top"];
	return [str intValue];
}
/*
-(IBAction)gotoPrevPage
{
	if (curTopY < 0)
		return;
	
	CGRect frame = pageScrollView.frame;
	
	CGRect curframe = pageScrollView.frame; 
	curframe.origin.x = curframe.size.width; curframe.origin.y = 0; 
	
	MenuWebView *temp;
	
	temp = nextPage;
	nextPage = curPage;
	curPage = prevPage;
	prevPage = temp;
	
	pageNum = 1;
	
	prevPage.tag = 0;
	curPage.tag = 1;
	nextPage.tag = 2;
	
	frame.origin.x = 0; frame.origin.y = 0;
	prevPage.frame = frame;
	
	frame.origin.x = frame.size.width;
	curPage.frame = frame;
	
	frame.origin.x = 2 * frame.size.width;
	nextPage.frame = frame;
	
	curTopY -= frame.size.height;
	[pageScrollView setContentOffset:curframe.origin];
	[prevPage reload];
}

-(IBAction)gotoNextPage
{
	
	if (curTopY + pageScrollView.frame.size.height > [self getWebContentHeight:curPage])
		return;
	
	CGRect frame = pageScrollView.frame;
	
	CGRect curframe = pageScrollView.frame; 
	curframe.origin.x = curframe.size.width; curframe.origin.y = 0; 
	
	MenuWebView *temp;
	
	temp = nextPage;
	nextPage = prevPage;
	prevPage = curPage;
	curPage = temp;
	
	pageNum = 1;
	
	prevPage.tag = 0;
	curPage.tag = 1;
	nextPage.tag = 2;
	
	frame.origin.x = 0; frame.origin.y = 0;
	prevPage.frame = frame;
	
	frame.origin.x = frame.size.width;
	curPage.frame = frame;
	
	frame.origin.x = 2 * frame.size.width;
	nextPage.frame = frame;
	
	curTopY += frame.size.height;
	[pageScrollView setContentOffset:curframe.origin];
	[nextPage reload];
}
*/

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	NSLog(@"PageNum %i", pageNum);
	if (pageNum == 0)
	{
		CGRect frame = pageScrollView.frame;
		
		CGRect curframe = pageScrollView.frame; 
		curframe.origin.x = curframe.size.width; curframe.origin.y = 0; 
		
		MenuWebView *temp;
		
		temp = nextPage;
		nextPage = curPage;
		curPage = prevPage;
		prevPage = temp;
		
		pageNum = 1;
		
		prevPage.tag = 0;
		curPage.tag = 1;
		nextPage.tag = 2;
		
		frame.origin.x = 0; frame.origin.y = 0;
		prevPage.frame = frame;
		
		frame.origin.x = frame.size.width;
		curPage.frame = frame;
		
		frame.origin.x = 2 * frame.size.width;
		nextPage.frame = frame;
		
		curTopY -= frame.size.height;
		[pageScrollView setContentOffset:curframe.origin];
		[prevPage reload];
	}
	
	if (pageNum == 2)
	{
		CGRect frame = pageScrollView.frame;
		
		CGRect curframe = pageScrollView.frame; 
		curframe.origin.x = curframe.size.width; curframe.origin.y = 0; 
		
		MenuWebView *temp;
		
		temp = nextPage;
		nextPage = prevPage;
		prevPage = curPage;
		curPage = temp;
		
		pageNum = 1;
		
		prevPage.tag = 0;
		curPage.tag = 1;
		nextPage.tag = 2;
		
		frame.origin.x = 0; frame.origin.y = 0;
		prevPage.frame = frame;
		
		frame.origin.x = frame.size.width;
		curPage.frame = frame;
		
		frame.origin.x = 2 * frame.size.width;
		nextPage.frame = frame;
		
		curTopY += frame.size.height;
		[pageScrollView setContentOffset:curframe.origin];
		[nextPage reload];
	}
}

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
	
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = pageScrollView.frame.size.width;
	
	if (curTopY < 0)
	{
		if (pageScrollView.contentOffset.x < pageScrollView.frame.size.width)
		{
			[pageScrollView setContentOffset:curPage.frame.origin];
			return;
		}
	}
	
	if (curTopY + pageScrollView.frame.size.height+8 >= totalHeight )
	{
		if (pageScrollView.contentOffset.x > pageScrollView.frame.size.width)
		{
			[pageScrollView setContentOffset:curPage.frame.origin];
			return;
		}
	}
	
	int page = floor((pageScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
	pageScrollView.contentOffset = CGPointMake(pageScrollView.contentOffset.x, 0);
	if (pageNum == page)
		return;
	pageNum = page;
}

@end
