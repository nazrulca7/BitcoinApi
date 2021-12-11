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
    let price_usd : Float?
    let id_icon : String?
    
    
    
}

struct Icon:Codable{
    
    let asset_id :String?
    let url : String?
    
    
    
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
