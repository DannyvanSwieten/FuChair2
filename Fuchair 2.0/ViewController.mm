//
//  ViewController.m
//  Fuchair 2.0
//
//  Created by Danny van Swieten on 4/24/15.
//  Copyright (c) 2015 Danny van Swieten. All rights reserved.
//

#import "ViewController.h"
#import "SensorOscSend.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    oscClient = new OSC();
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [_ChairNumber setText:[defaults stringForKey:@"ChairNumber"]];
    [_portNumber setText:[defaults stringForKey:@"PortNumber"]];
    [_ipNumber setText:[defaults stringForKey:@"IpNumber"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)textFieldChanged:(UITextField *)sender
{
}
- (IBAction)chairButtonPressed:(UIButton *)sender
{
    oscClient->sender.setChairNumber([_ChairNumber text]);
    oscClient->sender.setIpNumber([_ipNumber text]);
    oscClient->sender.setPortNumber([_portNumber text]);
}

@end
