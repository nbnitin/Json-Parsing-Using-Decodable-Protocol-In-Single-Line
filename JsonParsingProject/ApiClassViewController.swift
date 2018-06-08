//
//  ApiClassViewController.swift
//  JsonParsingProject
//
//  Created by Raj kumar on 16/03/1940 Saka.
//  Copyright © 1940 Raj kumar. All rights reserved.
//

import UIKit
//Mark:- Model Struct
struct Model: Decodable{
    let id : Int
    let name : String
    let username : String
    let email : String
    let phone : String
    let website : String
    let address : Address
    let company : Company
}

struct Company: Decodable{
    let name: String
    let catchPhrase : String
    let bs : String
}

struct Address: Decodable{
    let street : String
    let suite : String
    let city : String
    let zipcode : String
    let geo : Geo
}
struct Geo: Decodable{
    let lat : String
    let lng : String
}

class ApiClassViewController: UIViewController {
    
    //Mark:- Outlet
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblStreet: UILabel!
    
    @IBOutlet weak var lblCompanyName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Mark:- Calling showApi
        showApi()
    }
    
    //Mark:- ApiHandling code by NSURl 
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
         let model = try JSONDecoder().decode(Model.self, from: data)
            print(model.name,model.address.street,model.company.name)
            
            DispatchQueue.main.async {
                self.lblCity.text = model.address.city
                self.lblName.text = model.name
          }
        }catch {
                print("json error: \(error)")
        }
            
      }.resume()
    }
}
