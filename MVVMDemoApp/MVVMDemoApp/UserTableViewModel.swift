//
//  UserTableViewModel.swift
//  MVVMDemoApp
//
//  Created by Scott Terry on 9/11/18.
//  Copyright © 2018 Envative. All rights reserved.
//

import UIKit

class UserTableViewModel: NSObject {
    fileprivate var cellViewModels:[UserCellViewModel] = []
    var notifyUpdate:(()->Void)?
    
    init(notifyUpdate notify:@escaping ()->Void) {
        super.init()
        
        notifyUpdate = notify
        
        WebService.shared.fetchUsersList { [weak self] (users) in
            self?.processUsers(users)
            self?.notifyUpdate?()
        }
    }
    
    fileprivate func processUsers(_ users:[UserModel]) {
        cellViewModels = users.map{ UserCellViewModel($0, notifyUpdate: { [weak self] () in
            
            self?.notifyUpdate?()
        })}
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section:Int) -> Int {
        return cellViewModels.count
    }
    
    func viewModelAt(_ indexPath:IndexPath) -> UserCellViewModel {
        return cellViewModels[indexPath.row]
    }
 }
