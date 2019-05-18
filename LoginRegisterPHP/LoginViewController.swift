//
//  LoginViewController.swift
//  LoginRegisterPHP
//
//  Created by MNA Developer on 13/05/2019.
//  Copyright © 2019 Naeem. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    
    let URLLoggin = "https://naeemakee.000webhostapp.com/login.php"
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func login(_ sender: UIButton) {
        

        //creating parameters for the post request
        let parameters: Parameters = [
            "Email":email.text!,
            "Password":password.text!
        ]
        
        //Sending http post request
        
        Alamofire.request(URLLoggin, method: .post, parameters: parameters, encoding: URLEncoding.default).responseString { response in
            print("String:\(response.result.value)")
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    let alert = UIAlertController(title: "😊", message: "\(data)", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            case .failure(_):
                print("Error message:\(response.result.error)")
                let alert = UIAlertController(title: "Sorry", message: "\(response.result.error)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                break
            }
        }
        
    }
    

}
