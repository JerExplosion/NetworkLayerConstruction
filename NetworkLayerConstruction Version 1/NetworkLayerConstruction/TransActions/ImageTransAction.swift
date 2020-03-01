//
//  ImageTransAction.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 2/27/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

public struct ImageTransaction {
    
    let configuration: ServiceConfiguration
    
    public init(configuration: ServiceConfiguration) {
        self.configuration = configuration
    }
    
    public func getImage(_ completionHandler: ((UIImage?, Error?) -> Void)?) {
        URLSession.shared.startTask(with: self.configuration, completionHandler)
    }
    
}
