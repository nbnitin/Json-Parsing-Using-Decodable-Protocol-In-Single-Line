//
//  StructViewController.swift
//  JsonParsingProject
//
//  Created by Raj kumar on 16/03/1940 Saka.
//  Copyright © 1940 Raj kumar. All rights reserved.
//

import UIKit

// Mark: Model Struct
struct PostData: Decodable{
    let userId : Int
    let id : Int
    let title : String
    let body : String
}

class StructViewController: UIViewController {
    
    // Mark:- Outlet
    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    //Mark:- Variable
    var postData : [PostData] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //Mark:- Code for Api handling
        let jsonUriString = "https://jsonplaceholder.typicode.com/posts/1"
        let url = NSURL(string: jsonUriString)
        let request = URLRequest(url: url! as URL)
        
        //Mark:- Getting response
        URLSession.shared.dataTask(with: request) { (data, response, error) in
        
        //perhaps check error
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
           let course = try JSONDecoder().decode(PostData.self, from: data)
            //Mark:- Traditional way
//           let postValue = PostData(userId: course.id,
//            id: course.userId, title: course.title, body: course.body)
//           self.postData.append(postValue)
            
            DispatchQueue.main.async {
                self.lblId.text = "\(course.id)"
                self.lblUserId.text = "\(course.userId)"
                self.lblTitle.text = course.title
                self.lblBody.text = course.body
             }
            
            }catch {
                print("json error: \(error)")
            }
          }.resume()
        }
    }
