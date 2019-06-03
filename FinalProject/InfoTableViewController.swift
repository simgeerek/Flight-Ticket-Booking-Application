//
//  InfoTableViewController.swift
//  FinalProject
//
//  Created by Ezgi Koç on 18.05.2018.
//  Copyright © 2018 Ezgi Koç. All rights reserved.
//

import UIKit

class InfoTableViewController: UITableViewController {
    
    var x = OrderModel()
    var t = Info()

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let tbvc = self.tabBarController as! orderViewController
        x = tbvc.x
      
        
    }
    
    
    
    
    
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 180.0
    }
   

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return Int(x.q9())!
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        for i in 0..<Int(x.q9())! {
        if section == i{
            return "Person"
            }
           
        }
     return " "
    }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)as? Info else{
            fatalError("error")
           
            
        }
       
       
        return cell
}

}

