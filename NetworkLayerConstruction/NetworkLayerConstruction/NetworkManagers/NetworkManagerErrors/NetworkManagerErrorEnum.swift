//
//  NetworkManagerErrorEnum.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 2/27/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

enum NetworkManagerError: Error {
    
    case badRequest
    case noImageData
    case badImageData
    case networkError(Error, URLResponse?)
              
}
