//
//  ModelClass.swift
//  JsonParsingProject
//
//  Created by Raj kumar on 16/03/1940 Saka.
//  Copyright © 1940 Raj kumar. All rights reserved.
//

import Foundation

//Mark:- ModelClass
class ModelClass: Decodable{
    let userId : Int
    let id : Int
    let title : String
    let body : String
    
   init(id: Int, userId: Int, title: String, body: String){
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
}
