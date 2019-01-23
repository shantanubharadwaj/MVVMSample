//
//  APIServices.swift
//  MVVMSample
//
//  Created by Shantanu Dutta on 23/01/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import Foundation

enum APIError: String, Error {
    case noNetwork = "No network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
}

typealias PhotoResponseHandler = ( _ success: Bool, _ photos: [Photo], _ error: APIError? )->()

protocol APIServiceProtocol {
    func fetchPhoto(complete: @escaping PhotoResponseHandler )
}

class APIService: APIServiceProtocol {
    func fetchPhoto(complete: @escaping (Bool, [Photo], APIError?) -> ()) {
        DispatchQueue.global().async {
            sleep(2)
            if let path = Bundle.main.path(forResource: "content", ofType: "json"), let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let photos = try? decoder.decode(Photos.self, from: data){
                    complete(true, photos.photos, nil)
                }
                
            }
        }
    }
}
