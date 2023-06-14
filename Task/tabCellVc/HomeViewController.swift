//
//  HomeViewController.swift
//  Task
//
//  Created by Novastrid on 05/06/23.
//

import UIKit

struct News{
    var Heading: String
    var content: String
    var time: Date
}



struct NbaTeams{
    var teamName:String
    var managerName: String
    var teamLogo: UIImage
    
}

class HomeViewController: UIViewController{
   
    
    @IBOutlet var sideMenuBtn: UIBarButtonItem!

    @IBOutlet var newsTableView: UITableView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var titleCell = CollectionViewCell()

    var model = NbaModel()
    var index:Int = 0


    
    var teams: [NbaTeams] = [
        NbaTeams(teamName: "MIAMI HEAT", managerName: "Manager: ", teamLogo: UIImage(named: "MIAMI HEAT")!),
        NbaTeams(teamName: "LOS ANGELES LAKERS", managerName: "Manager: ",teamLogo: UIImage(named: "LOS ANGELES LAKERS")!),
        NbaTeams(teamName: "PHILADELPHIA 76ERS", managerName: "Manager: ", teamLogo: UIImage(named: "PHILADELPHIA 76ERS")!),
        NbaTeams(teamName: "GOLDEN STATE WARRIORS", managerName: "Manager: ", teamLogo: UIImage(named: "GOLDEN STATE WARRIORS")!),
                 NbaTeams(teamName: "CHICAGO BULLS", managerName: "Manager: ", teamLogo: UIImage(named: "bulls")!)
    ]
    
    
    
    var news :[News] = [
        News(Heading: "CNN", content: "Manchester City wins Champions League for first time, beating Inter Milan 1-0 in tense Istanbul final", time: Date.getDate(date: "14-4-2023")! ),
        News(Heading: "9NEWS", content: "Scientists Capture Supernova As Massive Star Explodes Millions Of Light-Years AwayScientists Capture Supernova As Massive Star Explodes Millions Of Light-Years AwayScientists Capture Supernova As Massive Star Explodes Millions Of Light-Years AwayScientists Capture Supernova As Massive Star Explodes Millions Of Light-Years AwayScientists Capture Supernova As Massive Star Explodes Millions Of Light-Years AwayScientists Capture Supernova As Massive Star Explodes Millions Of Light-Years AwayScientists Capture Supernova As Massive Star Explodes Millions Of Light-Years AwayScientists Capture Supernova As Massive Star Explodes Millions Of Light-Years AwayScientists Capture Supernova As Massive Star Explodes Millions Of Light-Years AwayScientists Capture Supernova As Massive Star Explodes Millions Of Light-Years Away", time: Date.getDate(date: "11-06-2023")!),
        News(Heading: "BBC", content: "Ukraine war: Russia moves to take direct control of Wagner Group", time: .now),
        News(Heading: "Financial Times", content: "Microsoft gives its Xbox Series S game console much-needed storage upgrade, carbon black paintjob: Details", time: Date.getDate(date: "14-4-2016")!),
        News(Heading: "THE HINDU", content: "35 people missing after Ukraine flood: minister", time: Date.getDate(date: "01-6-2023")!),
        News(Heading: "NDTV", content: "Have Faith In Mark Zuckerberg's Leadership? 70% Facebook Employees Say No", time: Date.getDate(date: "11-06-2023")!)// Updated: June 11, 2023 2:42 pm IST//
    ]
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Menu Button Tint Color
        navigationController?.navigationBar.tintColor = .white

        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
        
        newsTableView.delegate = self
        newsTableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.backgroundColor = .clear
        // Register TableView Cell
        self.newsTableView.register(NewsCell.nib, forCellReuseIdentifier: NewsCell.identifier)
        newsTableView.backgroundColor = .black
        
        
        self.newsTableView.register(NbaTeamsTableViewCell.nib, forCellReuseIdentifier: NbaTeamsTableViewCell.identifier)
        
//        var flowLayout = UICollectionViewFlowLayout()
        self.collectionView?.layer.cornerRadius = 32
//        self.collectionView.collectionViewLayout = flowLayout
        
        self.collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: "collectionCell")
        
        self.collectionView.reloadData()
        

        // Update TableView with the data
        self.newsTableView.reloadData()
        
      
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        if index == 0{
            return news.count
        }else{
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.5

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
          let headerView = UIView()
          headerView.backgroundColor = UIColor.clear
          return headerView
      }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        if index == 0{
            guard let cell = newsTableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else { fatalError("xib doesn't exist") }

            cell.selectionStyle = .none
            
            cell.titleLabel.text = news[indexPath.section].Heading
            cell.contentlabel.text = news[indexPath.section].content
            if Calendar.current.isDateInYesterday(news[indexPath.section].time) {
                cell.timeLabel.text  = "Yesterday"
            }else if Calendar.current.isDateInToday(news[indexPath.section].time) {
                cell.timeLabel.text = news[indexPath.section].time.format()

            }else{
                cell.timeLabel.text = news[indexPath.section].time.format()
            }
            
            return cell
        }else {
            guard let cell = newsTableView.dequeueReusableCell(withIdentifier: NbaTeamsTableViewCell.identifier, for: indexPath) as? NbaTeamsTableViewCell else { fatalError("xib doesn't exist") }
            
            cell.selectionStyle = .none
            cell.managerNamelabel.text = model.teams[indexPath.section].managerName
            cell.teamLogo.image = model.teams[indexPath.section].teamLogo
            cell.teamNameLabel.text = model.teams[indexPath.section].teamName
            
            
            let rowArray = model.teams[indexPath.section].players
            cell.updateCellWith(row: rowArray)
            
            return cell
        }
         
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
//        tableView.deselectRow(at: indexPath, animated: true)
    }
}


extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }

//    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
////            cell?.layer.borderWidth = 2.0
//        cell?.backgroundColor = .blue
////        self.titleCell.HighLightView.backgroundColor = .blue
//
//    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
     
        
        if indexPath.item == 0 {
            cell.buttonLabel.text = "News"
            cell.LeftCount.text = news.count.description
            cell.rightCountView.isHidden = true
//            cell.rightCount.isHidden = true
        }else{
            cell.buttonLabel.text = "Sports"
            cell.rightCount.text = model.teams.count.description
//            cell.LeftCount.isHidden = true
            cell.LeftCountView.isHidden = true
        }
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.bounds.width/2, height: 50)
    }
    
    
    
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        if let cell = collectionView.cellForItem(at:indexPath){
//            cell.backgroundColor = UIColor.yellow
//            dismiss(animated: true)
//        }
//        
        if indexPath.item == 1{
            index = 1
        }else {
            index = 0
        }
        print(index)
        newsTableView.reloadData()
        
    }
    
   
    
}
