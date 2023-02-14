//
//  URLRequest+Helper.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//


import Alamofire

extension URLRequest {
    public init?(baseURL: URL,
                 urlString: String,
                 method: Alamofire.HTTPMethod,
                 parameters: Parameters?,
                 headers: HTTPHeaders) {
        self.init(url: URL(string: "\(baseURL.absoluteString)\(urlString)")!)
        
        setValue("application/json", forHTTPHeaderField: "Content-Type")

        self.headers = headers
        httpMethod = method.rawValue
        do {
            if let parameter = parameters as Any? {
                httpBody = try JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
            }
        } catch {
            debugPrint(error)
        }
    }
}


