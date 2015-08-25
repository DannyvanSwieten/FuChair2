//
//  SensorOscSend.cpp
//  Fuchair 2.0
//
//  Created by Danny van Swieten on 4/24/15.
//  Copyright (c) 2015 Danny van Swieten. All rights reserved.
//

#include "SensorOscSend.h"

SensorOscSend::SensorOscSend()
{
    oscClient = [[F53OSCClient alloc] init];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];

    chairNumber = [defaults stringForKey: @"ChairNumber"];
    port = [defaults integerForKey: @"PortNumber"];
    ipNumber = [defaults stringForKey:@"IpNumber"];
}

void SensorOscSend::accelerometerChanged(float x, float y, float z)
{
    float roll;
    float pitch;
    float x2 = x*x;
    float y2 = y*y;
    float z2 = z*z;
    
    float xResult = sqrt(y2 + z2);
    pitch = atan2(-x, xResult) * 180 / M_PI;
    phase = (atan2(z, x)) * 180 / M_PI;
             
//    while (phase - previousPhase > M_PI)
//    {
//        phase += 2 * M_PI;
//    }
//    
//    while(phase - previousPhase < -M_PI)
//    {
//        phase -= 2 * M_PI;
//    }
//    
//    previousPhase = phase;
    
    NSNumber *num = [NSNumber numberWithFloat: z];
    
    if(chairNumber && port && ipNumber)
    {
        F53OSCMessage *message = [F53OSCMessage messageWithAddressPattern:@"/ChairNumber/Sensor/Type/Value"
                                                                arguments:@[chairNumber, @"Accellerometer" ,@"Angle" , num]];
        
        [oscClient sendPacket:message toHost: ipNumber onPort:port];
    }
}

void SensorOscSend::gyrometerChanged(float x, float y, float z)
{
    
}

void SensorOscSend::setChairNumber(NSString *chairNumber_)
{
    chairNumber = chairNumber_;
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:chairNumber
                    forKey:@"ChairNumber"];
    
    [defaults synchronize];
}

void SensorOscSend::setIpNumber(NSString *ipNumber_)
{
    ipNumber = ipNumber_;
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:ipNumber
                 forKey:@"IpNumber"];
    
    [defaults synchronize];
}

void SensorOscSend::setPortNumber(NSString *portNumber_)
{
    port = portNumber_.integerValue;
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:port
                 forKey:@"PortNumber"];
    
    [defaults synchronize];
}