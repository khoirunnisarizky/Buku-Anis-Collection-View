//
//  ViewController.swift
//  Buku Anis Collection View
//
//  Created by khoirunnisa' rizky noor fatimah on 14/07/19.
//  Copyright © 2019 khoirunnisa' rizky noor fatimah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    
    var covers = [UIColor.black, UIColor.red, UIColor.green, UIColor.blue, UIColor.darkGray]
    var categories = ["Kids", "Islamic", "Fiqh", "Tazkiyatun Nafs", "Aqidah", "Sirah Nabawiyah"]
    var titles = ["Judul 1", "Judul 2", "Judul 3", "Judul 4", "Judul 5"]
    var authors = ["Tasaro GK", "Khoirunnisa", "Rizky", "Noor", "Fatimah"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 220
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCell") as? LibraryCell else { return UITableViewCell() }
        
        cell.bookCategory.text = categories[indexPath.row]
        cell.authors = authors
        cell.covers = covers
        cell.titles = titles
        cell.setupCollectionCell()
        
        return cell
    }
    

}

