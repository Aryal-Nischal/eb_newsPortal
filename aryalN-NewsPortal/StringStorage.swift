//
//  StringStorage.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 11/29/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation

enum Storyboards : String{
    
    case Main
    case NewsPortal
    
}

enum ControllerIdentity : String{
    
    case HomeController
    case UserProfileController
    case FavouriteController
    case settingsController
    case SignInController
    
}




enum DefaultKeys:String {
    
    case username
    case password
    case userEmail
    case userAccessCode
    case appuser
    
}

enum RegexConst:String{
    
    case Email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    case Password = "^\\S{6,}$"
    case Phone = "/^0[0-8]\\d{8}$/g"
    case Name = "^[\\p{L} .'-]+$"
    
}

enum ForServerCall:String{
    
    case currentDeviceID = "CurrentDeviceIdentifierString"
    case domain = "http://192.168.0.180/webSerEx/login/loginRest/"
    
}
enum Trigger:String{

    case login
    case register
    case getdata
    
}

enum FullDomainName:CustomStringConvertible{
    
    case fullname(Trigger)
    
    var description: String{
        switch self {
        case let .fullname(trigger):
            return "\(ForServerCall.domain.rawValue)\(trigger.rawValue)"
        }
    }
    
}

































