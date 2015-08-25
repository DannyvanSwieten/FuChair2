//
//  APAudioSensorProcessor.cpp
//  FuChair
//
//  Created by Danny van Swieten on 10/9/14.
//
//

#include "APAudioSensorProcessor.h"

APAudioSensorProcessor::APAudioSensorProcessor()
{
    
}

APAudioSensorProcessor::~APAudioSensorProcessor()
{
    
}

float APAudioSensorProcessor::getAcceleration()
{
    return _sensor.getAccelerometerData()->z;
}

float APAudioSensorProcessor::getAngle()
{
    _mutex.lock();
    
    float roll;
    float pitch;
    float yaw;
    
    float x = _sensor.getAccelerometerData()->x;
    float y = _sensor.getAccelerometerData()->y;
    float z = _sensor.getAccelerometerData()->z;
    
    float x2 = x*x;
    float y2 = y*y;
    float z2 = z*z;
    
    float xResult = sqrt(y2 + z2);
    pitch = atan2(-x, xResult);
    roll = atan2(y, z);
    
    _mutex.unlock();
    return roll;
}