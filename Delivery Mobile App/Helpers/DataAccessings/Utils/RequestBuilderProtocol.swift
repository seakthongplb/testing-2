//
//  RequestBuilderProtocol.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import Alamofire

protocol RequestBuilderProtocol {
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var header: [String: String]? { get }
}

extension RequestBuilderProtocol {
    var method: Alamofire.HTTPMethod {
        return .post
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var header: [String: String]? {
        return nil
    }
}

protocol URLQueryRequestBuilderProtocol: RequestBuilderProtocol { }

extension URLQueryRequestBuilderProtocol {
    var method: Alamofire.HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding()
    }
    
    var parameters: Parameters? {
        return nil
    }
    
    var header: [String: String]? {
        return nil
    }
}
