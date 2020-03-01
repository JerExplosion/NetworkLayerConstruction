//
//  BasicImageConfiguration.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 3/1/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

               
public struct BasicImageTransaction: ServiceConfiguration {
    
    public var baseURL: String {
        return self.url
    }
    
    public var scheme: HTTPProtocols? {
        return nil
    }
    
    public var endPoint: String? {
        return nil
    }
    
    public var method: HTTPActions {
        return .get
    }
    
    public var parameters: [URLQueryItem]? {
        return nil
    }
    
    public var body: Data? {
        return nil
    }
    
    public var cachePolicy: URLRequest.CachePolicy {
        return self.parameterCachePolicy
    }
    
    public var timeOut: TimeInterval {
        return self.parameterTimeout
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    
    private let url: String
    private let parameterCachePolicy: URLRequest.CachePolicy
    private let parameterTimeout: TimeInterval
       
    public init(url: String, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 30) {
        
        self.url = url
        self.parameterCachePolicy = cachePolicy
        self.parameterTimeout = timeout
        
    }
    
}
