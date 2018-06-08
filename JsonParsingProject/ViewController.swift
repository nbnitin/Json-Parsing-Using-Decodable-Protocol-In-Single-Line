//
//  ViewController.swift
//  JsonParsingProject
//
//  Created by Raj kumar on 16/03/1940 Saka.
//  Copyright © 1940 Raj kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    //Mark:- Outlet
    @IBOutlet weak var tbl: UITableView!
    
    //Mark:- Veriable
    var parsingName = ["JsonParing Using Struct","JsonParing Using Class","JsonParing Using StructArray","JsonParing Using ComplexApi","JsonParing Using Classarray","JsonParing Using Classapi"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Mark:- DataSoure Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parsingName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = parsingName[indexPath.row]
        return cell
    }
    
    //Mark:- Method for selcting index
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 0
        {
            print("segue1")
            self.performSegue(withIdentifier: "structDetail", sender: self)
        }
        if indexPath.row == 1
        {
            print("Segue2")
            self.performSegue(withIdentifier: "classDetail", sender: self)
        }
       
        if indexPath.row == 2
        {
            print("Segue3")
            self.performSegue(withIdentifier: "arrayDetail", sender: self)
        }
     
        if indexPath.row == 3
        {
            print("Segue4")
            self.performSegue(withIdentifier: "apiDetail", sender: self)
        }
        if indexPath.row == 4
        {
            print("Segue5")
            self.performSegue(withIdentifier: "classArrayDetail", sender: self)
        }
        if indexPath.row == 5
        {
            print("Segue6")
            self.performSegue(withIdentifier: "classApiDetail", sender: self)
        }
        
    }
    
    //Mark:- Perform segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "structDetail"){
            _ = segue.destination as! StructViewController
        }
         if (segue.identifier == "classDetail"){
            _ = segue.destination as! ClassViewController
        }
        if (segue.identifier == "arrayDetail"){
            _ = segue.destination as! ArrayStructViewController
        }
        
        if (segue.identifier == "apiDetail"){
            _ = segue.destination as! ApiClassViewController
        }
        if (segue.identifier == "classArrayDetail"){
            _ = segue.destination as! ClassArrayViewController
        }
        if (segue.identifier == "classApiDetail"){
            _ = segue.destination as! ClassApiViewController
        }
    }
}

