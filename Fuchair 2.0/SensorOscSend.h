//
//  SensorOscSend.h
//  Fuchair 2.0
//
//  Created by Danny van Swieten on 4/24/15.
//  Copyright (c) 2015 Danny van Swieten. All rights reserved.
//

#ifndef __Fuchair_2_0__SensorOscSend__
#define __Fuchair_2_0__SensorOscSend__

#include "Motion.h"
#include "F53OSC.h"

class SensorOscSend: public APAMotion
{
public:
    SensorOscSend();
    void accelerometerChanged (float x, float y, float z) override;
    void gyrometerChanged(float x, float y, float z) override;
    
    void setChairNumber(NSString* chairNumber);
    void setIpNumber(NSString* ipNumber_);
    void setPortNumber(NSString* portNumber_);

private:
    
    NSString* chairNumber;
    NSString* ipNumber;
    NSInteger port;
    F53OSCClient* oscClient;
    
    float previousPhase = 0;
    float phase = 0;
};

struct OSC
{
    SensorOscSend sender;
};

#endif /* defined(__Fuchair_2_0__SensorOscSend__) */