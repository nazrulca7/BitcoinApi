//
//  models.swift
//  BitcoinApi
//
//  Created by Md Nazrul Islam on 2021-12-10.
//

import Foundation

struct Bitcoin: Codable{
    
    let asset_id : String?
    let name : String?
    let type_is_crypto : Int?
    
 
let data_quote_start: String?
let data_quote_end : String?
let data_orderbook_start: String?
let data_orderbook_end  : String?
let data_trade_start  : String?
let data_trade_end : String?
let data_symbols_count : Int?
let volume_1hrs_usd: Float?
let volume_1day_usd: Float?
let volume_1mth_usd: Float?
   
    
    
    
    let price_usd : Float?
    let id_icon : String?
    
let data_start: String?
let data_end : String?
    
    
    
}

struct Icon:Codable{
    
    let asset_id :String?
    let url : String?
    
    
    
}


class BitcoinTableViewCellModel{
    
    let name : String
    let symbol : String
    let price : String
    let iconurl: URL?
    var iconData : Data?
    
    let data_quote_start: String?
    let data_quote_end : String?
    let data_orderbook_start: String?
    let data_orderbook_end  : String?
    
    
    
    init(
        name:String,
    symbol: String,
    price:String,
    iconurl : URL?,
    
        data_quote_start: String,
        data_quote_end : String,
        data_orderbook_start: String,
        data_orderbook_end  : String
    )
    {
        self.name = name
        self.symbol = symbol
        self.price = price
        self.iconurl = iconurl
        
        self.data_quote_start = data_quote_start
        self.data_quote_end = data_quote_end
        self.data_orderbook_start = data_orderbook_start
        self.data_orderbook_end  = data_orderbook_end
    }
    
}



class BitcoinDtlTableViewCellModel{
    
    let asset_id : String?
    let name : String?
    let type_is_crypto : Int?
    
 
let data_quote_start: String?
let data_quote_end : String?
let data_orderbook_start: String?
let data_orderbook_end  : String?
let data_trade_start  : String?
let data_trade_end : String?
let data_symbols_count : Int?
let volume_1hrs_usd: Float?
let volume_1day_usd: Float?
let volume_1mth_usd: Float?
   
    
    
    
    let price_usd : Float?
    let id_icon : String?
    
let data_start: String?
let data_end : String?
    
    
    
    
    
    
    init(
    asset_id : String,
        name : String,
        type_is_crypto : Int,
       
    data_quote_start: String,
    data_quote_end : String,
    data_orderbook_start: String,
    data_orderbook_end  : String,
    
    data_trade_start  : String,
    data_trade_end : String,
    data_symbols_count : Int,
    volume_1hrs_usd: Float,
    volume_1day_usd: Float,
    volume_1mth_usd: Float,
   
        price_usd : Float,
        id_icon : String,
       
    data_start: String,
    data_end : String
    )
    {
        self.asset_id = asset_id
        self.name = name
        self.type_is_crypto = type_is_crypto
       
        self.data_quote_start = data_quote_start
        self.data_quote_end = data_quote_end
        self.data_orderbook_start = data_orderbook_start
        self.data_orderbook_end  = data_orderbook_end
        self.data_trade_start = data_trade_start
        self.data_trade_end  = data_trade_end
        self.data_symbols_count = data_symbols_count
        self.volume_1hrs_usd = volume_1hrs_usd
        self.volume_1day_usd  = volume_1day_usd
        self.volume_1mth_usd = volume_1mth_usd
          
          
        self.price_usd = price_usd
        self.id_icon  = id_icon
           
        self.data_start = data_start
        self.data_end = data_end
        
    }
    
}




/*"asset_id": "BTC",
 "name": "Bitcoin",
 "type_is_crypto": 1,
 "data_quote_start": "2014-02-24T17:43:05.0000000Z",
 "data_quote_end": "2021-12-10T06:45:33.7377022Z",
 "data_orderbook_start": "2014-02-24T17:43:05.0000000Z",
 "data_orderbook_end": "2020-08-05T14:38:38.3413202Z",
 "data_trade_start": "2010-07-17T23:09:17.0000000Z",
 "data_trade_end": "2021-12-10T06:39:56.5464590Z",
 "data_symbols_count": 71946,
 "volume_1hrs_usd": 3706628145526.05,
 "volume_1day_usd": 476760447472428.52,
 "volume_1mth_usd": 22447378916008203.86,
 "price_usd": 48190.920027377253101709360695,
 "id_icon": "4caf2b16-a017-4e26-a348-2cea69c34cba",
 "data_start": "2010-07-17",
 "data_end": "2021-12-10"
*/

/*
 time series
 "time_period_start": "2016-01-01T00:01:00.0000000Z",
     "time_period_end": "2016-01-01T00:02:00.0000000Z",
     "time_open": "2016-01-01T00:01:01.1500000Z",
     "time_close": "2016-01-01T00:01:01.1500000Z",
     "price_open": 430.890000000,
     "price_high": 430.890000000,
     "price_low": 430.890000000,
     "price_close": 430.890000000,
     "volume_traded": 0.080631010,
     "trades_count": 1
 
 */
