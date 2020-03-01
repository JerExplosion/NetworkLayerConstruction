//
//  ServiceConfiguration.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 2/27/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
     
public protocol ServiceConfiguration {
    
    var baseURL: String { get }
    var scheme: HTTPProtocols? { get }
    var endPoint: String? { get }
    var method: HTTPActions { get }
    var parameters: [URLQueryItem]? { get }
    var body: Data? { get }
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeOut: TimeInterval { get }
    var headers: [String: String]? { get }
    
}

extension ServiceConfiguration {
    
    func toRequest() -> URLRequest? {
        
        var stringURL = ""
        if let schemeValue = self.scheme?.rawValue {
            stringURL += schemeValue + "://"
        }
        stringURL += baseURL
             
        if let unwrappedEndpoint = self.endPoint {
            stringURL += unwrappedEndpoint
        }
        
        if var uRLComponents = URLComponents(string: stringURL), let parameters = self.parameters {
            uRLComponents.queryItems = parameters
            stringURL = uRLComponents.string ?? stringURL
        }  // this part may be a bit confusing
         
        guard let serviceURL = URL(string: stringURL) else { return nil }
        
        var request = URLRequest(url: serviceURL, cachePolicy: self.cachePolicy, timeoutInterval: self.timeOut)
        
        request.httpBody = self.body
        request.allHTTPHeaderFields = self.headers
        request.httpMethod = self.method.rawValue
        
        return request
    }
}
