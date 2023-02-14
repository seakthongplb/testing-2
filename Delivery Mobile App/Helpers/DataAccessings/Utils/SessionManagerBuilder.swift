//
//  SessionManagerBuilder.swift
//  Delivery Mobile App
//
//  Created by Seakthong Aing on 6/14/21.
//

import Alamofire

struct Certificates {
  static let stackExchange =
    Certificates.certificate(filename: "uatsandbox.sathapana.com.kh")
  
  private static func certificate(filename: String) -> SecCertificate {
    let filePath = Bundle.main.path(forResource: filename, ofType: "der")!
    let data = try! Data(contentsOf: URL(fileURLWithPath: filePath))
    let certificate = SecCertificateCreateWithData(nil, data as CFData)!
    
    return certificate
  }
}

class SessionManagerBuilder {
    // Create the server trust policies
    static var Manager: Session = {
        // Create custom manager
        let configuration = URLSessionConfiguration.default
        
        let evaluators = [
          "uatsandbox.sathapana.com.kh":
            PinnedCertificatesTrustEvaluator(certificates: [
              Certificates.stackExchange
            ])
        ]
        let manager = Session(
//            serverTrustManager: ServerTrustManager(allHostsMustBeEvaluated: false, evaluators: [:])
            configuration: configuration,
            serverTrustManager: ServerTrustManager(evaluators: evaluators)
        )
        return manager
    }()
}
