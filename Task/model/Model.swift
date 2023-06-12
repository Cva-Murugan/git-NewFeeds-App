//
//  Model.swift
//  Task
//
//  Created by Novastrid on 08/06/23.
//

import Foundation
import UIKit

struct ApiValues {
    static var loginStaus = false
    static var token: String!
    
    static func removeToken(){
        UserDefaults.standard.removeObject(forKey: "Token")
    }
}

struct MainModel{
    var statusCode: Int!
    var apiStatus: Bool!
    var user: User!
    var site: Site!
    var token : String!
    var waitingScreenMSG: String!
    var network_medium: String!
    var network_not_enough: String!
    var network_good: String!
    
    init(fromDictionary Dictionry: [String: Any]){
        statusCode = Dictionry["statusCode"] as? Int ?? 0
        apiStatus = Dictionry["apiStatus"] as? Bool ?? false
        token = Dictionry["token"] as? String ?? ""
        waitingScreenMSG = Dictionry["waitingScreenMSG"] as? String ?? ""
        network_medium = Dictionry["network_medium"] as? String ?? ""
        network_not_enough = Dictionry["network_not_enough"] as? String ?? ""
        network_good = Dictionry["network_good"] as? String ?? ""
        
        if let siteData = Dictionry["site"] as? [String: Any] {
            site = Site(fromDictionary: siteData)
        }
        if let userData = Dictionry["user"] as? [String:Any]{
            user = User(fromDictionary: userData)
        }
    }

}


struct User{

    var activeStatus : Int!
    var addedBy : Int!
    var address : String!
    var address2 : String!
    var affiliation : String!
    var appVersion : String!
    var area : String!
    var assistantDetails : String!
    var attendeeType : Int!
    var biography : String!
    var biographyPath : String!
    var capAmount : Int!
    var capMaxLimit : Int!
    var city : String!
    var company : Int!
    var companyName : String!
    var contractDocument : String!
    var createdAt : String!
    var cv : String!
    var cvPath : String!
    var decile : String!
    var degree : String!
    var deleteStatus : Int!
    var department : Int!
    var designation : String!
    var device : String!
    var deviceName : String!
    var deviceToken : AnyObject!
    var district : String!
    var dm : Int!
    var email : String!
    var employeeId : String!
    var encryptedTokenReset : String!
    var firstName : String!
    var foodAndBeverageEligiblity : Int!
    var fullName : String!
    var globalUser : Int!
    var govtEmployee : String!
    var hcpEntityId : Int!
    var homeNumber : String!
    var id : Int!
    var imedId : String!
    var inExternalStatus : Int!
    var institution : String!
    var institutionAddress : String!
    var institutionAddress1 : String!
    var institutionRestriction : String!
    var institutionState : String!
    var institutionZip : String!
    var introVideo : Int!
    var isCloned : Int!
    var isCohostHierarchyDisabled : String!
    var isContentSorter : Int!
    var isCreateEngagementDisable : Int!
    var isCustomerMaster : Int!
    var isMaUser : String!
    var jde : Int!
    var lastName : String!
    var licensedState : String!
    var loginFlag : Int!
    var marketingUser : Int!
    var midName : String!
    var nationalSpeaker : Int!
    var nationalUser : Int!
    var noOfLiveprograms : Int!
    var photo : String!
    var photoPath : String!
    var preferredName : String!
    var prescriber : Int!
    var primaryEmail : String!
    var reconciled : Int!
    var region : String!
    var rep : Int!
    var resetPasswordFlag : Int!
    var residentStatus : Int!
    var role : Int!
    var secondryEmail : String!
    var shipmentTrack : AnyObject!
    var singleBrand : SingleBrand!
    var singleProduct : String!
    var speakerStatus : Int!
    var speciality : String!
    var state : String!
    var stateLicenseNo : String!
    var subscribeToNewsletter : Int!
    var telephone : String!
    var termsCondition : Int!
    var territory : String!
    var tier : Int!
    var title : String!
    var unsubscribe : Int!
    var updatedAt : String!
    var userType : String!
    var vaFlag : Int!
    var veevaId : String!
    var videoPlayPauseUrl : String!
    var videoUpdateSecondsUrl : String!
    var yrsOfExperience : String!
    var zip : String!

    init(fromDictionary dictionary: [String:Any]){
        
        if let singleBrandData = dictionary["singleBrand"] as? [String:Any]{
                singleBrand = SingleBrand(fromDictionary: singleBrandData)
            }
        
        activeStatus = dictionary["active_status"] as? Int ?? 0
        addedBy = dictionary["addedBy"] as? Int  ?? 0
        address = dictionary["address"] as? String ?? ""
        address2 = dictionary["address2"] as? String ?? ""
        affiliation = dictionary["affiliation"] as? String ?? ""
        appVersion = dictionary["appVersion"] as? String ?? ""
        area = dictionary["area"] as? String ?? ""
        assistantDetails = dictionary["assistant_details"] as? String ?? ""
        attendeeType = dictionary["attendeeType"] as? Int ?? 0
        biography = dictionary["biography"] as? String ?? ""
        biographyPath = dictionary["biography_path"] as? String ?? ""
        capAmount = dictionary["cap_amount"] as? Int ?? 0
        capMaxLimit = dictionary["cap_max_limit"] as? Int ?? 0
        city = dictionary["city"] as? String ?? ""
        company = dictionary["company"] as? Int ?? 0
        companyName = dictionary["companyName"] as? String ?? ""
        contractDocument = dictionary["contract_document"] as? String ?? ""
        createdAt = dictionary["createdAt"] as? String ?? ""
        cv = dictionary["cv"] as? String ?? ""
        cvPath = dictionary["cv_path"] as? String ?? ""
        decile = dictionary["decile"] as? String ?? ""
        degree = dictionary["degree"] as? String ?? ""
        deleteStatus = dictionary["delete_status"] as? Int ?? 0
        department = dictionary["department"] as? Int ?? 0
        designation = dictionary["designation"] as? String ?? ""
        device = dictionary["device"] as? String ?? ""
        deviceName = dictionary["deviceName"] as? String ?? ""
        deviceToken = dictionary["deviceToken"] as? AnyObject
        district = dictionary["district"] as? String ?? ""
        dm = dictionary["dm"] as? Int ?? 0
        email = dictionary["email"] as? String ?? ""
        employeeId = dictionary["employee_id"] as? String ?? ""
        encryptedTokenReset = dictionary["encrypted_token_reset"] as? String ?? ""
        firstName = dictionary["firstName"] as? String ?? ""
        foodAndBeverageEligiblity = dictionary["foodAndBeverageEligiblity"] as? Int ?? 0
        fullName = dictionary["fullName"] as? String ?? ""
        globalUser = dictionary["global_user"] as? Int ?? 0
        govtEmployee = dictionary["govt_employee"] as? String ?? ""
        hcpEntityId = dictionary["hcpEntityId"] as? Int ?? 0
        homeNumber = dictionary["home_number"] as? String ?? ""
        id = dictionary["id"] as? Int ?? 0
        imedId = dictionary["imed_id"] as? String ?? ""
        inExternalStatus = dictionary["in_external_status"] as? Int ?? 0
        institution = dictionary["institution"] as? String ?? ""
        institutionAddress = dictionary["institution_address"] as? String ?? ""
        institutionAddress1 = dictionary["institution_address1"] as? String ?? ""
        institutionRestriction = dictionary["institution_restriction"] as? String ?? ""
        institutionState = dictionary["institution_state"] as? String ?? ""
        institutionZip = dictionary["institution_zip"] as? String ?? ""
        introVideo = dictionary["intro_video"] as? Int ?? 0
        isCloned = dictionary["isCloned"] as? Int ?? 0
        isCohostHierarchyDisabled = dictionary["is_cohost_hierarchy_disabled"] as? String ?? ""
        isContentSorter = dictionary["is_content_sorter"] as? Int ?? 0
        isCreateEngagementDisable = dictionary["is_create_engagement_disable"] as? Int ?? 0
        isCustomerMaster = dictionary["is_customer_master"] as? Int ?? 0
        isMaUser = dictionary["is_ma_user"] as? String ?? ""
        jde = dictionary["jde"] as? Int ?? 0
        lastName = dictionary["lastName"] as? String ?? ""
        licensedState = dictionary["licensed_state"] as? String ?? ""
        loginFlag = dictionary["login_flag"] as? Int ?? 0
        marketingUser = dictionary["marketing_user"] as? Int ?? 0
        midName = dictionary["midName"] as? String ?? ""
        nationalSpeaker = dictionary["nationalSpeaker"] as? Int ?? 0
        nationalUser = dictionary["national_user"] as? Int ?? 0
        noOfLiveprograms = dictionary["no_of_liveprograms"] as? Int ?? 0
        photo = dictionary["photo"] as? String ?? ""
        photoPath = dictionary["photo_path"] as? String ?? ""
        preferredName = dictionary["preferred_name"] as? String ?? ""
        prescriber = dictionary["prescriber"] as? Int ?? 0
        primaryEmail = dictionary["primary_email"] as? String ?? ""
        reconciled = dictionary["reconciled"] as? Int ?? 0
        region = dictionary["region"] as? String ?? ""
        rep = dictionary["rep"] as? Int ?? 0
        resetPasswordFlag = dictionary["reset_password_flag"] as? Int ?? 0
        residentStatus = dictionary["resident_status"] as? Int ?? 0
        role = dictionary["role"] as? Int ?? 0
        secondryEmail = dictionary["secondry_email"] as? String ?? ""
        shipmentTrack = dictionary["shipment_track"] as? AnyObject
        
        singleProduct = dictionary["singleProduct"] as? String ?? ""
        speakerStatus = dictionary["speaker_status"] as? Int ?? 0
        speciality = dictionary["speciality"] as? String ?? ""
        state = dictionary["state"] as? String ?? ""
        stateLicenseNo = dictionary["state_license_no"] as? String ?? ""
        subscribeToNewsletter = dictionary["subscribe_to_newsletter"] as? Int ?? 0
        telephone = dictionary["telephone"] as? String ?? ""
        termsCondition = dictionary["terms_condition"] as? Int ?? 0
        territory = dictionary["territory"] as? String ?? ""
        tier = dictionary["tier"] as? Int ?? 0
        title = dictionary["title"] as? String ?? ""
        unsubscribe = dictionary["unsubscribe"] as? Int  ?? 0
        updatedAt = dictionary["updatedAt"] as? String ?? ""
        userType = dictionary["userType"] as? String ?? ""
        vaFlag = dictionary["va_flag"] as? Int ?? 0
        veevaId = dictionary["veeva_id"] as? String ?? ""
        videoPlayPauseUrl = dictionary["video_play_pause_url"] as? String ?? ""
        videoUpdateSecondsUrl = dictionary["video_update_seconds_url"] as? String ?? ""
        yrsOfExperience = dictionary["yrsOfExperience"] as? String ?? ""
        zip = dictionary["zip"] as? String ?? ""
    }

}

struct SingleBrand{
    var brandProduct: [Any]! // []
    var brand_name: String!
    var brand_image: String!
    var upload_path: String!
    var is_budget_check: Int!
    var original_brand_image: String!
    var dial_number: String!
    var is_dial_in: Int!
    var active_status: Int!
    var delete_status: Int!
    var created_by: Int!
    var updated_by: Int!
    var id: Int!
    var createdAt: String!
    var updatedAt: String!
    var company : String!
    
    init(fromDictionary Dictionary: [String: Any]){

        brandProduct = Dictionary["brandProduct"] as? [Any] /////////////////////
        brand_name = Dictionary["brand_name"] as? String ?? ""
        brand_image = Dictionary["brand_image"] as? String ?? ""
        upload_path = Dictionary["upload_path"] as? String ?? ""
        is_budget_check = Dictionary["is_budget_check"] as? Int ?? 0
        original_brand_image = Dictionary["original_brand_image"] as? String ?? ""
        dial_number = Dictionary["dial_number"] as? String ??  ""
        active_status = Dictionary["active_status"] as? Int ?? 0
        delete_status = Dictionary["delete_status"] as? Int ?? 0
        created_by = Dictionary["created_by"] as? Int ?? 0
        updated_by = Dictionary["updated_by"] as? Int ?? 0
        id = Dictionary["id"] as? Int ?? 0
        createdAt = Dictionary["createdAt"] as? String ?? ""
        updatedAt = Dictionary["updatedAt"] as? String ?? ""
        company = Dictionary["company"] as? String ?? ""
        
    }
    
    
}

struct Site{
    var apiUrl: String!
    var firebase: Firebase!
    var tokbox: Tokbox!
    var weburl: Weburl!
    var config: Config!
    
    init(fromDictionary Dictionary: [String: Any]){
        apiUrl = Dictionary["apiUrl"] as? String ?? ""
        
        if let firebaseData = Dictionary["firebase"] as? [String: Any] {
             firebase = Firebase(fromDictionary: firebaseData)
        }
        if let tokboxData = Dictionary["tokbox"] as? [String: Any] {
            tokbox = Tokbox(fromDictionary: tokboxData)
        }
        if let weburlData = Dictionary["weburl"] as? [String: Any] {
            weburl = Weburl(fromDictionary: weburlData)
        }
        if let configData = Dictionary["config"] as? [String: Any] {
            config = Config(fromDictionary: configData)
        }
        
    }
}

struct Firebase{
    var apiKey:String!
    var authDomain: String!
    var databaseURL: String!
    var projectId: String!
    var firebaseAccess: String!
    var messagingSenderId: String!
    var gcmPusherKey: String!
    
    init(fromDictionary Dictionary: [String: Any]){
        apiKey = Dictionary["apiKey"] as? String ?? ""
        authDomain = Dictionary["authDomain"] as? String ?? ""
        databaseURL = Dictionary["databaseURL"] as? String ?? ""
        projectId = Dictionary["projectId"] as? String ?? ""
        firebaseAccess = Dictionary["firebaseAccess"] as? String ?? ""
        messagingSenderId = Dictionary["messagingSenderId"] as? String ?? ""
        gcmPusherKey = Dictionary["gcmPusherKey"] as? String ?? ""
    }
    
}

struct Tokbox{
    var apikey: String!
    var extid: String!
    
    init(fromDictionary Dictionary: [String: Any]){
        apikey = Dictionary["apiKey"] as? String ?? ""
        extid = Dictionary["extid"] as? String ?? ""
    }
}

struct Weburl{
    var content: String!
    var prevuew: String! // preview
    var faq: String!
    var introvideo: String!
    
    init(fromDictionary Dictionary: [String: Any]){
        content = Dictionary["apiKey"] as? String ?? ""
        faq = Dictionary["faq"] as? String ?? ""
        prevuew = Dictionary["prevuew"] as? String ?? ""
        introvideo = Dictionary["introvideo"] as? String ?? ""
    }
    
}

struct Config{
    var leftmenu: [leftmenuDetails]!
    var bottommenu: [bottommenuDetails]!
    /////////////
    
    init(fromDictionary dictionary: [String:Any]){
//            bottommenu = [bottommenuDetails]() ///////////////////////
    
            if let bottommenuArray = dictionary["bottommenu"] as? [[String:Any]]{
                for dic in bottommenuArray{
                    let value = bottommenuDetails(fromDictionary: dic)
                    bottommenu.append(value)
                }
            }
        
//            leftmenu = [leftmenuDetails]()
            if let leftmenuArray = dictionary["leftmenu"] as? [[String:Any]]{
                for dic in leftmenuArray{
                    let value = leftmenuDetails(fromDictionary: dic)
                    leftmenu.append(value)
                }
            }
    }
}


struct leftmenuDetails{
    var label_name: String!
    var icon_selected: String!
    var icon_unselected: String!
    var click_action: String!
    var link: String? //
    
    init(fromDictionary Dictionary: [String: Any]){
        label_name = Dictionary["label_name"] as? String ?? ""
        icon_selected = Dictionary["icon_selected"] as? String ?? ""
        icon_unselected = Dictionary["icon_unselected"] as? String ?? ""
        click_action = Dictionary["click_action"] as? String ?? ""
        link = Dictionary["link"] as? String ?? ""
    }
    
}

struct bottommenuDetails{
    var label_name : String!
    var click_action: String!
    var icon_selected: String!
    var icon_unselected: String!
    var selected_textcolor: String!
    var unselected_textcolor: String!
    
    init(fromDictionary Dictionary: [String: Any]){
        label_name = Dictionary["label_name"] as? String ?? ""
        icon_selected = Dictionary["icon_selected"] as? String ?? ""
        icon_unselected = Dictionary["icon_unselected"] as? String ?? ""
        click_action = Dictionary["click_action"] as? String ?? ""
        selected_textcolor = Dictionary["selected_textcolor"] as? String ?? ""
        unselected_textcolor = Dictionary["unselected_textcolor"] as? String ?? ""
    }
    
}
