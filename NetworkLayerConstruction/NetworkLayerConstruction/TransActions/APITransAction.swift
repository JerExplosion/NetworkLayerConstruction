//
//  APITransAction.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 2/27/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

  
public struct APITransaction<T: Decodable> {
    
    let configuration: ServiceConfiguration
    
    public init(configuration: ServiceConfiguration) {
        self.configuration = configuration
    }
       
    public func startService(_ completionHandler: ((T?, Error?) -> Void)?) {
        URLSession.shared.startTask(with: configuration, completionHandler)
    }
}
           
