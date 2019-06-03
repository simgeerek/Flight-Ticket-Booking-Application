//
//  File.swift
//  FinalProject
//
//  Created by Ezgi Koç on 11.05.2018.
//  Copyright © 2018 Ezgi Koç. All rights reserved.
//

import Foundation

struct cities{
    var c : [String]
    var IstAnk : [String]
    var AnkIst : [String]
    var IstLon : [String]
    var LonIst : [String]
    var ParLon : [String]
    var LonPar : [String]
    var AmsLos : [String]
    var LosAms : [String]
    var IzmBod : [String]
    var BodIzm : [String]
    var IstLos : [String]
    var LosIst : [String]
    var ParRom : [String]
    var RomPar : [String]
    var AnkIzm : [String]
    var IzmAnk : [String]
    var pass : [String]
    

}


struct information{
    
    var name : String
    var lastName: String
    var ID : String
    
    init?(name:String,lastName:String,ID:String) {
        if name.isEmpty || lastName.isEmpty || ID.isEmpty  {
            return nil
        }
        
    self.name=name
    self.lastName=lastName
    self.ID=ID
        
    }
    
    
}

