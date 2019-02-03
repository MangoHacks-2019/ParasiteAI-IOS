//
//  LoadingViewController.swift
//  ApolloAI
//
//  Created by Luis F. Perrone on 2/2/19.
//  Copyright © 2019 Luis Perrone. All rights reserved.
//

import UIKit
import Lottie
import AWSS3
import AWSCore

class LoadingViewController: UIViewController {
    @IBOutlet weak var lottieBGView: UIView!
    private var checkMarkAnimation: LOTAnimationView?
    var skinImage: UIImage!
    var infectedResponse = ""
    var viewOpened = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.style
    }
    
    func getSkinImageSample() -> UIImage {
        return skinImage
    }
    var style:UIStatusBarStyle = .default


    override func viewDidLoad() {
        super.viewDidLoad()
        self.style = .lightContent
        setNeedsStatusBarAppearanceUpdate()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (!viewOpened) {
            viewOpened = true
            checkMarkAnimation = LOTAnimationView(name: "world")
            checkMarkAnimation!.contentMode = .scaleAspectFill
            checkMarkAnimation!.frame = lottieBGView.bounds
            // Add the Animation
            lottieBGView.addSubview(checkMarkAnimation!)
            //        lottieBGView.sendSubview(toBack: boatAnimation!)
            checkMarkAnimation?.play{ (finished) in
                //self.playSuccessfulSound()
                let when = DispatchTime.now()  // change 2 to desired number of seconds
                DispatchQueue.main.asyncAfter(deadline: when) {
                    self.uploadImage()
                }
                // Do Something
            }
        }
        
        //        animationView.play(fromProgress: 0.25, toProgress: 0.5, withCompletion: nil)
        
    }
    
    // Upload SkinSample API Function
    func uploadImage() {
        let accessKey = "AKIAJSHDVJWHKHZW7YQA"
        let secretKey = "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"
        
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: accessKey, secretKey: secretKey)
        let configuration = AWSServiceConfiguration(region:AWSRegionType.USEast1, credentialsProvider:credentialsProvider)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        let S3BucketName = "apollo-ai"
        let remoteName = "test.jpg"
        let fileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(remoteName)
        let data = getSkinImageSample().jpegData(compressionQuality: 0.9)
        do {
            try data?.write(to: fileURL)
        }
        catch {}
        
        let uploadRequest = AWSS3TransferManagerUploadRequest()!
        uploadRequest.body = fileURL
        uploadRequest.key = remoteName
        uploadRequest.bucket = S3BucketName
        uploadRequest.contentType = "image/jpeg"
        uploadRequest.acl = .publicRead
        
        let transferManager = AWSS3TransferManager.default()
        
        transferManager.upload(uploadRequest).continueWith { [weak self] (task) -> Any? in
            DispatchQueue.main.async {
                //self?.uploadButton.isHidden = false
                //self?.activityIndicator.stopAnimating()
            }
            
            if let error = task.error {
                print("Upload failed with error: (\(error.localizedDescription))")
            }
            
            if task.result != nil {
                let url = AWSS3.default().configuration.endpoint.url
                let publicURL = url?.appendingPathComponent(uploadRequest.bucket!).appendingPathComponent(uploadRequest.key!)
                if let absoluteString = publicURL?.absoluteString {
                    // Api Request to jonas
                    // https://quickstart-230415.appspot.com/?image=
                    print("Uploaded to:\(absoluteString)")
                    APIFunctions.isInfectedRequest(url: absoluteString, completionHandler: { (res, message) in
                        
                        if (res) {
                            print(message!)
                            let viewController = UIStoryboard.viewControllerMain(identifier: "DataRecievedViewController") as! DataRecievedViewController
                            viewController.skinSampleImage = self!.skinImage
                            viewController.infectedResponse = message!
                            self!.present(viewController, animated: true, completion: nil)
                        } else {
                            print("Error")
                        }
                    
                        
                    })
                    
                }
            }
            
            return nil
        }
        
    }

}
