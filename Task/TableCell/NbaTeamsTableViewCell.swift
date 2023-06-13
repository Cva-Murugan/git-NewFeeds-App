//
//  NbaTeamsTableViewCell.swift
//  Task
//
//  Created by Novastrid on 13/06/23.
//

import UIKit




class NbaTeamsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nbaCellView : UIView!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var managerNamelabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var plyerDetails:[Players]!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nbaCellView.translatesAutoresizingMaskIntoConstraints = false
        nbaCellView.layer.cornerRadius =  10
        
        
        let flowLayout = UICollectionViewFlowLayout()
             flowLayout.scrollDirection = .horizontal
             flowLayout.itemSize = CGSize(width: 131, height: 131)
             flowLayout.minimumLineSpacing = 2.0
             flowLayout.minimumInteritemSpacing = 5.0
             self.collectionView.collectionViewLayout = flowLayout
        
        
        self.collectionView.showsHorizontalScrollIndicator = false

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(PlyersCollectionViewCell.nib, forCellWithReuseIdentifier: PlyersCollectionViewCell.identifier)
        
        
    }

}

extension NbaTeamsTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    func updateCellWith(row: [Players]) {
        self.plyerDetails = row
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plyerDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlyersCollectionViewCell.identifier, for: indexPath) as! PlyersCollectionViewCell
        
        cell.height.text = self.plyerDetails[indexPath.row].hight
        cell.name.text = self.plyerDetails[indexPath.row].name
        cell.image.image = self.plyerDetails[indexPath.row].playerImg
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 200, height: collectionView.frame.size.height)
////            .init(width: collectionView.bounds.width/2, height: 50)
//    }
    
    
    func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            minimumInteritemSpacingForSectionAt section: Int
        ) -> CGFloat {
            0
        }

    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        0
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//          return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
//      }
}
