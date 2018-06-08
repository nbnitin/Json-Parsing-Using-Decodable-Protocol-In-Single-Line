//
//  ArrayStructViewController.swift
//  JsonParsingProject
//
//  Created by Raj kumar on 16/03/1940 Saka.
//  Copyright © 1940 Raj kumar. All rights reserved.
//

import UIKit

//Mark:- Model Struct
struct PostArray: Decodable{
    let userId : Int
    let id : Int
    let title : String
    let body : String
}

class ArrayStructViewController: UIViewController {

    //Mark:- Variable
     var postArray :[PostArray] = []

     override func viewDidLoad() {
         super.viewDidLoad()
        
        //Mark:- Calling func apiHandler
         apiHandler()
     }

    //Mark:- Api Handling Code
     func apiHandler(){
        let jsonUriString = "https://jsonplaceholder.typicode.com/posts"
        let url = NSURL(string: jsonUriString)
        let request = URLRequest(url: url! as URL)
        
        // Mark:- getting response
        URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        //perhaps check error
        if error != nil {
             print("error receiving data \(String(describing: url))")
         }
            
         //also perhapes check response status 200 OK
         if let httpResponse = response as? HTTPURLResponse {
            print("error \(httpResponse.statusCode)")
        }
            
        guard let data = data else { return }
            
        //Mark:- Getting by JSONDecoder
     do{
         self.postArray = try JSONDecoder().decode([PostArray].self, from: data)
            for eachPost in self.postArray{
                  print(eachPost.id)
             }
        }catch {
            print("json error: \(error)")
           }
        }.resume()
     }
}
