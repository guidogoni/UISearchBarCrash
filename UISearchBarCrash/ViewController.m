//
//  ViewController.m
//  UISearchBarCrash
//
//  Created by Guido on 11/17/15.
//  Copyright © 2015 YOP. All rights reserved.
//

#import "ViewController.h"

#define IS_OS_7_OR_LATER            ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_71_LOWER              ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.1f)

@interface ViewController ()

@property (nonatomic, weak) UISearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
    searchBar.delegate = self;
    if (!(IS_OS_7_OR_LATER && IS_OS_71_LOWER)) { // remove this check for crash to occure on iOS 7.0.x
        searchBar.enablesReturnKeyAutomatically = NO; // this line crashes on iOS 7.0.x
    }
    searchBar.placeholder = [NSLocalizedString(@"Search", nil) stringByAppendingString:@" YOP"];
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.navigationItem.titleView = searchBar;
    self.searchBar = searchBar;
}

#pragma mark - UISearchBar Delegate

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;
    
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
}

@end
