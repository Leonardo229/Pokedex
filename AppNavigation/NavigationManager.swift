//
//  NavigationManager.swift
//  Navigation
//
//  Created by Leonardo Coelho on 11/01/23.
//


import Foundation
import Utils
import SwiftUI
public class NavigationManager: ObservableObject {
    @Published var currentPage: NavigationRoutes = .PokemonList
    private var navigationStack: [NavigationRoutes] = [.PokemonList]
    
    public init() {}
    
    
    
    public func navigateTo(route: NavigationRoutes) {
        navigationStack.append(route)
        currentPage = navigationStack.last!
    }
    
    public func popView() {
        navigationStack.removeLast()
        currentPage = navigationStack.last!
    }
    
    public func navigationBinding(route: NavigationRoutes) -> Binding<Bool> {
        return .init(get: { () -> Bool in
            return self.currentPage == route
        }) { (value) in
            self.currentPage = route
        }
    }
    
}
