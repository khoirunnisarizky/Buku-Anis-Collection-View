//
//  ViewController.swift
//  BelajarLocal
//
//  Created by khoirunnisa' rizky noor fatimah on 05/07/19.
//  Copyright © 2019 khoirunnisa' rizky noor fatimah. All rights reserved.
//

import UIKit
import CoreData//framework perlu diimport

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    //harus ada  referensi ke App Delegate untuk availibility core data
    let appDelegate  = UIApplication.shared.delegate as? AppDelegate
    
    var users = [User]()
    
    @IBAction func save(_ sender: Any) {
//        //code ini belum  save dataU 
//        myLabel.text =  nameTextField.text
//
//        //save menggunakan key and value
//        UserDefaults.standard.set(myLabel.text, forKey: "name")
//
//        //perlu dipanggil lagi   untuk bisa menampilkannya setelah diclose -- diviewdidload
        
        //save using  CoreData
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return  }
        
        //bikin objek entity
        let user = User(context: managedContext)
        //set value ke atribut
        user.username = nameTextField.text
        user.password = passwordTextField.text
        
        //commit(save) changes
        do {
            try managedContext.save()
        } catch {
            print("Error")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        //menampilkan data yg terakhir disimpan (retrieve data)
//        myLabel.text = UserDefaults.standard.string(forKey: "name")
        
        //fetch/retrieve  data using Core Data
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return  }
        do {
           users = try managedContext.fetch(User.fetchRequest())
            //Nyesuaiin apps kita yang diganti code for ini
            for user in users {
                let username = user.username
                let password = user.password
                
                //print/show  di label
                myLabel.text =  "\(username!), \(password!)"
                
            }
            
        } catch  { //eror handling -- supaya ga  error makanya pake  catch
            print("Error")
        }
        
    }


}

