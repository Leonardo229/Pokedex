//
//  APIErrors.swift
//  Utils
//
//  Created by Leonardo Coelho on 11/01/23.
//

import Foundation

public enum APIErrors: Error {
    case NotFound           // Recurso não encontrado
    case Forbidden          // Proibido
    case InternalError      // Erro interno
    case ServiceUnavailable // Indisponível
}
