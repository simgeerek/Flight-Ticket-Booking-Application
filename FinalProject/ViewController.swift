//
//  ViewController.swift
//  FinalProject
//
//  Created by Ezgi Koç on 9.05.2018.
//  Copyright © 2018 Ezgi Koç. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
   
    
 
    var x = OrderModel()
    
  
   
    
    
  
    
    var citiesArray = cities(c: [" ","Istanbul" , "Ankara" , "Antalya" , "Paris" , "Roma" , "London", "Amsterdam" ,"Bodrum","Los Angeles" , "Izmir"], IstAnk: [" ","May 24 2018" , "May 28 2018" , "June 12 2018"], AnkIst: [" ","May 27 2018" , "June 01 2018" , "June 14 2018"], IstLon:[" ","May 29 2018" , "June 28 2018" , "July 22 2018"] , LonIst: [" ","june 06 2018" , "July 03 2018" , "August 01 2018"], ParLon: [" ","September 15 2018" , "October 16 2018" , "November 17 2018","February 18 2019"], LonPar: [" ","September 23 2018" , "October 24 2018" , "November 25 2018","February 27 2019"], AmsLos: [" ","June 03 2018" , "July 13 2018" , "September 23 2018"], LosAms: [" ","June 09 2018" , "July 19 2018" , "September 29 2018"], IzmBod: [" ","May 21 2018" , "June 08 2018" , "June 18 2018"], BodIzm: [" ","May 30 2018" , "June 15 2018" , "June 30 2018"], IstLos: [" ","August 17 2018" , "September 22 2018" , "November 25 2018"], LosIst: [" ","August 25 2018" , "September 27 2018" , "November 30 2018"], ParRom: [" ", "December 29 2018"], RomPar: [" ","January 07 2019"], AnkIzm: [" ", "December 05 2018" , "January 19 2019"], IzmAnk: [" ","December 14 2018" , "January 27 2019"], pass: [" ", "1", "2", "3", "4"])
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let tbvc = self.tabBarController as! orderViewController
         x = tbvc.x

        x.city1.inputView = pickerView1
        x.city2.inputView = pickerView2
        x.date.inputView = pickerViewDate
        x.passenger.inputView = pickerViewPass
        pickerView1.delegate = self
        pickerView2.delegate = self
        pickerViewDate.delegate = self
        pickerViewPass.delegate = self
        pickerView1.dataSource = self
        pickerView2.dataSource = self
        pickerViewDate.dataSource = self
        pickerViewPass.dataSource = self
        x.city1.textAlignment = .center
        x.city2.textAlignment = .center
        x.date.textAlignment = .center
        x.passenger.textAlignment = .center
        x.city1.placeholder = "From : City"
        x.city2.placeholder = "To : City"
        x.date.placeholder = "Date"
        x.passenger.placeholder = "Passenger Number"
        x.city1.borderStyle = UITextBorderStyle.roundedRect
        x.city2.borderStyle = UITextBorderStyle.roundedRect
        x.date.borderStyle = UITextBorderStyle.roundedRect
        x.passenger.borderStyle = UITextBorderStyle.roundedRect
        self.view.addSubview(x.city1)
        self.view.addSubview(x.city2)
        self.view.addSubview(x.date)
        self.view.addSubview(x.passenger)
        
    }
    @IBAction func button(_ sender: Any) {
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    var pickerView1 = UIPickerView()
    var pickerView2 = UIPickerView()
    var pickerViewDate = UIPickerView()
    var pickerViewPass = UIPickerView()

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
      
        if(pickerView == pickerViewDate){
            if(x.city1.text == "Istanbul" && x.city2.text == "Ankara"){
                return citiesArray.IstAnk.count
            }
            if(x.city1.text == "Ankara" && x.city2.text == "Istanbul"){
                return citiesArray.AnkIst.count
            }
            
            if(x.city1.text == "Istanbul" && x.city2.text == "London"){
                return citiesArray.IstLon.count
            }
            if(x.city1.text == "London" && x.city2.text == "Istanbul"){
                return citiesArray.LonIst.count
            }
            
            if(x.city1.text == "Paris" && x.city2.text == "London"){
                return citiesArray.ParLon.count
            }
            if(x.city1.text == "London" && x.city2.text == "Paris"){
                return citiesArray.LonPar.count
            }
            if(x.city1.text == "Amsterdam" && x.city2.text == "Los Angeles"){
                return citiesArray.AmsLos.count
            }
            if(x.city1.text == "Los Angeles" && x.city2.text == "Amsterdam"){
                return citiesArray.LosAms.count
            }
            
            if(x.city1.text == "Izmir" && x.city2.text == "Bodrum"){
                return citiesArray.IzmBod.count
            }
            if(x.city1.text == "Bodrum" && x.city2.text == "Izmir"){
                return citiesArray.BodIzm.count
            }
            
            if(x.city1.text == "Istanbul" && x.city2.text == "Los Angeles"){
                return citiesArray.IstLos.count
            }
            if(x.city1.text == "Los Angeles" && x.city2.text == "Istanbul"){
                return citiesArray.LosIst.count
            }
            
            if(x.city1.text == "Paris" && x.city2.text == "Roma"){
                return citiesArray.ParRom.count
            }
            if(x.city1.text == "Roma" && x.city2.text == "Paris"){
                return citiesArray.RomPar.count
            }
            
            if(x.city1.text == "Ankara" && x.city2.text == "Izmir"){
                return citiesArray.AnkIzm.count
            }
            if(x.city1.text == "Izmir" && x.city2.text == "Ankara"){
                return citiesArray.IzmAnk.count
            }
            
        }
        if(pickerView == pickerViewPass){
            return citiesArray.pass.count
        }
        
         return citiesArray.c.count
    
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       

        if(pickerView == pickerView1){
            return citiesArray.c[row]
        }
       if(pickerView == pickerView2){
            return citiesArray.c[row]
        }
        
      if(pickerView == pickerViewDate){
            if(x.city1.text == "Istanbul" && x.city2.text == "Ankara"){
                return citiesArray.IstAnk[row]
            }
            if(x.city1.text == "Ankara" && x.city2.text == "Istanbul"){
                return citiesArray.AnkIst[row]
            }
        
        if(x.city1.text == "Istanbul" && x.city2.text == "London"){
            return citiesArray.IstLon[row]
        }
        if(x.city1.text == "London" && x.city2.text == "Istanbul"){
            return citiesArray.LonIst[row]
        }
        
        if(x.city1.text == "Paris" && x.city2.text == "London"){
            return citiesArray.ParLon[row]
        }
        if(x.city1.text == "London" && x.city2.text == "Paris"){
            return citiesArray.LonPar[row]
        }
        if(x.city1.text == "Amsterdam" && x.city2.text == "Los Angeles"){
            return citiesArray.AmsLos[row]
        }
        if(x.city1.text == "Los Angeles" && x.city2.text == "Amsterdam"){
            return citiesArray.LosAms[row]
        }
        
        if(x.city1.text == "Izmir" && x.city2.text == "Bodrum"){
            return citiesArray.IzmBod[row]
        }
        if(x.city1.text == "Bodrum" && x.city2.text == "Izmir"){
            return citiesArray.BodIzm[row]
        }
        
        if(x.city1.text == "Istanbul" && x.city2.text == "Los Angeles"){
            return citiesArray.IstLos[row]
        }
        if(x.city1.text == "Los Angeles" && x.city2.text == "Istanbul"){
            return citiesArray.LosIst[row]
        }
        
        if(x.city1.text == "Paris" && x.city2.text == "Roma"){
            return citiesArray.ParRom[row]
        }
        if(x.city1.text == "Roma" && x.city2.text == "Paris"){
            return citiesArray.RomPar[row]
        }
        
        if(x.city1.text == "Ankara" && x.city2.text == "Izmir"){
            return citiesArray.AnkIzm[row]
        }
        if(x.city1.text == "Izmir" && x.city2.text == "Ankara"){
            return citiesArray.IzmAnk[row]
        }
        
        if(x.city1.text == "" && x.city2.text == ""){
            return ""
        }
        
        }
       if(pickerView == pickerViewPass){
            return citiesArray.pass[row]
        
        }
        
       else{
        
        let alert = UIAlertController(title: "!!!", message: "There is no flight for your selections.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        
        self.present(alert, animated: true)

        x.city1.text! = ""
        x.city2.text! = ""
        
        }
        return " "
    }
  
   
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       

        if(pickerView == pickerView1){
            
            x.city1.text = citiesArray.c[row]
            x.city1.resignFirstResponder()
        }
        if(pickerView == pickerView2){
            x.city2.text = citiesArray.c[row]
            x.city2.resignFirstResponder()
        }
         if(pickerView == pickerViewDate){
            
            
            if(x.city1.text == "Istanbul" && x.city2.text == "Ankara"){
                x.date.text = citiesArray.IstAnk[row]
                x.date.resignFirstResponder()
                
             
            }
            if(x.city1.text == "Ankara" && x.city2.text == "Istanbul"){
                x.date.text = citiesArray.AnkIst[row]
                x.date.resignFirstResponder()
            }
            
            if(x.city1.text == "Istanbul" && x.city2.text == "London"){
                x.date.text = citiesArray.IstLon[row]
                x.date.resignFirstResponder()
            }
            if(x.city1.text == "London" && x.city2.text == "Istanbul"){
                x.date.text = citiesArray.LonIst[row]
                x.date.resignFirstResponder()
            }
            
            if(x.city1.text == "Paris" && x.city2.text == "London"){
                x.date.text = citiesArray.ParLon[row]
                x.date.resignFirstResponder()
            }
            if(x.city1.text == "London" && x.city2.text == "Paris"){
                x.date.text = citiesArray.LonPar[row]
                x.date.resignFirstResponder()
            }
            if(x.city1.text == "Amsterdam" && x.city2.text == "Los Angeles"){
                x.date.text = citiesArray.AmsLos[row]
                x.date.resignFirstResponder()
            }
            if(x.city1.text == "Los Angeles" && x.city2.text == "Amsterdam"){
                x.date.text = citiesArray.LosAms[row]
                x.date.resignFirstResponder()
            }
            
            if(x.city1.text == "Izmir" && x.city2.text == "Bodrum"){
                x.date.text = citiesArray.IzmBod[row]
                x.date.resignFirstResponder()
            }
            if(x.city1.text == "Bodrum" && x.city2.text == "Izmir"){
                x.date.text = citiesArray.BodIzm[row]
                x.date.resignFirstResponder()
            }
            
            if(x.city1.text == "Istanbul" && x.city2.text == "Los Angeles"){
                x.date.text = citiesArray.IstLos[row]
                x.date.resignFirstResponder()
            }
            if(x.city1.text == "Los Angeles" && x.city2.text == "Istanbul"){
                x.date.text = citiesArray.LosIst[row]
                x.date.resignFirstResponder()
            }
            
            if(x.city1.text == "Paris" && x.city2.text == "Roma"){
                x.date.text = citiesArray.ParRom[row]
                x.date.resignFirstResponder()
            }
            if(x.city1.text == "Roma" && x.city2.text == "Paris"){
                x.date.text = citiesArray.RomPar[row]
                x.date.resignFirstResponder()
            }
            
            if(x.city1.text == "Ankara" && x.city2.text == "Izmir"){
                x.date.text = citiesArray.AnkIzm[row]
                x.date.resignFirstResponder()
            }
            if(x.city1.text == "Izmir" && x.city2.text == "Ankara"){
                x.date.text = citiesArray.IzmAnk[row]
                x.date.resignFirstResponder()
            }
            
        }

        if(pickerView == pickerViewPass){
            x.passenger.text = citiesArray.pass[row]
            x.passenger.resignFirstResponder()
        }
       
    }
    
    
}

