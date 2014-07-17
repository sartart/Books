//
//  ViewController.m
//  Books
//
//  Created by sart on 7/12/14.
//  Copyright (c) 2014 sart. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"
#import "Author.h"
#import "Genre.h"
#import "IllustrationAuthor.h"
#import "Publishing.h"
#import "mycellCell.h" ////sdvbigwiurvaweirubveurvbeirbvu

@interface ViewController ()

@property (nonatomic,strong) Singleton *singleton;
@property (weak, nonatomic) IBOutlet UITableView *tableBook;
@property (nonatomic,strong) NSArray *arrData;
@property (weak, nonatomic) IBOutlet UITextField *nameBook;
@property (weak, nonatomic) IBOutlet UITextField *NameAuthor;
@property (weak, nonatomic) IBOutlet UITextField *nameGenre;
@property (weak, nonatomic) IBOutlet UITextField *namePublishing;
@property (weak, nonatomic) IBOutlet UITextField *nameIllustratorAuthor;
@property (nonatomic,strong) NSArray *arrAuthors;
@property (nonatomic,strong) NSArray *arrGenres;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.singleton = [Singleton sharedInstance];
    
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Book" inManagedObjectContext:self.singleton.managedObjectContext]];
    self.arrData = [self.singleton.managedObjectContext executeFetchRequest:request error:&error];
    //[self.tableBook reloadData];
    //NSLog(@"%@", self.arrData);
    
    [_nameBook setDelegate:self];
    [_NameAuthor setDelegate:self];
    [_nameGenre setDelegate:self];
    [_namePublishing setDelegate:self];
    [_nameIllustratorAuthor setDelegate:self];
    [self.tableBook setEditing:NO];
    
//    NSError *error3;
//    if (![[self fetchedResultsController] performFetch:&error3]) {
//        NSLog(@"Unresolved error %@, %@", error3, [error3 userInfo]);
//        abort();
//    }


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated. 
}


- (IBAction)addElement:(id)sender
{
    Book *book1 = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.singleton.managedObjectContext];
    book1.name = self.nameBook.text;
    
    Publishing *pub1 = [NSEntityDescription insertNewObjectForEntityForName:@"Publishing" inManagedObjectContext:self.singleton.managedObjectContext];
    pub1.name = self.namePublishing.text;
    
    Genre *genre1 = [NSEntityDescription insertNewObjectForEntityForName:@"Genre" inManagedObjectContext:self.singleton.managedObjectContext];
    genre1.name = self.nameGenre.text;
    
    IllustrationAuthor *ill1 = [NSEntityDescription insertNewObjectForEntityForName:@"IllustrationAuthor" inManagedObjectContext:self.singleton.managedObjectContext];
    ill1.name = self.nameIllustratorAuthor.text;
    
    Author *author1 = [NSEntityDescription insertNewObjectForEntityForName:@"Author" inManagedObjectContext:self.singleton.managedObjectContext];
    author1.name = self.NameAuthor.text;
    
    [book1 addAuthorObject:author1];
    book1.publishing = pub1;
    book1.illustratorauthor = ill1;
    [book1 addGenreObject:genre1];
    
    NSError *error = nil;
    if([self.singleton.managedObjectContext hasChanges] && ![self.singleton.managedObjectContext save:&error])
    {
        NSLog(@"Error");
    }
    
    NSError *error2 = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Book" inManagedObjectContext:self.singleton.managedObjectContext]];
    self.arrData = [self.singleton.managedObjectContext executeFetchRequest:request error:&error2];
    
    //self.arrAuthors = [[bookTemp author] allObjects];
    
    [self.tableBook reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrData.count;
}



-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //MMcell *cell;
    static NSString *const cell_id = @"Cell";
    mycellCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    

    Book *bookTemp = [self.arrData objectAtIndex:indexPath.row];
    
    self.arrAuthors = [[bookTemp author] allObjects];
    self.arrGenres = [[bookTemp genre] allObjects];
    
    cell.illust.text = bookTemp.illustratorauthor.name;
    cell.name.text = bookTemp.name;
    cell.author.text = [[self.arrAuthors objectAtIndex:0] name];
    cell.genre.text = [[self.arrGenres objectAtIndex:0] name];
    cell.Publish.text = bookTemp.publishing.name;
    
    
    /*
    cell.nameFilm.text = [NSString stringWithFormat:@"%@", film.name];
    cell.nameDirector.text = film.director.name ;
    
    if ([[film.actors allObjects] count]) {
        for (int i = 0; i < [[film.actors allObjects] count]; i++) {
            cell.nameActor.text = [cell.nameActor.text stringByAppendingString:[[[film.actors allObjects] objectAtIndex:i] name]];
            if (i < [[film.actors allObjects] count] - 1) {
                cell.nameActor.text = [cell.nameActor.text stringByAppendingString:@", "];
            }
        }
    }
    if ([[film.genres allObjects] count]) {
        for (int i = 0; i < [[film.genres allObjects] count]; i++) {
            cell.nameGenre.text = [cell.nameGenre.text stringByAppendingString:[[[film.genres allObjects] objectAtIndex:i] name]];
            if (i < [[film.genres allObjects] count] - 1) {
                cell.nameGenre.text = [cell.nameGenre.text stringByAppendingString:@", "];
            }
        }
    }
    if ([[film.countrys allObjects] count]) {
        for (int i = 0; i < [[film.countrys allObjects] count]; i++) {
            cell.nameCountry.text = [cell.nameCountry.text stringByAppendingString:[[[film.countrys allObjects] objectAtIndex:i] name]];
            if (i < [[film.countrys allObjects] count] - 1) {
                cell.nameCountry.text = [cell.nameCountry.text stringByAppendingString:@", "];
            }
        }
    }
 */
    return cell;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_nameBook resignFirstResponder];
    [_NameAuthor resignFirstResponder];
    [_nameGenre resignFirstResponder];
    [_namePublishing resignFirstResponder];
    [_nameIllustratorAuthor resignFirstResponder];
    return YES;
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



- (IBAction)deleteElement:(id)sender
{
    [self editing];
}



- (void) editing {
    [self.tableBook setEditing:!self.tableBook.editing animated:YES];
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSError *error = nil;
        [self.singleton.managedObjectContext deleteObject:[self.arrData objectAtIndex:indexPath.row]];
        [self.singleton.managedObjectContext save:&error];
        [self allBooksObjects:@"name"];
        
        [tableView reloadData];
    }
}



- (void) allBooksObjects:(NSString*)sortString {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
        NSSortDescriptor *authorDescriptor = [[NSSortDescriptor alloc] initWithKey:sortString ascending:YES];
        NSArray *sortDescriptors = @[authorDescriptor];
    
        [request setEntity:[NSEntityDescription entityForName:@"Book" inManagedObjectContext:self.singleton.managedObjectContext]];
        [request setSortDescriptors:sortDescriptors];
    
        NSError *error = nil;
        self.arrData = [self.singleton.managedObjectContext executeFetchRequest:request error:&error];
    
    [self.tableBook reloadData];
}







@end
