//
//  WebService.swift
//  MVCDemoApp
//
//  Created by Scott Terry on 9/11/18.
//  Copyright © 2018 Envative. All rights reserved.
//

import UIKit

class WebService:NSObject {
    static let shared:WebService = WebService()
    
    fileprivate override init() {
        super.init()
        
        //do any intializations here
    }
    
    func fetchUsersList(_ callback:(_ users:[UserModel])->Void) {
        callback([
            UserModel(id: 1, name: "Sarah Bowers", roleTitle: "Senior Developer", isFavorite: true),
            UserModel(id: 2, name: "Jon Brown", roleTitle: "Tester", isFavorite: false),
            UserModel(id: 3, name: "Erica Downs", roleTitle: "Administrator", isFavorite: false),
            UserModel(id: 4, name: "Sam Host", roleTitle: "Developer", isFavorite: true),
            UserModel(id: 5, name: "Mark Jones", roleTitle: "Senior Developer", isFavorite: true),
            UserModel(id: 6, name: "Melissa Smith", roleTitle: "Administrator", isFavorite: false),
            UserModel(id: 7, name: "Walter Thomas", roleTitle: "Tester", isFavorite: false),
            UserModel(id: 8, name: "Lisa White", roleTitle: "Developer", isFavorite: true)
        ])
    }
}
