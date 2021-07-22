//
//  UserService.swift
//  LearningApp
//
//  Created by Braydon Whitfield on 2021-07-22.
//

import Foundation

class UserService {
    
    var user = User()
    
    static var shared = UserService()
    
    private init() {
        
    }
}
