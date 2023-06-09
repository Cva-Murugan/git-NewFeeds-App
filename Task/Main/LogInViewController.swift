//
//  SignUpViewController.swift
//  Task
//
//  Created by Novastrid on 05/06/23.
//

import UIKit
import Alamofire

class LogInViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var PswdTextField: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    
    @IBOutlet var passwordError: UILabel!
    
    var status = false
    
    override func viewDidLoad() {
  
        super.viewDidLoad()
        emailTextField.delegate = self
        PswdTextField.delegate = self
        
//        UserDefaults.standard.removeObject(forKey: "status")
//        UserDefaults.standard.removeObject(forKey: "loginStatus")
//        authentication()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        passwordError.isHidden = true
        emailError.isHidden = true
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//       let val = UserDefaults.standard.value(forKey: "loginStatus")
//        print(val!)
//    }
    
    func isValidMailInput(input: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: input)
    }
    
    public func isValidPassword(password: String) -> Bool {
//            let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
            let passwordRegex = "^(?=.*\\d)(?=.*[a-z])[0-9a-z]{8,}$"
            return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
        }
    
    
    func fieldEmptyError(){
        passwordError.text = "Enter Password"
        emailError.text = "Enter Email"
        
        passwordError.isHidden = false
        emailError.isHidden = false
    }
    
    func emailFieldempty(){
        emailError.text = "Enter Email"
        emailError.isHidden = false
    }
    func pswdfieldempty(){
        passwordError.text = "Enter Password"
        passwordError.isHidden = false
    }
    func validEmail(){
        emailError.text = "Enter valid Email Id"
        emailError.isHidden = false
    }
    func validPassword(){
        passwordError.text = "Enter valid Password"
        passwordError.isHidden = false
    }

    
    @IBAction func logInBtnTap(_ sender: Any) {
        if let email = emailTextField.text, let password = PswdTextField.text{
            if email == "" && password == ""{
                fieldEmptyError()
            }else if email == "" {
                validEmail()
            }else if password == "" {
                pswdfieldempty()
            }else if !isValidMailInput(input: email) {
                validEmail()
            }else if !isValidPassword(password: password) {
                validPassword()
            }else if isValidPassword(password: password) && isValidMailInput(input: email) {
                authentication()
            }
        }
    }
    

    func navigation(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainVc")
        
        self.navigationController?.pushViewController(storyBoard, animated: true)
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField{
            emailError.isHidden = true
        }else if textField == PswdTextField {
            passwordError.isHidden = true
        }
    }
    

    
    func values(){
        print("\(PswdTextField.text!)")
        print("\(emailTextField.text!)")
    }
    
    func authentication(){
        
        let params: Parameters = [
            "app_name" : "rep_app",
            "device": "Web",
            "deviceType": "Laptop / Desktop - ( Chrome (113.0.0.0) )",
            "email" : "\(emailTextField.text!)",
            "password" : "\(PswdTextField.text!)",
            "time_zone" : "Asia/Calcutta"
            ]

        AF.request("https://salixv3core.radiusdirect.net/coreapi/v2/userlogin", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            switch response.result {
                case .success(let data):
                    do {
                        guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                            print("Error: Cannot convert data to JSON object")
                            return
                        }
                        
                        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                            print("Error: Cannot convert JSON object to Pretty JSON data")
                            return
                        }
                        
                        guard let _ = String(data: prettyJsonData, encoding: .ascii) else {
                            print("Error: Could print JSON in String")
                            return
                        }
                
                        let apiData = MainModel(fromDictionary: jsonObject)
                        if apiData.apiStatus {
                            
                            // navigation to mainviewController
                            self.navigation()
    
                            //
                            ApiValues.loginStaus = apiData.apiStatus as Bool
                            UserDefaults.standard.set(ApiValues.loginStaus, forKey: "logIn_status")
                            
                            ApiValues.token = apiData.token as String
                            // store token value in userdefaults
                            UserDefaults.standard.set(ApiValues.token!, forKey: "Token")
                        }
                        
                    } catch {
                        print("Error: Trying to convert JSON data to string")
                        return
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    static func shareInstance() -> UIViewController{
        let vc = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "logInVc") as! LogInViewController

        return vc
    }
}
