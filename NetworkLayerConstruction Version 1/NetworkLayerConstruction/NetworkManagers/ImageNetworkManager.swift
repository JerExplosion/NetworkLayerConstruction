//
//  ImageNetworkManager.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 2/27/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

extension URLSession {
    
    func startTask(with configuration: ServiceConfiguration, _ completionHandler:
        ((UIImage?, Error?) -> Void)?) {
                
        do {
            let request = try self.getValidRequest(configuration: configuration)
            self.dataTask(with: request) { [unowned self](data, response, error) in
                do {
                    try self.checkNoError(error: error, with: response)
                    let validData = try self.getValidData(data: data)
                    let validImage = try self.getValidImage(data: validData)
                    completionHandler?(validImage, nil)
                    
                } catch let parsingError {
                    completionHandler?(nil, parsingError)
                }
            }.resume()
            
        } catch let requestError {
                     completionHandler?(nil, requestError)
        }
    }
           
    private func checkNoError(error: Error?, with response: URLResponse?) throws {
        guard let unwrappedError = error else { return }
        throw NetworkManagerError.networkError(unwrappedError, response)
    }
    
    private func getValidImage(data: Data) throws -> UIImage {
        guard let validImage = UIImage(data: data) else {
            throw NetworkManagerError.badImageData
        }
        return validImage
    }
    
    private func getValidData(data: Data?) throws -> Data {
        guard let validData = data else {
            throw NetworkManagerError.badImageData
        }
        return validData
    }

    private func getValidRequest(configuration: ServiceConfiguration) throws -> URLRequest {
        guard let validRequest = configuration.toRequest() else {
            throw NetworkManagerError.badRequest
        }
        return validRequest
    }
    
}
