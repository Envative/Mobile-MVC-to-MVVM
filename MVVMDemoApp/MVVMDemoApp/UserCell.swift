//
//  UserCell.swift
//  MVVMDemoApp
//
//  Created by Scott Terry on 9/11/18.
//  Copyright © 2018 Envative. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var cellModel:UserCellViewModel! {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        favoriteButton.addTarget(self, action: #selector(favoriteButtonWasTapped(_:)), for: .touchUpInside)
    }
    
    //MARK: - Data Binding Helpers
    func updateView() {
        nameLabel.text = cellModel.nameText
        roleLabel.text = cellModel.roleTitleText
        favoriteButton.setTitle(cellModel.isFavorite ? "Unfavorite" : "Add to Favorites", for: .normal)
        favoriteButton.setTitleColor(cellModel.isFavorite ? UIColor.red : UIColor.blue, for: .normal)
    }
    
    //MARK: - UI Interactions
    @objc func favoriteButtonWasTapped(_ sender:UIButton) {
        cellModel.toggleIsFavorite()
    }
}
