//
//  PatientDiagnosticViewController.swift
//  ApolloAI
//
//  Created by Luis F. Perrone on 2/2/19.
//  Copyright © 2019 Luis Perrone. All rights reserved.
//

import UIKit
import EightBase

class PatientDiagnosticViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var responseLabel: UILabel!
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var patientsNameInput: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    var currentUserID: String!
    var currentUserName: String!
    var result: String = ""
    
    @IBAction func ButtonAction(_ sender: Any) {
        if (patientsNameInput.text != "") {
            createPatient(name: patientsNameInput!.text!, result: result)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLayout()
        self.patientsNameInput.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func prepareLayout() {
        cardView.layer.cornerRadius = 8.0
        cardView.layer.masksToBounds = false
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 6
        cardView.layer.shadowOpacity = 0.30
        cardView.layer.shadowOffset = CGSize(width: -4, height: 8)
        
        submitButton.layer.cornerRadius = 6.0
        submitButton.layer.masksToBounds = false
        submitButton.layer.shadowColor = UIColor.black.cgColor
        submitButton.layer.shadowRadius = 6
        submitButton.layer.shadowOpacity = 0.30
        submitButton.layer.shadowOffset = CGSize(width: -4, height: 8)
        responseLabel.text = "Response: \(result)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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

extension PatientDiagnosticViewController {
    
    func createPatient(name: String, result: String) {
//        activityIndicator.startAnimating()
        
        // 1
        let createPatientMutation = CreatePatientMutation(pname: name, result: result)
        
        // 2
        EightBase.Apollo!.perform(mutation: createPatientMutation) { [weak self] result, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            // 3
            self!.currentUserID = result?.data?.patientCreate.id!
            self!.currentUserName = result?.data?.patientCreate.pname!
            print(result)
            self!.backTwo()
            
        }
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
    
}
