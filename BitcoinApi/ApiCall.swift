//
//  ApiCall.swift
//  BitcoinApi
//
//  Created by Md Nazrul Islam on 2021-12-09.
//

import Foundation

final class ApiCall{
    
    static let shared = ApiCall();
    public var icons : [Icon] = []
    private var whenreadyBlock : ((Result < [Bitcoin],Error>) -> Void)?
    private struct Constants{
      
    
        static  let apikey = "1753BAFA-BD62-45FF-9203-38C810FB8F66"
        static let assetsEndPoint = "https://rest.coinapi.io/v1/assets"

        
    }
    private init(){}
        
    public func getAllCriptoData(completion : @escaping ((Result < [Bitcoin],Error>) -> Void)){
           
        guard  !icons.isEmpty else {
            whenreadyBlock = completion
            return
            
        }
        
        guard let URL = URL(string: Constants.assetsEndPoint + "?apikey=" + Constants.apikey) else {
            
            return
        }
            
        
        let task = URLSession.shared.dataTask(with: URL){ data,_,error in
        
            guard let data = data ,  error == nil else{
            
            return
            
        }
        do{
            
            //decode operation
            let bicoins = try JSONDecoder().decode([Bitcoin].self, from: data)
            
           
            completion(.success(bicoins.sorted { first, Second-> Bool in
                return first.price_usd ?? 0 > Second.price_usd ?? 0
                
            }))
        }
        catch{
            
            completion(.failure(error))
        }
        
        
    }
    task.resume()

}
    
    public func getAllIcons(){
        
        guard let url = URL(string: "https://rest.coinapi.io/v1/assets/icons/55/?apikey=1753BAFA-BD62-45FF-9203-38C810FB8F66") else
        {
            
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data,_,error in
        
            guard let data = data ,  error == nil else{
            
            return
            
        }
        do{
            
            //decode operation
            self?.icons = try JSONDecoder().decode([Icon].self, from: data)
            
            if let completion = self?.whenreadyBlock{
                
                self?.getAllCriptoData(completion: completion)
                
            }
        }
        catch{
            
           print(error)
        }
        
    }
    task.resume()

        
    }
    
   
    
    public func getHistoryData(){
        
        guard let historyurl = URL(string: "https://rest.coinapi.io/v1/ohlcv/BITSTAMP_SPOT_BTC_USD/history?apikey=1753BAFA-BD62-45FF-9203-38C810FB8F66&period_id=1MIN&time_start=2016-01-01T00:00:00") else
        {
            
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: historyurl){[weak self] data,_,error in
        
            guard let data = data ,  error == nil else{
            
            return
            
        }
        do{
            
            //decode operation
            self?.icons = try JSONDecoder().decode([Icon].self, from: data)
            
            if let completion = self?.whenreadyBlock{
                
                self?.getAllCriptoData(completion: completion)
                
            }
        }
        catch{
            
           print(error)
        }
        
    }
    task.resume()

        
    }
    
    
    
}

