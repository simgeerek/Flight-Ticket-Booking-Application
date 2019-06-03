//
//  RegisterViewController.swift
//  FinalProject
//
//  Created by Ezgi Koç on 19.05.2018.
//  Copyright © 2018 Ezgi Koç. All rights reserved.
//

import UIKit
import CoreData
class RegisterViewController: UIViewController {
    
    var peop = [NSManagedObject]()
    
    @IBOutlet weak var RegPassword: UITextField!
    @IBOutlet weak var RegEmail: UITextField!
    
    
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btnEnter(_ sender: UIButton) {
      
        if((RegEmail.text?.isEmpty)! || (RegPassword.text?.isEmpty)! )
        {
            
            let alert = UIAlertController(title: "!!!", message: "Please fill in the required places", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            return;
        }
        let managedContext = appDelegate?.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Reg", in: managedContext!)!
        let per = NSManagedObject(entity: entity, insertInto: managedContext)
        
        
        per.setValue(RegPassword.text, forKey: "password")
        per.setValue(RegEmail.text, forKey: "email")
        var myAlert = UIAlertController(title:"Message", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){ action in
            self.dismiss(animated: true, completion:nil)
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
        do{
            try managedContext?.save()
            peop.append(per)
            print(peop)
            
        }
        catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
    
    
    
  

  
}
