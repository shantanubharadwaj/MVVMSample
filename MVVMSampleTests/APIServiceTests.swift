//
//  APIServiceTests.swift
//  MVVMSampleTests
//
//  Created by Shantanu Dutta on 23/01/19.
//  Copyright © 2019 Shantanu Dutta. All rights reserved.
//

import XCTest
@testable import MVVMSample

class APIServiceTests: XCTestCase {

    var sut: APIService?
    
    override func setUp() {
        super.setUp()
        sut = APIService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetch_popular_photos() {
        
        // Given A apiservice
        let sut = self.sut!
        
        // When fetch popular photo
        let expect = XCTestExpectation(description: "callback")
        
        sut.fetchPhoto(complete: { (success, photos, error) in
            expect.fulfill()
            XCTAssertEqual( photos.count, 20)
            for photo in photos {
                XCTAssertNotNil(photo.id)
            }
            
        })
        
        wait(for: [expect], timeout: 3.1)
    }

}
