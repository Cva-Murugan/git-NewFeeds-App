//
//  PlyersCollectionViewCell.swift
//  Task
//
//  Created by Novastrid on 13/06/23.
//

import UIKit

class PlyersCollectionViewCell: UICollectionViewCell {

    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
