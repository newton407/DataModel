//
//  ViewController.m
//  LatestApp
//
//  Created by Newton Osinowo on 2014-07-11.
//  Copyright (c) 2014 Detech Technologies. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()
@property (strong, nonatomic) NSString *mark;
@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSManagedObjectContext *context;
    self.mark = [[NSString alloc]init];
    AppDelegate *appDelegate  = [[UIApplication sharedApplication]delegate];
    
    context = [appDelegate managedObjectContext];
    
    NSManagedObjectContext *newContact;
    NSManagedObjectContext *newContact2;
    NSManagedObjectContext *newContact3;
    newContact = [NSEntityDescription insertNewObjectForEntityForName:@"Class" inManagedObjectContext:context];
    newContact2 = [NSEntityDescription insertNewObjectForEntityForName:@"Class" inManagedObjectContext:context];
    newContact3 = [NSEntityDescription insertNewObjectForEntityForName:@"Class" inManagedObjectContext:context];
    
    
    [newContact setValue:@"newton" forKey:@"name"];
    [newContact setValue:@"90" forKey:@"mark"];
    
    
    [newContact2 setValue:@"tolu" forKey:@"name"];
    [newContact2 setValue:@"92" forKey:@"mark"];
    
    
    [newContact3 setValue:@"peter" forKey:@"name"];
    [newContact3 setValue:@"96" forKey:@"mark"];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnSubmit:(id)sender {
    NSManagedObjectContext *context;
    AppDelegate *appDelegate  = [[UIApplication sharedApplication]delegate];
    
    context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Class" inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc]init];
    [request setEntity:entityDesc];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(name = %@)", _StdName.text];
    [request setPredicate:pred];
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    
    if ([objects count] == 0) {
        NSLog(@"No matches for %@", _StdName.text);
    }
    else{
        NSManagedObject *match1 = objects[0];
        self.mark = [match1 valueForKey:@"mark"];
        _StdMark.text = self.mark;
    }
    [[self view] endEditing:YES];
}
@end
