//
//  NewsCell.swift
//  Task
//
//  Created by Novastrid on 12/06/23.
//

import Foundation
import UIKit

class NewsCell: UITableViewCell{
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentlabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Background
        self.backgroundColor = .clear
    
        // Title
        self.titleLabel.textColor = .black
        
        self.contentlabel.textColor = .gray
        
        self.timeLabel.textColor = .black
        
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.layer.cornerRadius =  10
    }
    
//    override func layoutSubviews() {
//       // Set the width of the cell
//       self.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width - 40, height: self.bounds.size.height)
//       super.layoutSubviews()
//        
//
//   }
}
