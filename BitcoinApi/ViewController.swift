//
//  ViewController.swift
//  BitcoinApi
//
//  Created by Md Nazrul Islam on 2021-12-09.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    var SelectRowId : String = ""
    private let tableView : UITableView = {
    
        let tableView = UITableView(frame : .zero , style:.grouped)
    tableView.register(BitcoinTableViewCell.self, forCellReuseIdentifier: BitcoinTableViewCell.identifier )
     return tableView
    }()
    
    private  var viewModels =  [BitcoinTableViewCellModel]()
    static let numberFormatter : NumberFormatter =
    {
        let formatter = NumberFormatter()
        formatter.locale = .current
        formatter.allowsFloats = true
        formatter.numberStyle = .currency
        formatter.formatterBehavior = .default
        return formatter
    }()
    
    override func viewDidLoad() {
        title = "Bitcoin Tracker"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
        
        ApiCall.shared.getAllCriptoData{
           [weak self] result in switch result{
                
            case .success(let models):
              
               self?.viewModels = models.compactMap({ models in
                   let price = models.price_usd ?? 0
                   let formatter = ViewController.numberFormatter
                   let priceString = formatter.string(from: NSNumber(value: price))
                   
                   let iconUrl = URL(string: ApiCall.shared.icons.filter(
                    { icon in
                        icon.asset_id == models.asset_id
                        
                    }
                   ).first?.url ?? ""
                   )
                return BitcoinTableViewCellModel.init(
                    name:models.name ?? "N/A",
                    symbol: models.asset_id ?? "",
                    price: priceString ?? "N/A",
                    iconurl: iconUrl,
                    
                    data_quote_start: models.data_quote_start ?? "",
                    data_quote_end : models.data_quote_end ?? "",
                    data_orderbook_start : models.data_orderbook_start ?? "",
                    data_orderbook_end  : models.data_orderbook_end ?? ""
                    
                   )
               })
         
               
               DispatchQueue.main.sync {
                   
                   self?.tableView.reloadData()
               }
               
            case .failure(let error):
                print("error: \(error)")
                
            }
            
        }
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: BitcoinTableViewCell.identifier , for: indexPath
        ) as? BitcoinTableViewCell
        else{
            
            fatalError();
        }
        cell.configure(with: viewModels[indexPath.row])
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         
       
        SelectRowId = viewModels[indexPath.row].symbol
        var isSomethingEnabled = false

        
        if let viewControllerB = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            viewControllerB.SelectRowId = SelectRowId
            viewControllerB.bitdata = viewModels
                    if let navigator = navigationController {
                        navigator.pushViewController(viewControllerB, animated: true)
                    }
                }
        
        
        
      /* let vc = DetailsViewController(SelectRowId: String( self.SelectRowId), model: self.viewModels)*/
        
       // let vc = checkViewController()
      //  let vc = DetailsViewController()
        
       /// vc.SelectRowId = SelectRowId
        //navigationController?.pushViewController(vc, animated: true)
        
  
        
        //print(indexPath.row)
        //print(viewModels[indexPath.row].symbol)
          
          
      }
 
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.performSegue(withIdentifier: "dtlsegue", sender: nil)
        
            let dtlView = segue.destination as! DetailsViewController
            dtlView.SelectRowId = SelectRowId
    }*/
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.performSegue(withIdentifier: "segue", sender: nil)
        
            let dtlView = segue.destination as! DetailsViewController
            dtlView.SelectRowId = SelectRowId
       
    }
   */
      
    
    
    
}

