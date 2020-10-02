//
//  File.swift
//  ByteCoin
//
//  Created by jagjeet on 11/05/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct bitcoin:Codable {
    var asset_id_base:String
    var rate:Float
    var asset_id_quote:String
    
var price:String {
        String(format: "%.03f", rate)
        
    }
}
