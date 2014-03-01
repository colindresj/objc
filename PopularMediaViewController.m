//
//  PopularMediaViewController.m
//  TestApp
//
//  Created by Jorge Colindres on 2/22/14.
//  Copyright (c) 2014 Jorge Colindres. All rights reserved.
//

#import "PopularMediaViewController.h"
#import "MediaController.h"
#import "MediaObject.h"
#import "ImageViewController.h"

@interface PopularMediaViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) MediaController *mediaController;

@end

@implementation PopularMediaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [[self.navigationController navigationBar] setTintColor: [UIColor blackColor]];
    
    self.title = @"JC's App";
    
    self.mediaController = [[MediaController alloc] init];
    [self updateContent];
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(tapRefresh:)];
    
    self.navigationItem.rightBarButtonItem = refreshButton;
}

- (void)updateContent
{
    [self.loader startAnimating];
    self.loader.hidesWhenStopped = YES;
    
    // for memory management
    __weak PopularMediaViewController *weakSelf = self;
    
    [weakSelf.mediaController fetchPopularMediaWithCompletionBlock:^(BOOL success) {
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            if (success)
            {
                [self.loader stopAnimating];
                
                // Reload the tableview
                [self.tableView reloadData];
            }
            else
            {
                // Alert the user on failure
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Uh Oh!" message:@"An error occurred" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
            
                [alert show];
            }
        });
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// For navigation/organizational purposes
#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImageViewController *viewController = [[ImageViewController alloc] initWithNibName:@"ImageViewController" bundle:Nil];
    
    viewController.mediaObject = [self.mediaController.mediaObjects objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - UITableView Datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    MediaObject *currMediaObject = [self.mediaController.mediaObjects objectAtIndex:indexPath.row];
    
    cell.textLabel.textColor = [UIColor grayColor];
    cell.textLabel.text = currMediaObject.username;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.mediaController.mediaObjects count];
}

- (void)tapRefresh:(UIBarButtonItem *)sender
{
    [self updateContent];
}

@end
