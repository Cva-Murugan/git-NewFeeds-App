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
    @IBOutlet var rightCount: UILabel!
    @IBOutlet var LeftCount: UILabel!
    @IBOutlet var rightCountView: UIView!
    @IBOutlet var LeftCountView: UIView!
    @IBOutlet var HighLightView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override var isSelected: Bool {
        didSet{
            if self.isSelected {
                UIView.animate(withDuration: 0.3) { // for animation effect
                    self.backgroundColor = UIColor(red: 115/255, green: 190/255, blue: 170/255, alpha: 1.0)
                }
            }
            else {
                UIView.animate(withDuration: 0.3) { // for animation effect
                    self.backgroundColor = UIColor(red: 60/255, green: 63/255, blue: 73/255, alpha: 1.0)
                }
            }
        }
    }
}
