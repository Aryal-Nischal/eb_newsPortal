//
//  NewsFeedManager.swift
//  aryalN-NewsPortal
//
//  Created by dev9 on 12/2/16.
//  Copyright © 2016 ebpearls. All rights reserved.
//

import Foundation

typealias sendData = (_ newsData:Any?,_ error:String?)->()

class NewsFeedManager{
    
    func callServerForNews(newsObject:Any?, giveNews:sendData){
        
        //call alamofire for the news data and send data to controller for unpacking
        
    }
    
}
