//
//  queries.swift
//  HKTutorial
//
//  Created by Joey on 5/10/16.
//  Copyright © 2016 raywenderlich. All rights reserved.
//

import Foundation
import HealthKit

let stepsCount = HKQuantityType.quantityTypeForIdentifier(
  HKQuantityTypeIdentifierStepCount)

let stepsSampleQuery = HKSampleQuery(sampleType: stepsCount!,
                                     predicate: nil,
                                     limit: 100,
                                     sortDescriptors: nil)
{ [unowned self] (query, results, error) in
  if let results = results as? [HKQuantitySample] {
    self.steps = results
    self.tableView.reloadData()
  }
  self.activityIndicator.stopAnimating()
}

// Don't forget to execute the Query!
healthStore?.executeQuery(stepsSampleQuery)