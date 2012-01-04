//
//  ChaptersViewController.m
//  ROR_Bible
//
//  Created by imm(content 2 mobile) on 3/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ChaptersViewController.h"


@implementation ChaptersViewController
@synthesize word,chapter2;

#pragma mark -
#pragma mark Initialization

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
	ROR_BibleAppDelegate *appDelegate3 = [[UIApplication sharedApplication] delegate];
	NSString *chapName = appDelegate3.viewController.detailItem;
    chapterItems = [[NSMutableArray alloc] init];
	if (chapName == @"Genesis") {
		NSString *prefix = @"Genesis ";
		NSString *chapters;
		for ( int i = 1 ; i <= 50 ; i ++ ){
			NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
			chapters = [prefix stringByAppendingString:newUrl];
			[chapterItems addObject:chapters];
		}
		
	}
	else
		if (chapName == @"Exodus") {
			NSString *prefix = @"Exodus ";
			NSString *chapters;
			for ( int i = 1 ; i <= 40 ; i++ ){
				NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]]; chapters = [prefix stringByAppendingString:newUrl];
				[chapterItems addObject:chapters];
			}
		}
	
		else
			if (chapName == @"Leviticus") {
				NSString *prefix = @"Leviticus ";
				NSString *chapters;
				for ( int i = 1 ; i <= 27 ; i++ ){
					NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
					chapters = [prefix stringByAppendingString:newUrl];
					[chapterItems addObject:chapters];
				}
				
			}
			else
				if (chapName == @"Numbers") {
					NSString *prefix = @"Numbers ";
					NSString *chapters;
					for ( int i = 1 ; i <= 36 ; i++ ){
						NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
						chapters = [prefix stringByAppendingString:newUrl];
						[chapterItems addObject:chapters];
					}
					
				}
				else
					if (chapName == @"Deuteronomy") {
						NSString *prefix = @"Deuteronomy ";
						NSString *chapters;
						for ( int i = 1 ; i <= 34 ; i++ ){
							NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
							chapters = [prefix stringByAppendingString:newUrl];
							[chapterItems addObject:chapters];
						}
						
					}
					else
						if (chapName == @"Joshua") {
							NSString *prefix = @"Joshua ";
							NSString *chapters;
							for ( int i = 1 ; i <= 24 ; i++ ){
								NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
								chapters = [prefix stringByAppendingString:newUrl];
								[chapterItems addObject:chapters];
							}
							
						}
						else
							if (chapName == @"Judges") {
								NSString *prefix = @"Judges ";
								NSString *chapters;
								for ( int i = 1 ; i <= 21 ; i++ ){
									NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
									chapters = [prefix stringByAppendingString:newUrl];
									[chapterItems addObject:chapters];
								}
								
							}
							else
								if (chapName == @"Ruth") {
									NSString *prefix = @"Ruth ";
									NSString *chapters;
									for ( int i = 1 ; i <= 4 ; i++ ){
										NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
										chapters = [prefix stringByAppendingString:newUrl];
										[chapterItems addObject:chapters];
									}
									
								}
							else
								if (chapName == @"1 Samuel") {
									NSString *prefix = @"1 Samuel ";
									NSString *chapters;
									for ( int i = 1 ; i <= 31 ; i++ ){
										NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
										chapters = [prefix stringByAppendingString:newUrl];
										[chapterItems addObject:chapters];
									}
									
								}
	
								else
									if (chapName == @"2 Samuel") {
										NSString *prefix = @"2 Samuel ";
										NSString *chapters;
										for ( int i = 1 ; i <= 24 ; i++ ){
											NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
											chapters = [prefix stringByAppendingString:newUrl];
											[chapterItems addObject:chapters];
										}
										
									}
									else
										if (chapName == @"1 Kings") {
											NSString *prefix = @"1 Kings ";
											NSString *chapters;
											for ( int i = 1 ; i <= 22 ; i++ ){
												NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
												chapters = [prefix stringByAppendingString:newUrl];
												[chapterItems addObject:chapters];
											}
											
										}
										else
											if (chapName == @"2 Kings") {
												NSString *prefix = @"2 Kings ";
												NSString *chapters;
												for ( int i = 1 ; i <= 25 ; i++ ){
													NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
													chapters = [prefix stringByAppendingString:newUrl];
													[chapterItems addObject:chapters];
												}
											}
											else
												if (chapName == @"1 Chronicles") {
													NSString *prefix = @"1 Chronicles ";
													NSString *chapters;
													for ( int i = 1 ; i <= 29 ; i++ ){
														NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
														chapters = [prefix stringByAppendingString:newUrl];
														[chapterItems addObject:chapters];
													}
													
												}
												else
													if (chapName == @"2 Chronicles") {
														NSString *prefix = @"2 Chronicles ";
														NSString *chapters;
														for ( int i = 1 ; i <= 36 ; i++ ){
															NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
															chapters = [prefix stringByAppendingString:newUrl];
															[chapterItems addObject:chapters];
														}
														
													}
													else
														if (chapName == @"Ezra") {
															NSString *prefix = @"Ezra ";
															NSString *chapters;
															for ( int i = 1 ; i <= 10 ; i++ ){
																NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																chapters = [prefix stringByAppendingString:newUrl];
																[chapterItems addObject:chapters];
															}
															
														}
														else
															if (chapName == @"Nehemiah") {
																NSString *prefix = @"Nehemiah ";
																NSString *chapters;
																for ( int i = 1 ; i <= 13 ; i++ ){
																	NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																	chapters = [prefix stringByAppendingString:newUrl];
																	[chapterItems addObject:chapters];
																}
																
															}
	
															else
																if (chapName == @"Esther") {
																	NSString *prefix = @"Esther ";
																	NSString *chapters;
																	for ( int i = 1 ; i <= 10 ; i++ ){
																		NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																		chapters = [prefix stringByAppendingString:newUrl];
																		[chapterItems addObject:chapters];
																	}
																	
																}
																else
																	if (chapName == @"Job") {
																		NSString *prefix = @"Job ";
																		NSString *chapters;
																		for ( int i = 1 ; i <= 42 ; i++ ){
																			NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																			chapters = [prefix stringByAppendingString:newUrl];
																			[chapterItems addObject:chapters];
																		}
																		
																	}
																	else
																		if (chapName == @"Psalm") {
																			NSString *prefix = @"Psalm ";
																			NSString *chapters;
																			for ( int i = 1 ; i <= 150 ; i++ ){
																				NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																				chapters = [prefix stringByAppendingString:newUrl];
																				[chapterItems addObject:chapters];
																			}
																			
																		}
																		else
																			if (chapName == @"Proverbs") {
																				NSString *prefix = @"Proverbs ";
																				NSString *chapters;
																				for ( int i = 1 ; i <= 31 ; i++ ){
																					NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																					chapters = [prefix stringByAppendingString:newUrl];
																					[chapterItems addObject:chapters];
																				}
																				
																			}
																			else
																				if (chapName == @"Ecclesiastes") {
																					NSString *prefix = @"Ecclesiastes ";
																					NSString *chapters;
																					for ( int i = 1 ; i <= 12 ; i++ ){
																						NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																						chapters = [prefix stringByAppendingString:newUrl];
																						[chapterItems addObject:chapters];
																					}
																					
																				}
																				else
																					if (chapName == @"Song of Solomon") {
																						NSString *prefix = @"Song of Solomon ";
																						NSString *chapters;
																						for ( int i = 1 ; i <= 8 ; i++ ){
																							NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																							chapters = [prefix stringByAppendingString:newUrl];
																							[chapterItems addObject:chapters];
																						}
																					}
	
																					else
																						if (chapName == @"Isaiah") {
																							NSString *prefix = @"Isaiah ";
																							NSString *chapters;
																							for ( int i = 1 ; i <= 66 ; i++ ){
																								NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																								chapters = [prefix stringByAppendingString:newUrl];
																								[chapterItems addObject:chapters];
																							}
																							
																						}
	
																						else
																							if (chapName == @"Jeremiah") {
																								NSString *prefix = @"Jeremiah ";
																								NSString *chapters;
																								for ( int i = 1 ; i <= 52 ; i++ ){
																									NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																									chapters = [prefix stringByAppendingString:newUrl];
																									[chapterItems addObject:chapters];
																								}
																								
																							}
	
																							else
																								if (chapName == @"Lamentations") {
																									NSString *prefix = @"Lamentations ";
																									NSString *chapters;
																									for ( int i = 1 ; i <= 5 ; i++ ){
																										NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																										chapters = [prefix stringByAppendingString:newUrl];
																										[chapterItems addObject:chapters];
																									}
																									
																								}
	
																								else
																									if (chapName == @"Ezekiel") {
																										NSString *prefix = @"Ezekiel ";
																										NSString *chapters;
																										for ( int i = 1 ; i <= 48 ; i++ ){
																											NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																											chapters = [prefix stringByAppendingString:newUrl];
																											[chapterItems addObject:chapters];
																										}
																										
																									}
																									else
																										if (chapName == @"Daniel") {
																											NSString *prefix = @"Daniel ";
																											NSString *chapters;
																											for ( int i = 1 ; i <= 12 ; i++ ){
																												NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																												chapters = [prefix stringByAppendingString:newUrl];
																												[chapterItems addObject:chapters];
																											}
																											
																										}
																										else
																											if (chapName == @"Hosea") {
																												NSString *prefix = @"Hosea ";
																												NSString *chapters;
																												for ( int i = 1 ; i <= 14 ; i++ ){
																													NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																													chapters = [prefix stringByAppendingString:newUrl];
																													[chapterItems addObject:chapters];
																												}
																											}
																											else
																												if (chapName == @"Joel") {
																													NSString *prefix = @"Joel ";
																													NSString *chapters;
																													for ( int i = 1 ; i <= 3 ; i++ ){
																														NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																														chapters = [prefix stringByAppendingString:newUrl];
																														[chapterItems addObject:chapters];
																													}
																													
																												}
																												else
																													if (chapName == @"Amos") {
																														NSString *prefix = @"Amos ";
																														NSString *chapters;
																														for ( int i = 1 ; i <= 9 ; i++ ){
																															NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																															chapters = [prefix stringByAppendingString:newUrl];
																															[chapterItems addObject:chapters];
																														}
																														
																													}
																													else
																														if (chapName == @"Obadiah") {
																															NSString *prefix = @"Obadiah ";
																															NSString *chapters;
																															for ( int i = 1 ; i <= 1 ; i++ ){
																																NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																chapters = [prefix stringByAppendingString:newUrl];
																																[chapterItems addObject:chapters];
																															}
																															
																														}
																														else
																															if (chapName == @"Jonah") {
																																NSString *prefix = @"Jonah ";
																																NSString *chapters;
																																for ( int i = 1 ; i <= 4 ; i++ ){
																																	NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																	chapters = [prefix stringByAppendingString:newUrl];
																																	[chapterItems addObject:chapters];
																																}
																																
																															}
																															else
																																if (chapName == @"Micah") {
																																	NSString *prefix = @"Micah ";
																																	NSString *chapters;
																																	for ( int i = 1 ; i <= 7 ; i++ ){
																																		NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																		chapters = [prefix stringByAppendingString:newUrl];
																																		[chapterItems addObject:chapters];
																																	}
																																}
	
																																else
																																	if (chapName == @"Nahum") {
																																		NSString *prefix = @"Nahum ";
																																		NSString *chapters;
																																		for ( int i = 1 ; i <= 3 ; i++ ){
																																			NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																			chapters = [prefix stringByAppendingString:newUrl];
																																			[chapterItems addObject:chapters];
																																		}
																																		
																																	}
	
																																	else
																																		if (chapName == @"Habakkuk") {
																																			NSString *prefix = @"Habakkuk ";
																																			NSString *chapters;
																																			for ( int i = 1 ; i <= 3 ; i++ ){
																																				NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																				chapters = [prefix stringByAppendingString:newUrl];
																																				[chapterItems addObject:chapters];
																																			}
																																			
																																		}
	
																																		else
																																			if (chapName == @"Zephaniah") {
																																				NSString *prefix = @"Zephaniah ";
																																				NSString *chapters;
																																				for ( int i = 1 ; i <= 3 ; i++ ){
																																					NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																					chapters = [prefix stringByAppendingString:newUrl];
																																					[chapterItems addObject:chapters];
																																				}
																																				
																																			}
	
																																			else
																																				if (chapName == @"Haggai") {
																																					NSString *prefix = @"Haggai ";
																																					NSString *chapters;
																																					for ( int i = 1 ; i <= 2 ; i++ ){
																																						NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																						chapters = [prefix stringByAppendingString:newUrl];
																																						[chapterItems addObject:chapters];
																																					}
																																					
																																				}
	
																																				else
																																					if (chapName == @"Zechariah") {
																																						NSString *prefix = @"Zechariah ";
																																						NSString *chapters;
																																						for ( int i = 1 ; i <= 14 ; i++ ){
																																							NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																							chapters = [prefix stringByAppendingString:newUrl];
																																							[chapterItems addObject:chapters];
																																						}
																																						
																																					}
	
																																					else
																																						if (chapName == @"Malachi") {
																																							NSString *prefix = @"Malachi ";
																																							NSString *chapters;
																																							for ( int i = 1 ; i <= 4 ; i++ ){
																																								NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																								chapters = [prefix stringByAppendingString:newUrl];
																																								[chapterItems addObject:chapters];
																																							}
																																							
																																						}
	
																																						else
																																							if (chapName == @"Matthew") {
																																								NSString *prefix = @"Matthew ";
																																								NSString *chapters;
																																								for ( int i = 1 ; i <= 28 ; i++ ){
																																									NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																									chapters = [prefix stringByAppendingString:newUrl];
																																									[chapterItems addObject:chapters];
																																								}
																																								
																																							}
																																							else
																																								if (chapName == @"Mark") {
																																									NSString *prefix = @"Mark ";
																																									NSString *chapters;
																																									for ( int i = 1 ; i <= 16 ; i++ ){
																																										NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																										chapters = [prefix stringByAppendingString:newUrl];
																																										[chapterItems addObject:chapters];
																																									}
																																									
																																								}
																																								else
																																									if (chapName == @"Luke") {
																																										NSString *prefix = @"Luke ";
																																										NSString *chapters;
																																										for ( int i = 1 ; i <= 24 ; i++ ){
																																											NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																											chapters = [prefix stringByAppendingString:newUrl];
																																											[chapterItems addObject:chapters];
																																										}
																																										
																																									}
	
																																									else
																																										if (chapName == @"John") {
																																											NSString *prefix = @"John ";
																																											NSString *chapters;
																																											for ( int i = 1 ; i <= 21 ; i++ ){
																																												NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																												chapters = [prefix stringByAppendingString:newUrl];
																																												[chapterItems addObject:chapters];
																																											}
																																											
																																										}
																																										else
																																											if (chapName == @"Acts") {
																																												NSString *prefix = @"Acts ";
																																												NSString *chapters;
																																												for ( int i = 1 ; i <= 28 ; i++ ){
																																													NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																													chapters = [prefix stringByAppendingString:newUrl];
																																													[chapterItems addObject:chapters];
																																												}
																																												
																																											}
																																											else
																																												if (chapName == @"Romans") {
																																													NSString *prefix = @"Romans ";
																																													NSString *chapters;
																																													for ( int i = 1 ; i <= 16 ; i++ ){
																																														NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																														chapters = [prefix stringByAppendingString:newUrl];
																																														[chapterItems addObject:chapters];
																																													}
																																													
																																												}
	
																																												else
																																													if (chapName == @"1 Corinthians") {
																																														NSString *prefix = @"1 Corinthians ";
																																														NSString *chapters;
																																														for ( int i = 1 ; i <= 16 ; i++ ){
																																															NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																															chapters = [prefix stringByAppendingString:newUrl];
																																															[chapterItems addObject:chapters];
																																														}
																																														
																																													}
																																													else
																																														if (chapName == @"2 Corinthians") {
																																															NSString *prefix = @"2 Corinthians ";
																																															NSString *chapters;
																																															for ( int i = 1 ; i <= 13 ; i++ ){
																																																NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																chapters = [prefix stringByAppendingString:newUrl];
																																																[chapterItems addObject:chapters];
																																															}
																																															
																																														}
																																														else
																																															if (chapName == @"Galatians") {
																																																NSString *prefix = @"Galatians ";
																																																NSString *chapters;
																																																for ( int i = 1 ; i <= 6 ; i++ ){
																																																	NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																	chapters = [prefix stringByAppendingString:newUrl];
																																																	[chapterItems addObject:chapters];
																																																}
																																																
																																															}
																																															else
																																																if (chapName == @"Ephesians") {
																																																	NSString *prefix = @"Ephesians ";
																																																	NSString *chapters;
																																																	for ( int i = 1 ; i <= 6 ; i++ ){
																																																		NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																		chapters = [prefix stringByAppendingString:newUrl];
																																																		[chapterItems addObject:chapters];
																																																	}
																																																}
	
																																																else
																																																	if (chapName == @"Philippians") {
																																																		NSString *prefix = @"Philippians ";
																																																		NSString *chapters;
																																																		for ( int i = 1 ; i <= 4 ; i++ ){
																																																			NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																			chapters = [prefix stringByAppendingString:newUrl];
																																																			[chapterItems addObject:chapters];
																																																		}
																																																		
																																																	}
																																																	else
																																																		if (chapName == @"Colossians") {
																																																			NSString *prefix = @"Colossians ";
																																																			NSString *chapters;
																																																			for ( int i = 1 ; i <= 4 ; i++ ){
																																																				NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																				chapters = [prefix stringByAppendingString:newUrl];
																																																				[chapterItems addObject:chapters];
																																																			}
																																																			
																																																		}
	
																																																		else
																																																			if (chapName == @"1 Thessalonians") {
																																																				NSString *prefix = @"1 Thessalonians ";
																																																				NSString *chapters;
																																																				for ( int i = 1 ; i <= 5 ; i++ ){
																																																					NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																					chapters = [prefix stringByAppendingString:newUrl];
																																																					[chapterItems addObject:chapters];
																																																				}
																																																				
																																																			}
	
																																																			else
																																																				if (chapName == @"2 Thessalonians") {
																																																					NSString *prefix = @"2 Thessalonians ";
																																																					NSString *chapters;
																																																					for ( int i = 1 ; i <= 3 ; i++ ){
																																																						NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																						chapters = [prefix stringByAppendingString:newUrl];
																																																						[chapterItems addObject:chapters];
																																																					}
																																																					
																																																				}
	
																																																				else
																																																					if (chapName == @"1 Timothy") {
																																																						NSString *prefix = @"1 Timothy ";
																																																						NSString *chapters;
																																																						for ( int i = 1 ; i <= 6 ; i++ ){
																																																							NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																							chapters = [prefix stringByAppendingString:newUrl];
																																																							[chapterItems addObject:chapters];
																																																						}
																																																						
																																																					}
	
																																																					else
																																																						if (chapName == @"2 Timothy") {
																																																							NSString *prefix = @"2 Timothy ";
																																																							NSString *chapters;
																																																							for ( int i = 1 ; i <= 4 ; i++ ){
																																																								NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																								chapters = [prefix stringByAppendingString:newUrl];
																																																								[chapterItems addObject:chapters];
																																																							}
																																																							
																																																						}
	
																																																						else
																																																							if (chapName == @"Titus") {
																																																								NSString *prefix = @"Titus ";
																																																								NSString *chapters;
																																																								for ( int i = 1 ; i <= 3 ; i++ ){
																																																									NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																									chapters = [prefix stringByAppendingString:newUrl];
																																																									[chapterItems addObject:chapters];
																																																								}
																																																								
																																																							}
	
																																																							else
																																																								if (chapName == @"Philemon") {
																																																									NSString *prefix = @"Philemon ";
																																																									NSString *chapters;
																																																									for ( int i = 1 ; i <= 1 ; i++ ){
																																																										NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																										chapters = [prefix stringByAppendingString:newUrl];
																																																										[chapterItems addObject:chapters];
																																																									}
																																																									
																																																								}
	
																																																								else
																																																									if (chapName == @"Hebrews") {
																																																										NSString *prefix = @"Hebrews ";
																																																										NSString *chapters;
																																																										for ( int i = 1 ; i <= 13 ; i++ ){
																																																											NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																											chapters = [prefix stringByAppendingString:newUrl];
																																																											[chapterItems addObject:chapters];
																																																										}
																																																										
																																																									}
																																																									else
																																																										if (chapName == @"James") {
																																																											NSString *prefix = @"James ";
																																																											NSString *chapters;
																																																											for ( int i = 1 ; i <= 5 ; i++ ){
																																																												NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																												chapters = [prefix stringByAppendingString:newUrl];
																																																												[chapterItems addObject:chapters];
																																																											}
																																																										}
	
																																																										else
																																																											if (chapName == @"1 Peter") {
																																																												NSString *prefix = @"1 Peter ";
																																																												NSString *chapters;
																																																												for ( int i = 1 ; i <= 5 ; i++ ){
																																																													NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																													chapters = [prefix stringByAppendingString:newUrl];
																																																													[chapterItems addObject:chapters];
																																																												}
																																																												
																																																											}
	
																																																											else
																																																												if (chapName == @"2 Peter") {
																																																													NSString *prefix = @"2 Peter ";
																																																													NSString *chapters;
																																																													for ( int i = 1 ; i <= 3 ; i++ ){
																																																														NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																														chapters = [prefix stringByAppendingString:newUrl];
																																																														[chapterItems addObject:chapters];
																																																													}
																																																													
																																																												}
	
																																																												else
																																																													if (chapName == @"1 John") {
																																																														NSString *prefix = @"1 John ";
																																																														NSString *chapters;
																																																														for ( int i = 1 ; i <= 5 ; i++ ){
																																																															NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																															chapters = [prefix stringByAppendingString:newUrl];
																																																															[chapterItems addObject:chapters];
																																																														}
																																																														
																																																													}
	
																																																													else
																																																														if (chapName == @"2 John") {
																																																															NSString *prefix = @"2 John ";
																																																															NSString *chapters;
																																																															for ( int i = 1 ; i <= 1 ; i++ ){
																																																																NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																																chapters = [prefix stringByAppendingString:newUrl];
																																																																[chapterItems addObject:chapters];
																																																															}
																																																															
																																																														}
	
																																																														else
																																																															if (chapName == @"3 John") {
																																																																NSString *prefix = @"3 John ";
																																																																NSString *chapters;
																																																																for ( int i = 1 ; i <= 1 ; i++ ){
																																																																	NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																																	chapters = [prefix stringByAppendingString:newUrl];
																																																																	[chapterItems addObject:chapters];
																																																																}
																																																																
																																																															}
	
																																																															else
																																																																if (chapName == @"Jude") {
																																																																	NSString *prefix = @"Jude ";
																																																																	NSString *chapters;
																																																																	for ( int i = 1 ; i <= 1 ; i++ ){
																																																																		NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																																		chapters = [prefix stringByAppendingString:newUrl];
																																																																		[chapterItems addObject:chapters];
																																																																	}
																																																																}
	
																																																																else
																																																																	if (chapName == @"Revelation") {
																																																																		NSString *prefix = @"Revelation ";
																																																																		NSString *chapters;
																																																																		for ( int i = 1 ; i <= 22 ; i++ ){
																																																																			NSString *newUrl =[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:i]];
																																																																			chapters = [prefix stringByAppendingString:newUrl];
																																																																			[chapterItems addObject:chapters];
																																																																		}
																																																																		
																																																																	}
	
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
	self.contentSizeForViewInPopover = CGSizeMake(410.0, 300.0);
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
    NSLog(@"chapter size = %d", [chapterItems count]);
    if ([chapterItems count]%4>0) {
        return [chapterItems count]/4+1;
    }
	return [chapterItems count]/4;
	
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *title;
	NSArray *array;

	static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = 
	[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] 
				 initWithStyle:UITableViewCellStyleDefault 
				 reuseIdentifier:CellIdentifier] autorelease];
    }
	
	NSArray *subviews = cell.contentView.subviews;
	for (UIView *subview in subviews) {
		if ([subview isKindOfClass:[UIButton class]] && subview.frame.size.width > 99 && subview.frame.size.width < 101)
			[subview removeFromSuperview];
	}

    
	btnOne=[UIButton buttonWithType:UIButtonTypeCustom];
    btnOne.frame=CGRectMake(0, 0, 100, 35);
    [btnOne setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
    [btnOne addTarget:self action:@selector(btnOneAction:) forControlEvents:UIControlEventTouchUpInside];
    [btnOne.titleLabel adjustsFontSizeToFitWidth];
    
    if (indexPath.row*4 < [chapterItems count]) {
        title = [chapterItems objectAtIndex:indexPath.row*4];
        array = [title componentsSeparatedByString:@" "];
        [btnOne setTitle:[array lastObject] forState:UIControlStateNormal];
        btnOne.tag=indexPath.row*4;
        [cell.contentView addSubview:btnOne];
    }
    btnSecond=[UIButton buttonWithType:UIButtonTypeCustom];
    btnSecond.frame=CGRectMake(101, 0, 100, 35);
    [btnSecond setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
    [btnSecond addTarget:self action:@selector(btnOneAction:) forControlEvents:UIControlEventTouchUpInside];
    [btnSecond.titleLabel adjustsFontSizeToFitWidth];
    if (indexPath.row*4+1 < [chapterItems count]) {
        title = [chapterItems objectAtIndex:indexPath.row*4+1];
        array = [title componentsSeparatedByString:@" "];
        [btnSecond setTitle:[array lastObject] forState:UIControlStateNormal];
        
        btnSecond.tag=indexPath.row*4+1;
         [cell.contentView addSubview:btnSecond];
        
    }
	
    
    btnThird=[UIButton buttonWithType:UIButtonTypeCustom];
    btnThird.frame=CGRectMake(202, 0, 100, 35);
    [btnThird setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
    [btnThird addTarget:self action:@selector(btnOneAction:) forControlEvents:UIControlEventTouchUpInside];
    [btnThird.titleLabel adjustsFontSizeToFitWidth];
    if (indexPath.row*4+2 < [chapterItems count]) {
        title = [chapterItems objectAtIndex:indexPath.row*4+2];
        array = [title componentsSeparatedByString:@" "];
        [btnThird setTitle:[array lastObject] forState:UIControlStateNormal];
        
        btnThird.tag=indexPath.row*4+2;
        [cell.contentView addSubview:btnThird]; 
    }
	
    
    btnFourth=[UIButton buttonWithType:UIButtonTypeCustom];
    btnFourth.frame=CGRectMake(303, 0, 100, 35);
    [btnFourth setBackgroundImage:[UIImage imageNamed:@"button_2 copy.png"] forState:UIControlStateNormal];
    [btnFourth addTarget:self action:@selector(btnOneAction:) forControlEvents:UIControlEventTouchUpInside];
    [btnFourth.titleLabel adjustsFontSizeToFitWidth];
    if (indexPath.row*4+3 < [chapterItems count]) {
        title = [chapterItems objectAtIndex:indexPath.row*4+3];
        array = [title componentsSeparatedByString:@" "];
        [btnFourth setTitle:[array lastObject] forState:UIControlStateNormal];
        
        btnFourth.tag=indexPath.row*4+3;
        [cell.contentView addSubview:btnFourth];
    }
	
    
    
    // Configure the cell...
    //---add this---
    //cell.textLabel.text = [chapterItems objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont fontWithName:@"Cambria" size:20];
//	if (indexPath.row >= 0)
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
   
    
    	
    return cell;
	
}

- (void) btnOneAction:(id)sender        {
    
    ROR_BibleAppDelegate *appDelegate2 = 
	[[UIApplication sharedApplication] delegate];
	
	
	appDelegate2.viewController.chapter = 
	[chapterItems objectAtIndex:[sender tag]];
	
	//appDelegate2.viewController.chapters2 = [chapterItems objectAtIndex:indexPath.row];
	
	
	//self.chapter2 = [chapterItems objectAtIndex:indexPath.row];
	
    VersesViewController *verseViewController = 
	[[VersesViewController alloc] 
	 initWithNibName:@"VersesViewController" bundle:nil];
	[self.navigationController 
	 pushViewController:verseViewController animated:YES];
	verseViewController.navigationItem.title = @"Verse";
	[verseViewController release];
    
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
	
//	ROR_BibleAppDelegate *appDelegate2 = 
//	[[UIApplication sharedApplication] delegate];
//	
//	
//	appDelegate2.viewController.chapter = 
//	[chapterItems objectAtIndex:indexPath.row];
//	
//	//appDelegate2.viewController.chapters2 = [chapterItems objectAtIndex:indexPath.row];
//	
//	
//	//self.chapter2 = [chapterItems objectAtIndex:indexPath.row];
//	
//    VersesViewController *verseViewController = 
//	[[VersesViewController alloc] 
//	 initWithNibName:@"VersesViewController" bundle:nil];
//	[self.navigationController 
//	 pushViewController:verseViewController animated:YES];
//	verseViewController.navigationItem.title = @"Verse";
//	[verseViewController release];

	
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
	[chapterItems release];
    [super dealloc];
}


@end

