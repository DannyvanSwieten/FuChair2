//
//  ViewController.h
//  Fuchair 2.0
//
//  Created by Danny van Swieten on 4/24/15.
//  Copyright (c) 2015 Danny van Swieten. All rights reserved.
//

#import <UIKit/UIKit.h>

struct OSC;

@interface ViewController : UIViewController
{
    struct OSC* oscClient;
}
@property (weak, nonatomic) IBOutlet UITextField *ChairNumber;

@property (weak, nonatomic) IBOutlet UITextField *ipNumber;

@property (weak, nonatomic) IBOutlet UITextField *portNumber;

@property (weak, nonatomic) IBOutlet UIButton *ChairNumberButton;

@end