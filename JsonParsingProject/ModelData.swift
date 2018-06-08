//
//  ModelData.swift
//  JsonParsingProject
//
//  Created by Raj kumar on 17/03/1940 Saka.
//  Copyright © 1940 Raj kumar. All rights reserved.
//

import Foundation

//Mark- ModelClass
class ModelData: Decodable{
    let email: String
    let id: Int
    let name: String
    let phone: String
    let username: String
    let website: String
    let address: Address2
    let company: Company2
    init(email:String,id: Int,name: String,phone: String,username: String,website: String,address: Address2,comapny: Company2){
        self.email = email
        self.id = id
        self.name = name
        self.phone = phone
        self.username = username
        self.website = website
        self.address = address
        self.company = comapny
    }
}

class Company2: Decodable{
    var bs: String
    var catchPhrase: String
    var name: String
    init(bs: String,catchPhrase: String,name: String){
        self.bs = bs
        self.catchPhrase = catchPhrase
        self.name = name
    }
}

class Address2: Decodable{
    var geo: Geo2
    var street: String
    var suite: String
    var zipcode: String
    init(street:String, suite:String,zipcode: String,geo: Geo2){
        self.street = street
        self.suite = suite
        self.zipcode = zipcode
        self.geo = geo
    }
}

class Geo2: Decodable{
    var latitude: String!
    var longitude: String!
    init(latitude:String,longitude: String){
        self.latitude = latitude
        self.longitude = longitude
    }
}
