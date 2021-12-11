//
//  BitcoinTableViewCell.swift
//  BitcoinApi
//
//  Created by Md Nazrul Islam on 2021-12-10.
//

import UIKit

class BitcoinTableViewCellModel{
    
    let name : String
    let symbol : String
    let price : String
    let iconurl: URL?
    var iconData : Data?
    
    init(
        name:String,
    symbol: String,
    price:String,
    iconurl : URL?
    )
    {
        self.name = name
        self.symbol = symbol
        self.price = price
        self.iconurl = iconurl
        
    }
    
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
    
    private let iconImageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
       
        return imageView
     
    }()
    
    override  init(style: BitcoinTableViewCell.CellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(namelabel)
        contentView.addSubview(symbollabel)
        contentView.addSubview(pricelabel)
        contentView.addSubview(iconImageView)
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
     
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height/1.1
        iconImageView.frame = CGRect(x: 20, y: (contentView.frame.height-size)/2,
                                 width: size,
                                 height: size
        )
        namelabel.sizeToFit()
        symbollabel.sizeToFit()
        pricelabel.sizeToFit()
        
        
       
        
        namelabel.frame = CGRect(x: 30+size, y: 0,
                                 width: contentView.frame.size.width/2,
                                 height: contentView.frame.size.height/2
        )
        
        symbollabel.frame = CGRect(x: 30+size, y: contentView.frame.height/2,
                                 width: contentView.frame.size.width/2,
                                 height: contentView.frame.size.height/2
        )
        
        pricelabel.frame = CGRect(x: contentView.frame.width/2,
                                   y: 0,
                                
                                 width: (contentView.frame.size.width/2)-15,
                                 height: contentView.frame.size.height
        )
    }
        
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.image = nil
        namelabel.text = nil
        pricelabel.text = nil
        symbollabel.text = nil
    }
    
    func configure( with ViewModel: BitcoinTableViewCellModel)
    {
        namelabel.text = ViewModel.name
        symbollabel.text = ViewModel.symbol
        pricelabel.text = ViewModel.price
        
        if let data = ViewModel.iconData{
            
            iconImageView.image = UIImage(data:data)
            
            
        }else{
            
            if let url = ViewModel.iconurl{
                
                let task = URLSession.shared.dataTask(with: url){[ weak self] data,_ , _ in
                    if let data = data{
                        ViewModel.iconData = data
                        DispatchQueue.main.sync {
                            self?.iconImageView.image = UIImage(data: data)
                        }
                        
                    }
                    
                    
                    
                }
                
                task.resume();
            }
            
            
        }
        
        
    }
   

}
