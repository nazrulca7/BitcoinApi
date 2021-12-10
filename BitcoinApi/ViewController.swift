//
//  ViewController.swift
//  BitcoinApi
//
//  Created by Md Nazrul Islam on 2021-12-09.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    private let tableView : UITableView = {
    
        let tableView = UITableView(frame : .zero , style:.grouped)
    tableView.register(BitcoinTableViewCell.self, forCellReuseIdentifier: BitcoinTableViewCell.identifier )
     return tableView
    }()
    
    private  var viewModels =  [BitcoinTableViewCellModel]()
 
    override func viewDidLoad() {
        title = "Bitcoin Tracker"
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        super.viewDidLoad()
        
        ApiCall.shared.getAllCriptoData{
           [weak self] result in switch result{
                
            case .success(let models):
              
               self?.viewModels = models.compactMap({
                   
                   BitcoinTableViewCellModel.init(
                    name: $0.name ?? "N/A",
                    symbol: $0.asset_id ?? "",
                    price: "$1"
                   )
               })
               /* self?.viewModels = models.compactMap(
                {
                    /*BitcoinTableViewCellModel(
                        name : $0.name ?? "N/A",
                        symbol : $0.asset_id ?? "",
                         price: $1.price_usd
                    )*/
                }) */
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
    
}

