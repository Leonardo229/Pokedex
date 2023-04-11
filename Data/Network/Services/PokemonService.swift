//
//  PokemonService.swift
//  Data
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation
import Combine
import Utils


public class PokemonService {
    
    private let path = "pokemon"
    
    public init(){}
    
    public func getPokemons(limit: Int, offset: Int) -> Future<BaseListResponse<PokemonDTO>, APIErrors> {
        return HttpService<BaseListResponse<PokemonDTO>>.makeGetRequest(endPoint: "\(path)?limit=\(limit)&offset=\(offset)")
    }
}

