//
//  ApiCall.swift
//  BitcoinApi
//
//  Created by Md Nazrul Islam on 2021-12-09.
//

import Foundation

final class ApiCall{
    
    static let shared = ApiCall();
    
    private struct Constants{
      
    
        static  let apikey = "1753BAFA-BD62-45FF-9203-38C810FB8F66"
        static let assetsEndPoint = "https://rest.coinapi.io/v1/assets"

        
    }
    private init(){}
        
    public func getAllCriptoData(completion : @escaping ((Result < [Bitcoin],Error>) -> Void)){
           
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
            completion(.success(bicoins))
        }
        catch{
            
            completion(.failure(error))
        }
        
        
    }
    task.resume()

}
}

