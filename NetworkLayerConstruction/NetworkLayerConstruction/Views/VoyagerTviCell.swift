//
//  VoyagerTviCell.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 5/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class VoyagerTviCell: UITableViewCell {

    @IBOutlet weak var voyagerCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        voyagerCollectionView.delegate = self
        voyagerCollectionView.dataSource = self

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension VoyagerTviCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = voyagerCollectionView.dequeueReusableCell(withReuseIdentifier: "onitcelloc", for: indexPath)
        
        return cell 
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
}

extension VoyagerTviCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 95)
    }
    
}


