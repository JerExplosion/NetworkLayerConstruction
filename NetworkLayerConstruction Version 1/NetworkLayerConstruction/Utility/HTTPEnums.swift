//
//  HTTPEnums.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 2/27/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

public enum HTTPActions: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case delete = "DELETE"
    case put = "PUT"
}

public enum HTTPProtocols: String {
    case https = "HTTPS"
    case HTTP = "HTTP"
}
