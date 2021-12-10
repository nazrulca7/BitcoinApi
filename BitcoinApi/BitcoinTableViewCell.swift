//
//  BitcoinTableViewCell.swift
//  BitcoinApi
//
//  Created by Md Nazrul Islam on 2021-12-10.
//

import UIKit

struct BitcoinTableViewCellModel{
    
    let name : String
    let symbol : String
    let price : String
    
}
class BitcoinTableViewCell: UITableViewCell {

   static let identifier = "BitcoinTableViewCell"
    
    private let namelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        
        return label
    }()
    
    private let symbollabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        
        return label
    }()
    
    private let pricelabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        
        return label
    }()
    
    
    override  init(style: BitcoinTableViewCell.CellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(namelabel)
        contentView.addSubview(symbollabel)
        contentView.addSubview(pricelabel)
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        namelabel.sizeToFit()
        symbollabel.sizeToFit()
        pricelabel.sizeToFit()
        
        namelabel.frame = CGRect(x: 15, y: 0,
                                 width: contentView.frame.size.width/2,
                                 height: contentView.frame.size.height/2
        )
        
        symbollabel.frame = CGRect(x: 15, y: contentView.frame.height/2,
                                 width: contentView.frame.size.width/2,
                                 height: contentView.frame.size.height/2
        )
        
        pricelabel.frame = CGRect(x: contentView.frame.width/2,
                                   y: 0,
                                
                                 width: (contentView.frame.size.width/2)-15,
                                 height: contentView.frame.size.height
        )
    }
        
    func configure( with ViewModel: BitcoinTableViewCellModel)
    {
        namelabel.text = ViewModel.name
        symbollabel.text = ViewModel.symbol
        pricelabel.text = ViewModel.price
        
        
    }
   

}
