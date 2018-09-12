//
//  ViewController.swift
//  MVCDemoApp
//
//  Created by Scott Terry on 9/11/18.
//  Copyright © 2018 Envative. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var users:[UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        WebService.shared.fetchUsersList { [weak self] (users) in
            self?.users = users
            self?.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user:UserModel = users[indexPath.row]
        let cell:UserCell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        
        cell.nameLabel.text = user.name
        cell.roleLabel.text = user.roleTitle
        updateFavoriteButtonTitle(cell.favoriteButton, fromUser: user, atIndexPath: indexPath)
        
        return cell
    }
    
    //MARK: - UI Interactions
    @objc func favoriteButtonWasTapped(_ sender:UIButton) {
        if users.count > sender.tag {
            users[sender.tag].isFavorite = !users[sender.tag].isFavorite
            tableView.reloadData()
        }
    }
    
    //MARK: - Data Binding Helpers
    fileprivate func updateFavoriteButtonTitle(_ button:UIButton, fromUser user:UserModel, atIndexPath indexPath:IndexPath) {
        button.setTitle(user.isFavorite ? "Unfavorite" : "Add to Favorites", for: .normal)
        button.setTitleColor(user.isFavorite ? UIColor.red : UIColor.blue, for: .normal)
        button.tag = indexPath.row
        button.addTarget(self, action: #selector(favoriteButtonWasTapped(_:)), for: .touchUpInside)
    }
}
