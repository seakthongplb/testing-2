//
//  APIManager.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import Alamofire

class APIManager: NSObject, Configuration {
    private let networkManager: Session
    private let accessToken: String?
    
    override init() {
        networkManager = SessionManagerBuilder.Manager
        accessToken = MyKeychain.string(forKey: .accessToken)
    }
    
    func performRequest(requestBuilder: RequestBuilderProtocol,
                        responseParser: ResponseParserProtocol) {
        
        let method = requestBuilder.method
        let parameters = requestBuilder.parameters
        let encoding = requestBuilder.encoding

        var headers = HTTPHeaders.default
        headers["devide-id"] = UIDevice.current.identifierForVendor?.uuidString
        headers["lang"] = "en"
        headers["Content-Type"] = "application/json"
        
        if let accessToken = accessToken {
            headers["token"] = accessToken
        }
        
        guard let baseURL = URL(string: baseUrl) else { return }
        
        if let header = requestBuilder.header {
            header.forEach { (key,value) in headers[key] = value }
        }
        
        guard let urlRequest = URLRequest(baseURL: baseURL,
                                          urlString: requestBuilder.path,
                                          method: method,
                                          parameters: parameters,
                                          headers: headers) else { return }
        
        networkManager.request(urlRequest).responseJSON { response in            self.parse(responseParser: responseParser, response: response)
        }
    }
    
    private func parse(responseParser: ResponseParserProtocol,
                       response: AFDataResponse<Any>) {
        switch response.result {
        case .success(let json):
//            guard let jsonData = json as? [String: Any] else {
//                return
//            }
            // MARK: - Below Code to check the token which is ACCESS_DENIED OR ERROR_TOKEN
//            if responseParser.handleInvalidToken(errorCode: jsonData["error_code"]) {
//                return
//            }
            
            responseParser.parse(json: json)
        case .failure(let error):
            responseParser.handleError(error: error)
        }
    }
}
