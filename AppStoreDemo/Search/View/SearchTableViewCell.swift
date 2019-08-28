//
//  SearchTableViewCell.swift
//  AppStoreDemo
//
//  Created by Allen long on 2019/8/2.
//  Copyright © 2019 Utimes. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    var canChangeHightlighted: Bool = false {
        didSet {
            if !canChangeHightlighted {
                textLabel?.textColor = .black
            }
        }
    }    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if !canChangeHightlighted { return }
        
        if highlighted {
            textLabel?.textColor = .white
            backgroundColor = GlobalConstants.textBlueColor
        } else {
            textLabel?.textColor = GlobalConstants.textBlueColor
            backgroundColor = .white
        }        
    }        
    
    private func setupUI() {
        textLabel?.textColor = GlobalConstants.textBlueColor
        textLabel?.font = UIFont.systemFont(ofSize: 19)
        selectionStyle = .none
    }
}
