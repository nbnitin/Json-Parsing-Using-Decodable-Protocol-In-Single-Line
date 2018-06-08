//
//  ClassArrayViewController.swift
//  JsonParsingProject
//
//  Created by Raj kumar on 17/03/1940 Saka.
//  Copyright © 1940 Raj kumar. All rights reserved.
//

import UIKit

// Mark:- Model Class
class ClassArray: Decodable{
    let userId : Int
    let id : Int
    let title : String
    let body : String
    
}
class ClassArrayViewController: UIViewController {
    
    //Mark:- Variable
    var classArray: [ClassArray] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mark:- Calling apiHandler function
        apiHandler()
    }
    //Mark:- Api Handling Code using NSURl
    func apiHandler(){
        let jsonUriString = "https://jsonplaceholder.typicode.com/posts"
        let url = NSURL(string: jsonUriString)
        let request = URLRequest(url: url! as URL)
        
        //Mark:- Getting response
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
        //Perhaps check error
        if error != nil {
            print("error receiving data \(String(describing: url))")
         }
            
        //Also perhapes check response status 200 OK
        if let httpResponse = response as? HTTPURLResponse {
            print("error \(httpResponse.statusCode)")
        }
            
        guard let data = data else { return }
            
        //Mark:- Getting by JSONDecoder
     do{
         self.classArray = try JSONDecoder().decode([ClassArray].self, from: data)
            for eachPost in self.classArray{
                print(eachPost.id)
            }
        }catch {
                print("json error: \(error)")
            }
        }.resume()
    }
}
