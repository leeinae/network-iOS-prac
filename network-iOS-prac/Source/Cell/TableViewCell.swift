//
//  TableViewCell.swift
//  network-iOS-prac
//
//  Created by inae Lee on 2020/11/26.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"

    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension TableViewCell {
    func setCell(person: Person) {
        idLabel.text = "\(person.id)"
        idLabel.sizeToFit()
        
        nicknameLabel.text = person.nickname
        nicknameLabel.sizeToFit()
        
        thumbnail.kf.setImage(with: URL(string: person.url))
    }
}
