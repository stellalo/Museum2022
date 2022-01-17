//
//  Museum.swift
//  Museum2022
//
//  Created by stella on 2022-01-17.
//

import Foundation
class Museum : Identifiable, Decodable, ObservableObject{
    //making it optional --> nil by default
    var id:UUID?
    var index:String
    var Name:String
    var Category:String
    var image:String
    var city:String
    var country:String
    var photo:[String]
    var date:String
    var address:String
    var director:String
    var visited:Bool
    var favorite:Bool
    var tovisit:Bool
    var introduction:String
    var url:String?
    var famous:[Collection]
}
class Collection: Identifiable, Decodable{
    var id: Int?
    var pic:String?
    var name:String?
    var artist:String?
    var date2:String?
    var material:String?
    var location:String?
}
