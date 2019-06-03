//
//  Info.swift
//  FinalProject
//
//  Created by Ezgi Koç on 18.05.2018.
//  Copyright © 2018 Ezgi Koç. All rights reserved.
//
import Foundation
import UIKit

class Info: UITableViewCell {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLast: UITextField!
    @IBOutlet weak var txtId: UITextField!
    
  
   
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  

}
