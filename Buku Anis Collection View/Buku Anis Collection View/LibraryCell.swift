//
//  LibraryCell.swift
//  Buku Anis Collection View
//
//  Created by khoirunnisa' rizky noor fatimah on 14/07/19.
//  Copyright © 2019 khoirunnisa' rizky noor fatimah. All rights reserved.
//

import UIKit

class LibraryCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var bookCategory: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var authors : [String]?
    var titles : [String]?
    var covers : [UIColor]?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCollectionCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
       collectionView.reloadData()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
        
        guard let covers = covers, let titles = titles, let authors = authors else { return UICollectionViewCell() }
        
        cell.bookAuthor.text = authors[indexPath.row]
        cell.bookCover.backgroundColor = covers[indexPath.row]
        
        cell.bookTitle.text = titles[indexPath.row]
        
        return cell
    }

}
