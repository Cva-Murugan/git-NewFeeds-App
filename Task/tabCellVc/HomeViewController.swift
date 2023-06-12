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


class HomeViewController: UIViewController{
   
    
    @IBOutlet var sideMenuBtn: UIBarButtonItem!

    @IBOutlet var newsTableView: UITableView!
    
    var cellSpacingHeight: CGFloat = 10
    
    
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
        
        view.backgroundColor = .clear
        // Register TableView Cell
        self.newsTableView.register(NewsCell.nib, forCellReuseIdentifier: NewsCell.identifier)
        newsTableView.backgroundColor = .black
        
//        newsTableView.translatesAutoresizingMaskIntoConstraints = false
//        newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        // Update TableView with the data
        self.newsTableView.reloadData()
        
      
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as? NewsCell else { fatalError("xib doesn't exist") }

        cell.selectionStyle = .none
        
//        cell.isHighlighted = false
        cell.titleLabel.text = news[indexPath.section].Heading
        
        cell.contentlabel.text = news[indexPath.section].content
        
//        cell.timeLabel.text = news[indexPath.section].time.format()
        
        
        if Calendar.current.isDateInYesterday(news[indexPath.section].time) {
            cell.timeLabel.text  = "Yesterday"
        }else if Calendar.current.isDateInToday(news[indexPath.section].time) {
            cell.timeLabel.text = news[indexPath.section].time.format()
            
//            let minute:TimeInterval = 60.0
//            let hour:TimeInterval = 60.0 * minute
//            let _:TimeInterval = 24 * hour
//
//            var ineterval =  Date(timeInterval: hour, since: news[indexPath.section].time)
//            print(ineterval)
        }else{
            cell.timeLabel.text = news[indexPath.section].time.format()
        }
         
        
        if let diff = Calendar.current.dateComponents([.hour], from: news[indexPath.section].time, to: Date()).hour, diff < 48 {
               print(diff)
           }
//        let diff = Calendar.current.dateComponents([.hour], from: news[indexPath.section].time, to:.now)
//        if diff["hour"] <= 43{
//            print(diff)
//        }
        
        
//        let formatter = DateFormatter()
//        if Calendar.current.isDateInToday(news[indexPath.section].time) {
//            formatter.dateFormat = "h:mm a"
//            let ineterval = Date().timeIntervalSince(news[indexPath.section].time)
//            print(ineterval)
//        }
        
//        cell.backgroundColor = UIColor.white
//        cell.layer.borderColor = UIColor.black.cgColor
//        cell.layer.borderWidth = 1
//        cell.layer.cornerRadius = 10
//        cell.clipsToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
