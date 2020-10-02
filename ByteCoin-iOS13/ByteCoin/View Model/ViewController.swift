//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,CoinManagerDelegate{
    
    @IBOutlet weak var pricelabel:UILabel!
     @IBOutlet weak var cursymbol:UILabel!
     @IBOutlet weak var picker:UIPickerView!
    @IBOutlet weak var cryptoCurrency:UICollectionView!
    var CoinType:String = "BTC"
    var Crypto:String = ""
    @IBAction func click(_ sender:UIButton) {
   
        
    }
    
    func updateUI(_ coinObject: bitcoin) {
        DispatchQueue.main.async {
            self.pricelabel.text = coinObject.price
            self.cursymbol.text = coinObject.asset_id_quote
            
        }
        
    }
    
  
    
 
  var coin = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        coin.delegate = self
        let nib = UINib(nibName: "Crypto", bundle: nil)
        self.cryptoCurrency.register(nib, forCellWithReuseIdentifier: "Cell")
        self.cryptoCurrency.collectionViewLayout = UICollectionViewFlowLayout()
         
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return coin.currencyArray.count
    
     }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coin.currencyArray[row]
   
   
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let Currency = coin.currencyArray[row]
        self.Crypto = Currency
        coin.getURL(Currency, CoinType)


}
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Crypto
        cell.cryptoimage.image = UIImage(named: "\(coin.CoinArray[indexPath.row])")
        cell.cryptoimage.contentMode = .scaleAspectFit
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width:(Int(cryptoCurrency.frame.size.width)-50)/3, height:(Int(cryptoCurrency.frame.height)))
        
        return size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currency = coin.CoinArray[indexPath.row]
        self.CoinType = currency
        coin.getURL(Crypto, CoinType)
    }
    func alert() {
        let alert = UIAlertController(title: " Error", message: "Try some other Value ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert,animated:true)
    }
    
    
}

