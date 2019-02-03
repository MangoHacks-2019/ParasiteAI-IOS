//
//  APIFunctions.swift
//  ApolloAI
//
//  Created by Luis F. Perrone on 2/2/19.
//  Copyright © 2019 Luis Perrone. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIFunctions {

 
    static func isInfectedRequest(url: String, completionHandler: @escaping  (_ success:Bool, _ predictResponse: String?) -> ()) {
        let request = Alamofire.request("https://quickstart-230415.appspot.com/predict?image=" + url)
        request.validate()
        request.responseJSON { response in
            response.result.ifSuccess {
                if let value = response.result.value {
                    let json = JSON(value)
                    print(json)

                    if let predictResponse = json["predict"].string {
                        completionHandler(true, predictResponse)
                    }
                }
            }

            response.result.ifFailure {
                print("ERR \(response)")
                completionHandler(false, "")
            }

        }
    }
//
//    // Perform Upload SkinSample API Function
//    private static func performUpload(image: UIImage, postURL: String, getURL: String, completionHandler: @escaping (_ success:Bool, _ getURL:String?) -> ()) {
//        if let imageData = image.jpegData(compressionQuality: 0.5) { // 0.1 for high compression
//            print("Uploading! Hang in there...")
//            let request = Alamofire.upload(imageData, to: postURL, method: .put, headers: ["Content-Type":"image/jpeg"])
//            request.validate(statusCode: 200..<600)
//            request.responseString { response in
//
//                guard response.result.value != nil else {
//                    print("Request failed with error")
//                    print(response)
//                    DispatchQueue.main.async {
//                        completionHandler(false, getURL)
//                    }
//                    return
//                }
//
//                DispatchQueue.main.async {
//                    completionHandler(true, getURL)
//                }
//            }
//        }
//
//    }
}
