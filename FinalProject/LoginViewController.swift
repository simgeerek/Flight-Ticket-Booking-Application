//
//  LoginViewController.swift
//  FinalProject
//
//  Created by Ezgi Koç on 19.05.2018.
//  Copyright © 2018 Ezgi Koç. All rights reserved.
//

import UIKit
import CoreData
class LoginViewController: UIViewController {
     var peop = [NSManagedObject]()
     let appDelegate = UIApplication.shared.delegate as? AppDelegate
   
    @IBOutlet weak var logEmail: UITextField!
    @IBOutlet weak var logPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Reg")
        
        
        
        do{
            let request = try managedContext?.fetch(fetchRequest)
            for p in request! {
                
                
                print(p.value(forKey: "email")as? String)
                
                
                if  p.value(forKey: "email") as? String == logEmail.text {
                 if   p.value(forKey: "password") as? String == logPassword.text{
                 
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "lgn")
                    self.present(newViewController, animated: true, completion: nil)
                    
                    
                    
                    }
                    
                }
        }
        }
        
       
            
            
        catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        
        
    }
  
    

   
}
