//
//  PlaneSeats.swift
//  FinalProject
//
//  Created by Ezgi Koç on 9.05.2018.
//  Copyright © 2018 Ezgi Koç. All rights reserved.
//

import UIKit
import CoreData

class PlaneSeats: UITableViewController {
   
   
    var x = OrderModel()
    var people = [NSManagedObject]()
    var lb = UILabel(frame : CGRect(x:120 , y:50 , width: 200, height : 20))
    var arrayButton = [UIButton!]()
    
    var arraySelect = [UIButton!]()
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
   
    let ima3 = UIImage(named: "black") as! UIImage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbvc = self.tabBarController as! orderViewController
        x = tbvc.x
       
     //   deleteAllRecords()
        
 
        
       
    }
    
    
/*func deleteAllRecords() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "PLANE")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }*/
    
    
    
   override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 9
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "   A1          A2          A3            A4         A5         A6"
        }
        else  if section==1{
            return "   B1          B2          B3            B4         B5         B6"
        }
        else  if section==2{
            return "   C1          C2          C3            C4         C5         C6"
        }
        else  if section==3{
            return "   D1          D2          D3            D4         D5         D6"
        }
        else  if section==4{
            return "  "
        }
        else  if section==5{
            return "   F1          F2          F3             F4          F5          F6"
        }
        else  if section==6{
            return "   G1          G2          G3            G4         G5         G6"
        }
        else  if section==7{
            return "   H1          H2          H3            H4         H5         H6"
        }
        else{
            return " "
        }
        
        
    }
    
     var image = UIImage(named: "redSeat") as UIImage?
     var arrow1 = UIImage(named: "arrowRight") as UIImage?
     var arrow2 = UIImage(named: "arrowLeft") as UIImage?
   
    var buttonLeft = UIButton()
    var buttonRight = UIButton()
    var button1 = UIButton()
    var butt = UIButton()
    var button2 = UIButton()
    var button3 = UIButton()
    var button4 = UIButton()
    var button5 = UIButton()
    var button6 = UIButton()
    var buttonNext = UIButton()
    var a = 1
    
    
    @IBAction func tickButton (_ sender : UIButton){
        
        let ima = UIImage(named: "redSeat") as! UIImage
        let ima2 = UIImage(named: "black") as! UIImage
     
       
            arrayButton.forEach { (but) in
                if but == sender {
                
                    but.isSelected = true
                     btnLoad(sender)
                    let managedContext = appDelegate?.persistentContainer.viewContext
                    let entity = NSEntityDescription.entity(forEntityName: "PLANE", in: managedContext!)!
                    let person = NSManagedObject(entity: entity, insertInto: managedContext)
                    
                    person.setValue(sender.titleLabel?.text, forKeyPath: "seatnumber")
                  
                    do{
                        try managedContext?.save()
                        people.append(person)
                        print(people)
                    }
                    catch let error as NSError {
                        print("Could not save. \(error), \(error.userInfo)")
                    }
                    
                }
                else {
                    but.isSelected = false
                  
                    
                }
        }
    }
    
    
      @IBAction func btnLoad (_ sender : UIButton){
        let managedContext = appDelegate?.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "PLANE")
       
        do{
            let request = try managedContext?.fetch(fetchRequest)
            for p in request! {
                

                print(p.value(forKey: "seatnumber")as? String)
                
                  for i in 0..<arrayButton.count {
                    if  p.value(forKey: "seatnumber") as? String == arrayButton[i].titleLabel?.text {
                        print(arrayButton[i].titleLabel?.text)
                        
                        arrayButton[i].setImage(ima3, for: UIControlState.normal)
                        arrayButton[i].isEnabled = false
                        }
                         }
        }
        }
            
        catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
    }
   
      override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
   
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
      
      if (x.q3() == "May 24 2018"){
        if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
        
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
               
                image = UIImage(named: "redSeat") as UIImage?
    
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
               
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i)
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                btnLoad(butt)
                   
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
               }
        
       
        }
       
        if (x.q3() == "May 28 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "a"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                btnLoad(butt)
                
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 12 2018"){
            if x.arrayButton[1].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "b"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
              
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "May 27 2018"){
            if x.arrayButton[2].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "c"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
              btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 01 2018"){
            if x.arrayButton[1].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "d"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 14 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "e"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "May 29 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "f"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
              
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 28 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "g"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
             
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "July 22 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "h"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 06 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "ı"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
    
        if (x.q3() == "July 03 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "i"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "August 01 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "j"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
              
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "Semptember 15 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "k"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "October 16 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "aa"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
              
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "November 17 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "bb"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "February 18 2019"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "cc"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
              
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "September 23 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "dd"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "October 24 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "ee"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "November 25 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "ff"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "February 23 2019"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "gg"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 03 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "ıı"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "July 13 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "ii"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "September 23 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "xx"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 09 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "yy"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "July 19 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "zz"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "September 29 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "ww"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "May 21 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "qq"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
            
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 08 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "ss"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 18 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "tt"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "May 30 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "uu"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 15 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "aaa"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "June 30 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "bbb"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "August 17 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "ccc"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "September 22 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "ddd"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "November 25 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "eee"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "August 25 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "fff"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "September 27 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "ııı"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "November 30 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "iii"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "December 29 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "jjj"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "January 07 2019"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "kkk"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
                
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        if (x.q3() == "December 05 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "xxx"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "January 19 2019"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "yyy"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
              
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "December 14 2018"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "zzz"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        if (x.q3() == "January 27 2019"){
            if x.arrayButton[0].currentImage == UIImage(named: "Plane") {
                
                button1 = UIButton(frame: CGRect(x: 340, y:5 , width: 50, height:40))
                button2 = UIButton(frame: CGRect(x: 280, y:5 , width: 50, height:40))
                button3 = UIButton(frame: CGRect(x: 220, y:5 , width: 50, height:40))
                button4 = UIButton(frame: CGRect(x: 140, y:5 , width: 50, height:40))
                button5 = UIButton(frame: CGRect(x: 80, y:5 , width: 50, height:40))
                button6 = UIButton(frame: CGRect(x: 20, y:5 , width: 50, height:40))
                
                image = UIImage(named: "redSeat") as UIImage?
                
                button1.setImage(image, for: .normal)
                button2.setImage(image, for: .normal)
                button3.setImage(image, for: .normal)
                button4.setImage(image, for: .normal)
                button5.setImage(image, for: .normal)
                button6.setImage(image, for: .normal)
                
                arrayButton.append(button1)
                arrayButton.append(button2)
                arrayButton.append(button3)
                arrayButton.append(button4)
                arrayButton.append(button5)
                arrayButton.append(button6)
                
                for i in 0..<arrayButton.count {
                    arrayButton[i].titleLabel?.text = String(i) + "www"
                }
                
                button1.tag = indexPath.row
                button1.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button2.tag = indexPath.row
                button2.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button3.tag = indexPath.row
                button3.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button4.tag = indexPath.row
                button4.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button5.tag = indexPath.row
                button5.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                button6.tag = indexPath.row
                button6.addTarget(self, action: #selector(PlaneSeats.tickButton), for: .touchUpInside)
                
               
                btnLoad(butt)
                cell.addSubview(button1)
                cell.addSubview(button2)
                cell.addSubview(button3)
                cell.addSubview(button4)
                cell.addSubview(button5)
                cell.addSubview(button6)
            }
            
            
        }
        
        
        
        
        return cell
        
}
    
   
   
}
