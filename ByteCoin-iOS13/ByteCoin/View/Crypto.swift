//
//  Crypto.swift
//  ByteCoin
//
//  Created by jagjeet on 01/09/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class Crypto: UICollectionViewCell {
    
    @IBOutlet weak var cryptoimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let blueView = UIView(frame: bounds)
        blueView.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        self.selectedBackgroundView = blueView
       
        
    }

}
