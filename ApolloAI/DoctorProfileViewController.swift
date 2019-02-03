//
//  DoctorProfileViewController.swift
//  ApolloAI
//
//  Created by Luis F. Perrone on 2/2/19.
//  Copyright © 2019 Luis Perrone. All rights reserved.
//

import UIKit
import EightBase

class DoctorProfileViewController: UIViewController {
    @IBOutlet weak var doctorNameLabel: UILabel!
    @IBOutlet weak var doctorImageView: UIImageView!
    @IBOutlet weak var doctorImageBGView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var malayriaDetectorButton: UIButton!
    
    @IBOutlet weak var firstPatient: UIButton!
    @IBOutlet weak var secondPatient: UIButton!
    @IBOutlet weak var thirdPatient: UIButton!
    @IBOutlet weak var fourthPatient: UIButton!
    @IBOutlet weak var fifthPatient: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.style
    }
    var style:UIStatusBarStyle = .lightContent
    
    @IBAction func buttonAction(_ sender: Any) {
        
        switch ((sender as! UIButton).tag) {
        case 0:
            let viewController = UIStoryboard.viewControllerMain(identifier: "CameraViewController") as! ViewController
            self.present(viewController, animated: true, completion: nil)
            break
        case 1:
            break
        case 2:
            mostRecentQuery(first: 5)
            EightBase.Apollo?.clearCache()
            viewDidLayoutSubviews()
            print("Im HERE!! :D")
            break
        default:
            break
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayout()
        setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mostRecentQuery(first: 5)
        EightBase.Apollo?.clearCache()
    }
    
    func prepareLayout() {
        cardView.layer.cornerRadius = 8.0
        cardView.layer.masksToBounds = false
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 6
        cardView.layer.shadowOpacity = 0.30
        cardView.layer.shadowOffset = CGSize(width: -4, height: 8)
        
        doctorImageBGView.layer.cornerRadius = 60
        doctorImageBGView.layer.masksToBounds = false
        doctorImageBGView.layer.shadowColor = UIColor.black.cgColor
        doctorImageBGView.layer.shadowRadius = 6
        doctorImageBGView.layer.shadowOpacity = 0.30
        doctorImageBGView.layer.shadowOffset = CGSize(width: -4, height: 8)
        
        doctorImageView.layer.cornerRadius = 57.5
        doctorImageView.layer.masksToBounds = true
        
        malayriaDetectorButton.layer.cornerRadius = 6.0
        malayriaDetectorButton.layer.masksToBounds = false
        malayriaDetectorButton.layer.shadowColor = UIColor.black.cgColor
        malayriaDetectorButton.layer.shadowRadius = 6
        malayriaDetectorButton.layer.shadowOpacity = 0.30
        malayriaDetectorButton.layer.shadowOffset = CGSize(width: -4, height: 8)

        
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

extension DoctorProfileViewController {
    
    func mostRecentQuery(first: Int) {
        //        activityIndicator.startAnimating()
        
        // 1
        let patientsListQuery = PatientsListQuery(first: first, orderBy: [PatientOrderBy.createdAtDesc])
        
        // 2
        EightBase.Apollo?.fetch(query: patientsListQuery) { (result, error) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // 3
            
            let res1: String! = result?.data?.patientsList.items[0].pname!
            let res2: String! = result?.data?.patientsList.items[0].result!
            self.firstPatient.setTitle( res1 + ": " + res2, for: .normal)
            
            let res3: String! = result?.data?.patientsList.items[1].pname!
            let res4: String! = result?.data?.patientsList.items[1].result!
            self.secondPatient.setTitle( res3 + ": " + res4, for: .normal)
            
            let res5: String! = result?.data?.patientsList.items[2].pname!
            let res6: String! = result?.data?.patientsList.items[2].result!
            self.thirdPatient.setTitle( res5 + ": " + res6, for: .normal)
            
            let res7: String! = result?.data?.patientsList.items[3].pname!
            let res8: String! = result?.data?.patientsList.items[3].result!
            self.fourthPatient.setTitle( res7 + ": " + res8, for: .normal)
            
            let res9: String! = result?.data?.patientsList.items[4].pname!
            let res10: String! = result?.data?.patientsList.items[4].result!
            self.fifthPatient.setTitle( res9 + ": " + res10, for: .normal)
         
         
            print(result)
            
        }
    }
}
