//
//  PhotoDetailViewController.swift
//  MVVMSample
//
//  Created by Shantanu Dutta on 23/01/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var imageUrl: String?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageUrl = imageUrl {
            imageView.sd_setImage(with: URL(string: imageUrl)) { (image, error, type, url) in
                
            }
        }
        
    }
}
