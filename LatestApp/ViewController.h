//
//  ViewController.h
//  LatestApp
//
//  Created by Newton Osinowo on 2014-07-11.
//  Copyright (c) 2014 Detech Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *StdName;
- (IBAction)OnSubmit:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *StdMark;
@end
