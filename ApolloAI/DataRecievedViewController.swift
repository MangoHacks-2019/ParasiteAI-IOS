//
//  DataRecievedViewController.swift
//  ApolloAI
//
//  Created by Luis F. Perrone on 2/2/19.
//  Copyright © 2019 Luis Perrone. All rights reserved.
//

import UIKit
import Lottie

class DataRecievedViewController: UIViewController {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var infectedLabel: UILabel!
    @IBOutlet weak var skinSampleImageView: UIImageView!
    var infectedResponse = ""
    var skinSampleImage: UIImage!
    
    @IBAction func buttonAction(_ sender: Any) {
        switch (sender as! UIButton).tag {
            case 0:
                backTwo()
                break
            case 1:
                let viewController = UIStoryboard.viewControllerMain(identifier: "PatientDiagnosticViewController") as! PatientDiagnosticViewController
                viewController.result = infectedResponse
                self.present(viewController, animated: true, completion: nil)
                break
            case 2:
                backTwo()
                break
            default:
                break
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.style
    }
    var style:UIStatusBarStyle = .default

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.style = .lightContent
        setNeedsStatusBarAppearanceUpdate()
        prepareLayout()

        // Do any additional setup after loading the view.
    }
    
    func prepareLayout() {
        cardView.layer.cornerRadius = 8.0
        cardView.layer.masksToBounds = false
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 6
        cardView.layer.shadowOpacity = 0.30
        cardView.layer.shadowOffset = CGSize(width: -4, height: 8)
        skinSampleImageView.image = skinSampleImage
        infectedLabel.text = infectedResponse
    }
    
    func backTwo() {
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: nil)
        self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
