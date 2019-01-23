//
//  Photo.swift
//  MVVMSample
//
//  Created by Shantanu Dutta on 23/01/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import Foundation
struct Photos: Codable {
    let photos: [Photo]
}

struct Photo: Codable {
    let id: Int
    let name: String
    let description: String?
    let created_at: Date
    let image_url: String
    let for_sale: Bool
    let camera: String?
}
