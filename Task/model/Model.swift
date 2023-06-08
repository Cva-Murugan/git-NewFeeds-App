//
//  Model.swift
//  Task
//
//  Created by Novastrid on 08/06/23.
//

import Foundation


struct MainModel{
    var statusCode: Int
    var apiStatus: String
    var user: User
    var site: Site
    var token : String
    var waitingScreenMSG: String
    var network_medium: String
    var network_not_enough: String
    var network_good: String
}

struct User{
    var firstName: String
    var lastName: String
    var midName: String
    var address2: String
    var affiliation: String
    var govt_employee: String
    var licensed_state: String
    var fullName: String
    var preferred_name: String
    var email: String
    var home_number: String
    var telephone: String
    var degree: String
    var speciality: String
    var institution: String
    var address: String
    var city: String
    var state: String
    var zip: String
    var prescriber: Int
    var area: String
    var region:String
    var district:String
    var territory: String
    var yrsOfExperience:String
    var biography: String
    var biography_path: String
    var cv: String
    var cv_path:String
    var photo: String
    var photo_path: String
    var institution_address: String
    var institution_address1: String
    var institution_state: String
    var institution_zip: String
    var institution_restriction: String
    var primary_email: String
    var secondry_email: String
    var decile: String
    var designation:String
    var companyName: String
    var userType: String
    var attendeeType: Int
    var no_of_liveprograms: Int
    var cap_amount: Int
    var cap_max_limit: Int
    var speaker_status: Int
    var active_status: Int
    var delete_status: Int
    var deviceToken: String //null
    var encrypted_token_reset: String
    var terms_condition: Int
    var reset_password_flag: Int
    var unsubscribe: Int
    var subscribe_to_newsletter: Int
    var intro_video: Int
    var employee_id: String
    var imed_id: String
    var tier: Int
    var login_flag: Int
    var va_flag: Int
    var title: String
    var isCloned: Int
    var device: String
    var deviceName: String
    var appVersion: String
    var assistant_details: String
    var foodAndBeverageEligiblity: Int
    var resident_status: Int
    var nationalSpeaker: Int
    var reconciled: Int
    var hcpEntityId: Int
    var in_external_status: Int
    var is_customer_master: Int
    var veeva_id: String
    var contract_document: String
    var shipment_track: String
    var jde: Int
    var state_license_no: Int
    var id : Int
    var createdAt: String
    var updatedAt: String
    var rep: Int
    var dm: Int
    var company: Int
    var role: Int
    var addedBy: Int
    var department: Int
    var is_content_sorter: Int
    var is_create_engagement_disable: Int
    var national_user: Int
    var marketing_user: Int
    var is_ma_user: String
    var video_play_pause_url: String
    var video_update_seconds_url: String
    var is_cohost_hierarchy_disabled: String
    var global_user: String
    var singleBrand:SingleBrand
    var singleProduct:String
}

struct SingleBrand{
    var brandProduct: [String] // []
    var brand_name: String
    var brand_image: String
    var upload_path: String
    var is_budget_check: Int
    var original_brand_image: String
    var dial_number: String
    var is_dial_in: Int
    var active_status: Int
    var delete_status: Int
    var created_by: Int
    var updated_by: Int
    var id: Int
    var createdAt: String
    var updatedAt: String
    var company : String
}

struct Site{
    var apiUrl: String
    var firebase: Firebase
    var tokbox: Tokbox
    var weburl: Weburl
    var config: Config
}

struct Firebase{
    var apiKey:String
    var authDomain: String
    var databaseURL: String
    var projectId: String
    var firebaseAccess: String
    var messagingSenderId: String
    var gcmPusherKey: String
}

struct Tokbox{
    var apikey: String
    var extid: String
}

struct Weburl{
    var content: String
    var prevuew: String // preview
    var faq: String
    var introvideo: String
}

struct Config{
    var leftmenu: [[String: String]]
    var bottommenu: [[String: String]]
}
