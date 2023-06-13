//
//  CollectionViewCell.swift
//  Task
//
//  Created by Novastrid on 12/06/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet var buttonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
