//
//  PaymentViewController.swift
//  FinalProject
//
//  Created by Ezgi Koç on 18.05.2018.
//  Copyright © 2018 Ezgi Koç. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {
    var x = OrderModel()
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    @IBOutlet weak var securityNumber: UITextField!
    @IBOutlet weak var txtprice: UILabel!
    
    var button = UIButton(frame: CGRect(x:20, y:620 , width: 50, height:40))
    var  image = UIImage(named: "contact") as UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbvc = self.tabBarController as! orderViewController
        x = tbvc.x
       
        button.setImage(image, for: .normal)
        
        button.addTarget(self, action: #selector(PaymentViewController.didTapGoogle), for: .touchUpInside)
        self.view.addSubview(button)
        totalPrice()
        save()
        
    }

   
    func totalPrice() -> String {
        
        if(x.city1.text == "Istanbul" && x.city2.text == "Ankara"){
          txtprice.text! = String(Int(x.q9())!*50)
          return txtprice.text!
        }
        if(x.city1.text == "Ankara" && x.city2.text == "Istanbul"){
           txtprice.text! = String(Int(x.q9())!*55)
           return txtprice.text!
        }
        
        if(x.city1.text == "Istanbul" && x.city2.text == "London"){
          txtprice.text! = String(Int(x.q9())!*160)
          return txtprice.text!
        }
        if(x.city1.text == "London" && x.city2.text == "Istanbul"){
           txtprice.text! = String(Int(x.q9())!*150)
          return txtprice.text!
        }
        
        if(x.city1.text == "Paris" && x.city2.text == "London"){
           txtprice.text! = String(Int(x.q9())!*140)
           return txtprice.text!
        }
        if(x.city1.text == "London" && x.city2.text == "Paris"){
            txtprice.text! = String(Int(x.q9())!*300)
            return txtprice.text!
        }
        if(x.city1.text == "Amsterdam" && x.city2.text == "Los Angeles"){
           txtprice.text! = String(Int(x.q9())!*250)
            return txtprice.text!
        }
        if(x.city1.text == "Los Angeles" && x.city2.text == "Amsterdam"){
            txtprice.text! = String(Int(x.q9())!*275)
            return txtprice.text!
        }
        
        if(x.city1.text == "Izmir" && x.city2.text == "Bodrum"){
           txtprice.text! = String(Int(x.q9())!*30)
            return txtprice.text!
        }
        if(x.city1.text == "Bodrum" && x.city2.text == "Izmir"){
          txtprice.text! = String(Int(x.q9())!*35)
          return txtprice.text!
        }
        
        if(x.city1.text == "Istanbul" && x.city2.text == "Los Angeles"){
          txtprice.text! = String(Int(x.q9())!*213)
        return txtprice.text!
        }
        if(x.city1.text == "Los Angeles" && x.city2.text == "Istanbul"){
          txtprice.text! = String(Int(x.q9())!*215)
        return txtprice.text!
        }
        
        if(x.city1.text == "Paris" && x.city2.text == "Roma"){
        txtprice.text! = String(Int(x.q9())!*195)
        return txtprice.text!
        }
        if(x.city1.text == "Roma" && x.city2.text == "Paris"){
        txtprice.text! = String(Int(x.q9())!*200)
        return txtprice.text!
            
        }
        
        if(x.city1.text == "Ankara" && x.city2.text == "Izmir"){
          txtprice.text! = String(Int(x.q9())!*65)
          return txtprice.text!
        }
        if(x.city1.text == "Izmir" && x.city2.text == "Ankara"){
         txtprice.text! = String(Int(x.q9())!*80)
        return txtprice.text!
        }
    
        return ""
        
    }
    
    
     var result = " "
    @IBAction func btnPayment(_ sender: UIButton) {
       
        
        result  = "Name & Surname : " + cardName.text! + "\n" + "From : " + x.q1() + "\n" + "To : " + x.q2() + "\n" + "Date : " + x.q3() + "\n" + 
            "Passenger Number : " + x.q9()
        
        if(cardName.text == ""){
            if(cardNumber.text == ""){
                if(securityNumber.text == ""){
            
            let alert = UIAlertController(title: "!!!", message: "Card number or name on card or security number is wrong", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
                }
            }
            
        }
        else{
        let alert = UIAlertController(title: "Thank You!", message: "Your payment was successful.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
        }
        save()
        }
    
    @IBAction func didTapGoogle(sender: AnyObject) {
        UIApplication.shared.openURL(URL(string: "http://www.google.com")!)
    
    }

    
   
   func save(){
        let savePath = "Users/ezgikoc/Desktop/info.txt"
        do{
            try result.write(toFile: savePath, atomically: true, encoding: String.Encoding.utf8)
        }
        catch let errr as NSError {
            print(errr)
        }
    }
    
}
