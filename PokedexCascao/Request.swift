//
//  Request.swift
//  PokedexCascao
//
//  Created by Rodrigo Miyashiro on 09/06/21.
//

import Foundation
import Alamofire

class Request {
    static func get(_ url: String, completion: @escaping(Data?, Error?) -> Void) {
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success:
                completion(response.data, nil)
                break
                
            case .failure:
                completion(nil, response.error)
                break
            }
        }
    }
}
