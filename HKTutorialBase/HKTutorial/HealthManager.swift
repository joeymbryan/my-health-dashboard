//
//  HealthManager.swift
//  HKTutorial
//
//  Created by ernesto on 18/10/14.
//  Copyright (c) 2014 raywenderlich. All rights reserved.
//

import Foundation
import HealthKit

class HealthManager {
  
  let healthKitStore : HKHealthStore = HKHealthStore()
  
  func authorizeHealthKit(completion: ((success:Bool, error:NSError!) -> Void)!) {
    // What we want to read
    let healthKitTypesToRead = Set(arrayLiteral:
      HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)!,
      HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDistanceWalkingRunning)!,
      HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierFlightsClimbed)!
    )
    
    // Checking if healthkit is available
    if !HKHealthStore.isHealthDataAvailable() {
      let error = NSError(domain: "com.mpc.Health", code: 2, userInfo: [NSLocalizedDescriptionKey:"HealthKit is not available in this Device"])
      if( completion != nil )
      {
        completion(success:false, error:error)
      }
      return;
    }
    
    //Requesting the authorization
    healthKitStore.requestAuthorizationToShareTypes(nil, readTypes: healthKitTypesToRead) { (success, error) -> Void in
      if( completion != nil )
      {
        completion(success:success,error:error)
      }
    }
  }
  class var sharedInstance: HealthManager {
    struct Singleton {
      static let instance = HealthManager()
    }
    
    return Singleton.instance
  }
  let stepsCount = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierStepCount)
  
  let stepsUnit = HKUnit.countUnit()
}