//
//  FlightTableViewController.swift
//  FinalProject
//
//  Created by Ezgi Koç on 11.05.2018.
//  Copyright © 2018 Ezgi Koç. All rights reserved.
//

import UIKit


class FlightTableViewController: UITableViewController{
    
    
    @IBOutlet weak var button: UIButton!
   var y = PlaneSeats()
    
    
     var x = OrderModel()
    
    
    var myindex = 0
     
     var arrayw = [String]()
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbvc = self.tabBarController as! orderViewController
        x = tbvc.x
       
        }
    
      override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        }

    
    
    
   
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
  
        
    
 
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if (x.q3() == "May 24 2018"){
            return 3
        }
        if (x.q3() == "May 28 2018"){
            return 3
        }
        if (x.q3() == "June 12 2018"){
            return 3
        }
        if (x.q3() == "May 27 2018"){
          return 3
        }
        
        if (x.q3() == "June 01 2018"){
            return 3
        }
        if (x.q3() == "May 14 2018"){
             return 3
        }
        if (x.q3() == "May 29 2018"){
             return 3
        }
        if (x.q3() == "June 28 2018"){
             return 3
        }
        if (x.q3() == "July 22 2018"){
          return 3
        }
        if (x.q3() == "June 06 2018"){
          return 3
        }
        if (x.q3() == "July 03 2018"){
            return 3
        }
        if (x.q3() == "August 01 2018"){
            return 3
        }
        if (x.q3() == "September 15 2018"){
            return 3
        }
        if (x.q3() == "October 16 2018"){
             return 2
        }
        if (x.q3() == "November 17 2018"){
             return 1
        }
        if (x.q3() == "February 18 2019"){
             return 1
        }
        if (x.q3() == "September 23 2018"){
            return 3
        }
        if (x.q3() == "October 24 2018"){
             return 2
        }
        if (x.q3() == "November 25 2018"){
             return 1
            }
        if (x.q3() == "February 27 2019"){
             return 1
        }
        if (x.q3() == "June 03 2018"){
             return 3
        }
        if (x.q3() == "July 13 2018"){
            return 2
        }
        if (x.q3() == "September 23 2018"){
             return 3
            }
        if (x.q3() == "June 09 2018"){
             return 3
        }
        if (x.q3() == "July 19 2018"){
             return 2
        }
        if (x.q3() == "September 29 2018"){
             return 1
        }
        if (x.q3() == "May 21 2018"){
             return 3
        }
        if (x.q3() == "June 08 2018"){
            return 3
        }
        if (x.q3() == "June 18 2018"){
             return 3
        }
        if (x.q3() == "May 30 2018"){
             return 2
        }
        if (x.q3() == "June 15 2018"){
             return 3
        }
        if (x.q3() == "June 30 2018"){
             return 1
        }
        if (x.q3() == "August 17 2018"){
             return 3
        }
        if (x.q3() == "September 22 2018"){
            return 2
        }
        if (x.q3() == "November 25 2018"){
             return 2
        }
        if (x.q3() == "August 25 2018"){
             return 3
        }
        if (x.q3() == "September 27 2018"){
            return 2
        }
        if (x.q3() == "November 30 2018"){
             return 2
        }
        if (x.q3() == "December 29 2018"){
             return 4
        }
        if (x.q3() == "January 07 2019"){
             return 4
        }
        if (x.q3() == "December 05 2018"){
             return 3
        }
        if (x.q3() == "January 19 2019"){
            return 3
            }
        if (x.q3() == "December 14 2018"){
            return 3
        }
        if (x.q3() == "January 27 2019"){
            return 3
    }
        else {
            return 1
}
}
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
   

        
    var image = UIImage(named: "pln") as UIImage?
    
    var e = 1
    @IBAction func planeButton (_ sender : UIButton){
       
        if e % 2 == 0 {
            x.arrayButton.forEach { (but) in
                if but == sender {
                    but.isSelected = true
                    sender.setImage(x.ima, for: UIControlState.normal)

                } else {
                    but.isSelected = false
                }
            }
        }
        else{
            
            self.x.arrayButton.forEach { (but) in
                if but == sender {
                    but.isSelected = true
                    sender.setImage(x.ima2, for: UIControlState.normal)
                } else {
                    but.isSelected = false
                    
                }
            }
            
        }
        e = e + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as? FlightsCellTableViewCell else{
            fatalError("error")
        }
        
        x.buton = UIButton(frame: CGRect(x: 350, y:5 , width: 50, height:40))
        x.buton.setImage(image, for: .normal)
        x.arrayButton.append(x.buton)
        x.buton.tag = indexPath.row
        x.buton.addTarget(self, action: #selector(FlightTableViewController.planeButton), for: .touchUpInside)
        cell.addSubview(x.buton)
        
        
        
        var image1 = "airf.jpg"
        var airFrance = UIImage(named: image1)
        var image2 = "ajet.jpg"
        var anadoluJet = UIImage(named: image2)
        var image3 = "british.jpg"
        var britishAirways = UIImage(named: image3)
        var image4 = "pgs.jpg"
        var pegasus = UIImage(named: image4)
        var image5 = "ryn.jpg"
        var ryanair = UIImage(named: image5)
        var image6 = "thy.jpg"
        var turkish = UIImage(named: image6)
        var im = "noSeat.jpg"
        var im1 = UIImage(named: im)
        
        var btn = UIButton(frame: CGRect(x: 300, y:5 , width: 50, height:40))
        btn.setImage(im1, for: .normal)
       
        if (x.q3() == "May 24 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Turkish Airlines  10:00  50$"
                cell.imageView!.image = turkish
                
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Pegasus Airlines  18:30  $150"
                cell.imageView!.image = pegasus
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Anadolu Jet  19:20  $100"
                cell.imageView!.image = anadoluJet
                cell.addSubview(btn)
            }
        }
        if (x.q3() == "May 28 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Pegasus Airlines  09:45  $50"
                cell.imageView!.image = pegasus
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines  12:00  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Anadolu Jet  23:15  $100"
                cell.imageView!.image = anadoluJet
                cell.addSubview(btn)
            }
        }
        if (x.q3() == "June 12 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Turkish Airlines  12:00  $50"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Anadolu Jet  18:25  $150"
                cell.imageView!.image = anadoluJet
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Pegasus Airlines  22:35  $100"
                cell.imageView!.image = pegasus
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "May 27 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Turkish Airlines  17:30  $55"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Anadolu Jet  20:15  $150"
                cell.imageView!.image = anadoluJet
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Pegasus Airlines  23:55  $100"
                cell.imageView!.image = pegasus
            }
        }
        
        if (x.q3() == "June 01 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Anadolu Jet  02:20  $55"
                cell.imageView!.image = anadoluJet
                 cell.addSubview(btn)
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Pegasus Airlines  06:30  $150"
                cell.imageView!.image = pegasus
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Turkish Airlines  12:50  $100"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "June 14 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Pegasus Airlines  10:30  $55"
                cell.imageView!.image = pegasus
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines  18:00  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Anadolu Jet  19:20  $100"
                cell.imageView!.image = anadoluJet
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "May 29 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Pegasus Airlines  12:30  $160"
                cell.imageView!.image = pegasus
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines  13:00  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "British Airways  15:15  $100"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "June 28 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  10:30  $160"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines  17:20  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "British Airways  21:45  $100"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "July 22 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Pegasus Airlines  05:30  $160"
                cell.imageView!.image = pegasus
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  14:55  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Turkish Airlines  17:40  $100"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "June 06 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  07:30  $150"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines  22:20  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "British Airways  23:45  $100"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "July 03 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  05:30  $150"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  14:55  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Turkish Airlines  17:40  $100"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "August 01 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  05:30  $150"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  13:35  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Turkish Airlines  19:45  $100"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "September 15 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  04:30  $140"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  12:30  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Air France  20:15  $100"
                cell.imageView!.image = airFrance
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "October 16 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Air France  08:35  $140"
                cell.imageView!.image = airFrance
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  11:45  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "November 17 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Air France  09:40  $140"
                cell.imageView!.image = airFrance
            }
        }
        if (x.q3() == "February 18 2019"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  16:45  $140"
                cell.imageView!.image = ryanair
            }
        }
        if (x.q3() == "September 23 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  06:30  $300"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  13:30  $240"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Air France   21:15  $100"
                cell.imageView!.image = airFrance
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "October 24 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Air France  09:35  $300"
                cell.imageView!.image = airFrance
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  12:45  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
            
        }
        if (x.q3() == "November 25 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Air France  10:40  $300"
                cell.imageView!.image = airFrance
            }
            
        }
        if (x.q3() == "February 27 2019"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  17:45  $300"
                cell.imageView!.image = ryanair
            }
        }
        if (x.q3() == "June 03 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  10:30  $250"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  11:55  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Turkish Airlines 22:45  $100"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "July 13 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  11:45  $250"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  18:45  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "September 23 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Air France  19:40  $250"
                cell.imageView!.image = airFrance
            }
        }
        if (x.q3() == "June 09 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  11:30  $275"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  12:55  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Turkish Airlines 23:45  $100"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "July 19 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  10:45  $275"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  17:45  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "September 29 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Air France  18:45  $275"
                cell.imageView!.image = airFrance
            }
        }
        if (x.q3() == "May 21 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Pegasus Airlines  02:45  $30"
                cell.imageView!.image = pegasus
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines  06:10  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Anadolu Jet  22:10  $100"
                cell.imageView!.image = anadoluJet
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "June 08 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Turkish Airlines  06:40  $30"
                cell.imageView!.image = turkish
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Anadolu Jet  08:25  $150"
                cell.imageView!.image = anadoluJet
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Pegasus Airlines  22:10  $100"
                cell.imageView!.image = pegasus
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "June 18 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Turkish Airlines  02:00  $30"
                cell.imageView!.image = turkish
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Anadolu Jet  08:45  $150"
                cell.imageView!.image = anadoluJet
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Pegasus Airlines  12:50  $100"
                cell.imageView!.image = pegasus
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "May 30 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Pegasus Airlines  06:40  $35"
                cell.imageView!.image = pegasus
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines  09:10  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "June 15 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Turkish Airlines  12:40  $35"
                cell.imageView!.image = turkish
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Anadolu Jet  18:20  $150"
                cell.imageView!.image = anadoluJet
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Pegasus Airlines  23:10  $100"
                cell.imageView!.image = pegasus
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "June 30 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Turkish Airlines  12:00  $35"
                cell.imageView!.image = turkish
            }
        }
        if (x.q3() == "August 17 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "British Airways  17:55  $213"
                cell.imageView!.image = britishAirways
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Ryanair  18:30  $150"
                cell.imageView!.image = ryanair
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Turkish Airlines 20:45  $100"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "September 22 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  10:10  $213"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines 13:40  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "November 25 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "British Airways  19:55  $213"
                cell.imageView!.image = britishAirways
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines 22:20  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "August 25 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "British Airways  16:55  $215"
                cell.imageView!.image = britishAirways
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Ryanair  19:30  $150"
                cell.imageView!.image = ryanair
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Turkish Airlines 21:45  $100"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "September 27 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  09:10  $215"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines 14:40  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "November 30 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "British Airways  18:55  $215"
                cell.imageView!.image = britishAirways
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines 23:20  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "December 29 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "British Airways  10:55  $195"
                cell.imageView!.image = britishAirways
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Ryanair  14:35  $150"
                cell.imageView!.image = ryanair
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Turkish Airlines 18:45  $100"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 3) {
                cell.textLabel?.text = "Air France 23:55  $75"
                cell.imageView!.image = airFrance
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "January 07 2019"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Ryanair  13:10  $200"
                cell.imageView!.image = ryanair
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "British Airways  14:15  $150"
                cell.imageView!.image = britishAirways
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Turkish Airlines 20:25  $100"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 3) {
                cell.textLabel?.text = "Air France 21:55  $75"
                cell.imageView!.image = airFrance
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "December 05 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Turkish Airlines  05:00  $65"
                cell.imageView!.image = turkish
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Pegasus Airlines  08:30  $150"
                cell.imageView!.image = pegasus
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Anadolu Jet  15:20  $100"
                cell.imageView!.image = anadoluJet
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "January 19 2019"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Pegasus Airlines  08:45  $65"
                cell.imageView!.image = pegasus
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines  16:00  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Anadolu Jet  20:15  $100"
                cell.imageView!.image = anadoluJet
                cell.addSubview(btn)
            }
        }
        if (x.q3() == "December 14 2018"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Turkish Airlines  06:10  $80"
                cell.imageView!.image = turkish
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Pegasus Airlines  09:35  $150"
                cell.imageView!.image = pegasus
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Anadolu Jet  22:20  $100"
                cell.imageView!.image = anadoluJet
                 cell.addSubview(btn)
            }
        }
        if (x.q3() == "January 27 2019"){
            if (indexPath.section == 0) {
                cell.textLabel?.text = "Pegasus Airlines  01:00  $80"
                cell.imageView!.image = pegasus
            }
            if (indexPath.section == 1) {
                cell.textLabel?.text = "Turkish Airlines  17:00  $150"
                cell.imageView!.image = turkish
                 cell.addSubview(btn)
            }
            if (indexPath.section == 2) {
                cell.textLabel?.text = "Anadolu Jet  18:00  $100"
                cell.imageView!.image = anadoluJet
                 cell.addSubview(btn)
            }
        }
       
        
        return cell
        
    }
}
