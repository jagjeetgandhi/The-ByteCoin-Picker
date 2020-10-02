//
//  sample.swift
//  ByteCoin
//
//  Created by jagjeet on 10/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

class calculate {
    class func profit( cp: Double, sp: Double) ->Double {
         
        if sp > cp {
            let pro = sp - cp
            let prof:Double = pro/cp
            return prof*100;
        }
        return 0
    }
}
