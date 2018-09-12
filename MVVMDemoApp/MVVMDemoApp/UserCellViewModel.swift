//
//  UserCellViewModel.swift
//  MVVMDemoApp
//
//  Created by Scott Terry on 9/11/18.
//  Copyright © 2018 Envative. All rights reserved.
//

import UIKit

class UserCellViewModel: NSObject {
    var user:UserModel!
    var notifyUpdate:(()->Void)?
    
    var nameText:String {
        return user.name
    }
    
    var roleTitleText:String {
        return user.roleTitle
    }
    
    var isFavorite:Bool {
        return user.isFavorite
    }
    
    init(_ model:UserModel, notifyUpdate notify:@escaping ()->Void) {
        super.init()
        
        user = model
        notifyUpdate = notify
    }
    
    func toggleIsFavorite() {
        user.isFavorite = !user.isFavorite
        notifyUpdate?()
    }
}
