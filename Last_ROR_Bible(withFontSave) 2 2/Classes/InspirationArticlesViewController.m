//
//  InspirationArticlesViewController.m
//  ROR_Bible
//
//  Created by Christian Isaac on 4/8/11.
//  Copyright 2011 Emerging Technologies & Re-engineering. All rights reserved.
//

#import "InspirationArticlesViewController.h"


@implementation InspirationArticlesViewController


#pragma mark -
#pragma mark View lifecycle

/*
 - (id)initWithStyle:(UITableViewStyle)style {
 // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
 self = [super initWithStyle:style];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	
    plannerItems = [[NSMutableArray alloc] init];
    [plannerItems addObject:@"Recreate Your World With Your Words"];
    [plannerItems addObject:@"Prove Your Love For God"];
	[plannerItems addObject:@"See It Inside First!"];
    [plannerItems addObject:@"Keep Talking Your Dreams"];
	[plannerItems addObject:@"You Can Get A Fresh Revelation Everyday"];
	[plannerItems addObject:@"You Can Cast Out Devils"];
	[plannerItems addObject:@"You're From Above"];
	[plannerItems addObject:@"Do Something Stop Waiting"];
	[plannerItems addObject:@"Do The Impossible"];
	[plannerItems addObject:@"Don't Condemn Yourself"];
	[plannerItems addObject:@"Stir Up The Fire Continually!"];
	[plannerItems addObject:@"Challenges The Stepping Stones For Your Promotion"];
	[plannerItems addObject:@"Look And Live"];
	[plannerItems addObject:@"You're Separated Unto The Lord"];
	[plannerItems addObject:@"Blessed Beyond Measure"];
	[plannerItems addObject:@"Be Happy About Today!"];
	[plannerItems addObject:@"Benefits Of Tithing"];
	[plannerItems addObject:@"The Key To A Successful Life"];
	[plannerItems addObject:@"What Can You See"];
	[plannerItems addObject:@"Dare To Believe God's Word"];
	[plannerItems addObject:@"Know How To Stir Up The Anointing In You"];
	[plannerItems addObject:@"You're Important To God"];
	[plannerItems addObject:@"Serve God With A Loyal Heart"];
	[plannerItems addObject:@"Get Big For The Gospel"];
	[plannerItems addObject:@"Get Rid Of Pride"];
	[plannerItems addObject:@"Equal Partakers"];
	[plannerItems addObject:@"Work The Word!"];
	[plannerItems addObject:@"Your Channel For Wealth"];
	[plannerItems addObject:@"It Is Well!"];
	[plannerItems addObject:@"Due Order"];
	[plannerItems addObject:@"A New Move"];
	[plannerItems addObject:@"Are You A Minus Or A Plus"];
	[plannerItems addObject:@"A Package Of Divine Power"];
	[plannerItems addObject:@"Help Is Not Far Away"];
	[plannerItems addObject:@"A Perfect Heart"];
	[plannerItems addObject:@"All You Need Is A Word From The Lord!"];
	[plannerItems addObject:@"Unequal Yoke"];
	[plannerItems addObject:@"True Joy Is From Within"];
	[plannerItems addObject:@"You Came At The Right Time"];
	[plannerItems addObject:@"God Loves To Brag With Your Life!"];
	[plannerItems addObject:@"The Truth Vs The Fact"];
	[plannerItems addObject:@"Fruitful In All Seasons"];
	[plannerItems addObject:@"The Prevailing Power Of Praise"];
	[plannerItems addObject:@"Stop Struggling!"];
	[plannerItems addObject:@"God Knows How To Take Care Of You!"];
	[plannerItems addObject:@"Never Bother About Your Adversaries"];
	[plannerItems addObject:@"It's Joyful, Exciting and Free!"];
	[plannerItems addObject:@"A Very Present Help"];
	[plannerItems addObject:@"Have A Blessed Day And A Glorious Night!"];
	[plannerItems addObject:@"His Mercies Are New Every Morning!"];
	[plannerItems addObject:@"It's Not Over Yet!"];
	[plannerItems addObject:@"God's Word: The Most Valuable Treasure in The World"];
	[plannerItems addObject:@"The Word Is Your Light"];
	[plannerItems addObject:@"Jesus The Only Name By Which Men Can Be Saved!"];
	[plannerItems addObject:@"How To Activate The Power Of God"];
	[plannerItems addObject:@"Preach The Good News!"];
	[plannerItems addObject:@"The Transforming Power Of The Word"];
	[plannerItems addObject:@"Be Aglow In The Spirit!"];
	[plannerItems addObject:@"You Have The Mind Of Christ!"];
	[plannerItems addObject:@"Pray More In The Spirit!"];
	[plannerItems addObject:@"Keep Godly Friends"];
	[plannerItems addObject:@"Your Set Time To Walk In Victory"];
	[plannerItems addObject:@"You're Up To The Task!"];
	[plannerItems addObject:@"Translate Trials To Challenges!"];
	[plannerItems addObject:@"All Things Have Become New!"];
	[plannerItems addObject:@"Live As An Ambassador Of Christ"];
	[plannerItems addObject:@"You've Been Made Rich"];
	[plannerItems addObject:@"Use Your Liberty Rightly"];
	[plannerItems addObject:@"Experience The Fullness Of God's Blessings"];
	[plannerItems addObject:@"Put Away Bitterness And Malice"];
	[plannerItems addObject:@"Stay Filled With The Spirit"];
	[plannerItems addObject:@"Outdo Your Past"];
	[plannerItems addObject:@"Time To Rejoice!"];
	[plannerItems addObject:@"You Can Do All Things"];
	[plannerItems addObject:@"You Can Know All Things"];
	[plannerItems addObject:@"Prayer Conditions Your Spirit"];
	[plannerItems addObject:@"Recognize Your Authority In Christ!"];
	[plannerItems addObject:@"Engage In Spiritual Exercise"];
	[plannerItems addObject:@"Unleash Your Faith!"];
	[plannerItems addObject:@"How To Activate The Power Of God"];
	[plannerItems addObject:@"Discover Your Purpose In God"];
	[plannerItems addObject:@"How To Encourage The Ministry Of Angels"];
	[plannerItems addObject:@"The High Priest Of Our Confessions"];
	[plannerItems addObject:@"Let The Word Dominate You!"];
	[plannerItems addObject:@"Refuse To Doubt"];
	[plannerItems addObject:@"Your Set Time For Divine Visitations"];
	[plannerItems addObject:@"You Have Staying Power"];
	[plannerItems addObject:@"The Mirror Of God"];
	[plannerItems addObject:@"True Beauty Is Of The Heart"];
	[plannerItems addObject:@"No More Sickness!"];
	[plannerItems addObject:@"No More Sleepless Nights"];
	[plannerItems addObject:@"No More Tears!"];
	[plannerItems addObject:@"Rest In His Love"];
	[plannerItems addObject:@"Reign In Life"];
	[plannerItems addObject:@"Riches For Ransom"];
	[plannerItems addObject:@"Sanctify The Gold"];
	[plannerItems addObject:@"The Days Of The Latter Rain"];
	[plannerItems addObject:@"See The Invisible, Believe The Impossible"];
	[plannerItems addObject:@"Sometimes He Saves The Best For Last!"];
	[plannerItems addObject:@"Say What You Mean, And Mean What You Say"];
	[plannerItems addObject:@"Speaking In Tongues Empowers You To Be An Effective Witness For Christ"];
	[plannerItems addObject:@"Strong Faith"];
	[plannerItems addObject:@"Take It By Force!"];
	[plannerItems addObject:@"Walk In Divine Health"];
	[plannerItems addObject:@"Build Up Yourself On Your Most Holy Faith!"];
	[plannerItems addObject:@"You're The Fulfillment Of God's Dream"];
	[plannerItems addObject:@"Come Up Hither!"];
	[plannerItems addObject:@"The Limits Are Broken"];
	[plannerItems addObject:@"The Power Is In Your Mouth!"];
	[plannerItems addObject:@"Jesus Is The Name Above All Names"];
	[plannerItems addObject:@"Find Out What The Lord Wants"];
	[plannerItems addObject:@"The Power Of The Spoken word"];
	[plannerItems addObject:@"The Sinner's Need"];
	[plannerItems addObject:@"The World Is Waiting For You"];
	[plannerItems addObject:@"Worship The Lord"];
	[plannerItems addObject:@"Yield To The Spirit"];
	[plannerItems addObject:@"You Need Self-Control"];
	[plannerItems addObject:@"You Need The Knowledge of God's Word"];
	[plannerItems addObject:@"You Were In God's Plan"];
	[plannerItems addObject:@"You're Anointed For Good Works!"];
	[plannerItems addObject:@"Your Set Time To Improve Your World!"];
	[plannerItems addObject:@"The All-Powerful Name Of Jesus!"];
	[plannerItems addObject:@"The Prayer Of Agreement - A Sure Way Of Praying And Getting Results"];
	
	
	
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
	self.contentSizeForViewInPopover = CGSizeMake(400.0, 300.0);
}


/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	return [plannerItems count];
	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = 
	[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] 
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:CellIdentifier] autorelease];
    }
	
    // Configure the cell...
    //---add this---
    cell.textLabel.text = [plannerItems objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont fontWithName:@"Cambria" size:20];
	/**if (indexPath.row >= 0)
	 cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;**/
    
	return cell;
	
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source.
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
    ROR_BibleAppDelegate *appDelegateForArticles = 
	[[UIApplication sharedApplication] delegate];
	appDelegateForArticles.viewController.articles = [plannerItems objectAtIndex:indexPath.row];	
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[plannerItems release];
    [super dealloc];
}


@end

