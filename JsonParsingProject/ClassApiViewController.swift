//
//  ClassApiViewController.swift
//  JsonParsingProject
//
//  Created by Raj kumar on 17/03/1940 Saka.
//  Copyright © 1940 Raj kumar. All rights reserved.
//

import UIKit

class ClassApiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //Mark:- Calling showApi function
        showApi()
    }
    
    //Mark:- ApiHandling code
    func showApi(){
        let jsonUriString = "https://jsonplaceholder.typicode.com/users/1"
        let url = NSURL(string: jsonUriString)
        let request = URLRequest(url: url! as URL)
        
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
            
         //Mark:- Getting data by JSonDecoder
       do{
            let model = try JSONDecoder().decode(ModelData.self, from: data)
            print(model.name , model.address.street)
         }catch{
             print("json error: \(error)")
            }
        }.resume()
    }
}
