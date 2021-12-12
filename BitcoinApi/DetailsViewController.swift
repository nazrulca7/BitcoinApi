//
//  DetailsViewController.swift
//  BitcoinApi
//
//  Created by Md Nazrul Islam on 2021-12-11.
//

import UIKit

class DetailsViewController: UIViewController {

    var SelectRowId : String = ""
    var isSomethingEnabled = false
    var bitdata : [BitcoinTableViewCellModel]?
    
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var data_quote_start: UILabel!
    @IBOutlet weak var data_quote_end: UILabel!
    @IBOutlet weak var data_orderbook_start: UILabel!
    @IBOutlet weak var data_orderbook_end: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var data = self.bitdata?.filter({$0.symbol == SelectRowId})
        symbol.text = data?[0].symbol
        price.text = data?[0].price
        data_quote_start.text = data?[0].data_quote_start
        data_quote_end.text = data?[0].data_quote_end
        data_orderbook_start.text = data?[0].data_orderbook_start
        data_orderbook_end.text = data?[0].data_orderbook_end
        
        
        
        
        
        print("Value of 'isSomethingEnabled' from ViewControllerA: ", SelectRowId)
        //self.textLabelID.text = "Hello \(self.SelectRowId)!!!"
        
        // Do any additional setup after loading the view.
    }
   
   
       
   // private let SelectRowId : String
    //private let bitdataspecific : [BitcoinTableViewCellModel]
    //public let bitdata : [BitcoinTableViewCellModel]
    
    
   
    /*init(SelectRowId : String, model : [BitcoinTableViewCellModel]){
        
        self.SelectRowId = SelectRowId
        self.bitdata = model
        super.init(nibName: nil, bundle: nil)
        
    }*/
    
        /*  required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    
  
    
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
