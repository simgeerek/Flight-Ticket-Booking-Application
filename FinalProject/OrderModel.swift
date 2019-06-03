//
//  OrderModel.swift
//  FinalProject
//
//  Created by Ezgi Koç on 12.05.2018.
//  Copyright © 2018 Ezgi Koç. All rights reserved.
//

import UIKit
import CoreData
class OrderModel: NSObject {
   
   
    var city1 = UITextField(frame : CGRect(x:120 , y:100 , width: 160, height : 60))
    var city2 = UITextField(frame : CGRect(x:120 , y:180 , width: 160, height : 60))
    var date = UITextField(frame : CGRect(x:120 , y:260 , width: 160, height : 60))
    var passenger = UITextField(frame : CGRect(x:120 , y:340 , width: 160, height : 60))
    var label = UILabel(frame : CGRect(x:120 , y:10 , width: 200, height : 20))
    var label2 = UILabel(frame : CGRect(x:120 , y:10 , width: 200, height : 20))
    var label3 = UILabel(frame : CGRect(x:120 , y:10 , width: 200, height : 20))
    var label4 = UILabel(frame : CGRect(x:120 , y:10 , width: 200, height : 20))
    var lbl = UILabel(frame : CGRect(x:120 , y:50 , width: 200, height : 20))
    var arrayButton = [UIButton!]()
   
    var buton = UIButton()
    var ima = UIImage(named: "pln") as! UIImage
    var ima2 = UIImage(named: "Plane") as! UIImage
    
    var labelTicket1 = UILabel(frame : CGRect(x:25 , y:10 , width: 100, height : 20))
    var labelTicket2 = UILabel(frame : CGRect(x:25 , y:110 , width: 100, height : 20))
    var labelTicket3 = UILabel(frame : CGRect(x:25 , y:210 , width: 100, height : 20))
    
    
    var textName = UITextField(frame : CGRect(x:100 , y:60 , width: 70, height : 20))
    var textLastName = UITextField(frame : CGRect(x:125 , y:5 , width: 70, height : 20))
    var textID = UITextField(frame : CGRect(x:340 , y:19 , width: 70, height : 20))
    
    
    func txtName() -> String{
        return textName.text!
    }
    
    func txtLastName() -> String{
        return textLastName.text!
    }
    
    func txtID() -> String{
        return textID.text!
    }
    
    func q1() -> String{
        return city1.text!
    }
    func q2() -> String{
        return city2.text!
    }
    func q3() -> String{
        return date.text!
    }
    func q4() -> String{
        return label.text!
    }
    func q5() -> String{
        return label2.text!
    }
    func q6() -> String{
        return label3.text!
    }
    func q7() -> String{
        return label4.text!
    }
    func q8() -> String{
        return lbl.text!
    }
    func q9() -> String{
        return passenger.text!
    }
}
