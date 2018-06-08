//
//  ClassViewController.swift
//  JsonParsingProject
//
//  Created by Raj kumar on 16/03/1940 Saka.
//  Copyright © 1940 Raj kumar. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {
    
    // Mark:- Variable
    var dataModel : [ModelClass] = []
    
    // Mark:- Outlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    @IBOutlet weak var lblUserID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //Mark:- Code for ApiHandling
       let jsonUriString = "https://jsonplaceholder.typicode.com/posts/1"
       let url = NSURL(string: jsonUriString)
       let request = URLRequest(url: url! as URL)
        
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
            
        //Mark:- Getting data by JSonDecoder
         do{
            let course = try JSONDecoder().decode(ModelClass.self, from: data)
            self.dataModel.append(course)

            
            //Mark:- Traditional way
          //   let data = ModelClass(id: course.id, userId: course.id, title: course.title, body:  course.body)
           // self.dataModel.append(data)

            
                
//            DispatchQueue.main.async {
//                self.lblID.text = "\(data.id)"
//                self.lblUserID.text = "\(data.userId)"
//                self.lblTitle.text = data.title
//                self.lblBody.text = data.body
//            }
//
            
            }catch {
                print("json error: \(error)")
             }
            
            }.resume()
        }
    
}
