//
//  NbaModel.swift
//  Task
//
//  Created by Novastrid on 13/06/23.
//

import Foundation
import UIKit

struct Players{
    var playerImg :UIImage
    var name: String
    var hight: String
}

struct Teams{
    var teamName:String
    var managerName: String
    var teamLogo: UIImage
    var players : [Players] // [[]]??
}

struct NbaModel{
    
    var teams: [Teams] = [
        Teams(teamName: "MIAMI HEAT", managerName: "Manager: Erik Spoelstra", teamLogo: UIImage(named: "MIAMI HEAT")!, players: [
            Players(playerImg: UIImage(named: "lakers1")!, name: "LEBRON JAMES", hight: "hight:6'7"),
            Players(playerImg: UIImage(named: "lakers2")!, name: "ANTHONY DAVIS", hight: "hight:6'9"),
            Players(playerImg: UIImage(named: "lakers3")!, name: "D'ANGELO RUSSELL", hight: "hight:6'1"),
            Players(playerImg: UIImage(named: "lakers4")!, name: "DENNIS SCHRODER", hight: "hight:6'0"),
            Players(playerImg: UIImage(named: "lakers5")!, name: "THOMAS BRYANT", hight: "hight:6'1"),
            Players(playerImg: UIImage(named: "lakers6")!, name: "RUSSELL WESTBROOK", hight: "hight:6'3")
        ]),
        Teams(teamName: "LOS ANGELES LAKERS", managerName: "Manager: Darvin Ham ",teamLogo: UIImage(named: "LOS ANGELES LAKERS")!, players: [
            Players(playerImg: UIImage(named: "lakers2")!, name: "LEBRON JAMES", hight: "hight:6'7"),
            Players(playerImg: UIImage(named: "lakers1")!, name: "ANTHONY DAVIS", hight: "hight:6'9"),
            Players(playerImg: UIImage(named: "lakers3")!, name: "D'ANGELO RUSSELL", hight: "hight:6'1"),
            Players(playerImg: UIImage(named: "lakers4")!, name: "DENNIS SCHRODER", hight: "hight:6'0"),
            Players(playerImg: UIImage(named: "lakers5")!, name: "THOMAS BRYANT", hight: "hight:6'1"),
            Players(playerImg: UIImage(named: "lakers6")!, name: "RUSSELL WESTBROOK", hight: "hight:6'3")
        ]),
        Teams(teamName: "PHILADELPHIA 76ERS", managerName: "Manager: Nick Nurse ", teamLogo: UIImage(named: "PHILADELPHIA 76ERS")!, players: [
            Players(playerImg: UIImage(named: "lakers1")!, name: "LEBRON JAMES", hight: "hight:6'7"),
            Players(playerImg: UIImage(named: "lakers2")!, name: "ANTHONY DAVIS", hight: "hight:6'9"),
            Players(playerImg: UIImage(named: "lakers3")!, name: "D'ANGELO RUSSELL", hight: "hight:6'1"),
            Players(playerImg: UIImage(named: "lakers4")!, name: "DENNIS SCHRODER", hight: "hight:6'0"),
            Players(playerImg: UIImage(named: "lakers5")!, name: "THOMAS BRYANT", hight: "hight:6'1"),
            Players(playerImg: UIImage(named: "lakers6")!, name: "RUSSELL WESTBROOK", hight: "hight:6'3")
        ]),
        Teams(teamName: "GOLDEN STATE WARRIORS", managerName: "Manager: Steve Kerr", teamLogo: UIImage(named: "GOLDEN STATE WARRIORS")!, players: [
            Players(playerImg: UIImage(named: "lakers1")!, name: "LEBRON JAMES", hight: "hight:6'7"),
            Players(playerImg: UIImage(named: "lakers2")!, name: "ANTHONY DAVIS", hight: "hight:6'9"),
            Players(playerImg: UIImage(named: "lakers3")!, name: "D'ANGELO RUSSELL", hight: "hight:6'1"),
            Players(playerImg: UIImage(named: "lakers4")!, name: "DENNIS SCHRODER", hight: "hight:6'0"),
            Players(playerImg: UIImage(named: "lakers5")!, name: "THOMAS BRYANT", hight: "hight:6'1"),
            Players(playerImg: UIImage(named: "lakers6")!, name: "RUSSELL WESTBROOK", hight: "hight:6'3")
        ]),
        Teams(teamName: "CHICAGO BULLS", managerName: "Manager: Billy Donovan", teamLogo: UIImage(named: "bulls")!, players: [
            Players(playerImg: UIImage(named: "lakers1")!, name: "LEBRON JAMES", hight: "hight:6'7"),
            Players(playerImg: UIImage(named: "lakers2")!, name: "ANTHONY DAVIS", hight: "hight:6'9"),
            Players(playerImg: UIImage(named: "lakers3")!, name: "D'ANGELO RUSSELL", hight: "hight:6'1"),
            Players(playerImg: UIImage(named: "lakers4")!, name: "DENNIS SCHRODER", hight: "hight:6'0"),
            Players(playerImg: UIImage(named: "lakers5")!, name: "THOMAS BRYANT", hight: "hight:6'1"),
            Players(playerImg: UIImage(named: "lakers6")!, name: "RUSSELL WESTBROOK", hight: "hight:6'3")])
    ]
    
}
