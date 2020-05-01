//
//  ProtoTViCell.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 5/1/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit



class ProtoTViCell: UITableViewCell {

    @IBOutlet weak var protoCelloImage: UIImageView!
    
    @IBOutlet weak var protoCelloRabel: UILabel!
    
}

class ProtoTable: UIViewController {
    @IBOutlet weak var protoTableV: UITableView!
    
    fileprivate var colorEmptinessArray: [String] = []
    private var imageEmptinessArray: [String] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()

        protoTableV.dataSource = self
        protoTableV.delegate = self
        protoTableV.layer.cornerRadius = protoTableV.frame.height / 11
        for _ in 0...7 {
            colorEmptinessArray += ["色即是空", "空即是色"]
            imageEmptinessArray += ["circle-green-aqua-512","circle-yellow-orange-512"]
        }
    }
}

extension ProtoTable: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cello = protoTableV.dequeueReusableCell(withIdentifier: "cello", for: indexPath) as! ProtoTViCell
        
        cello.protoCelloRabel.text = colorEmptinessArray[indexPath.row]
        cello.protoCelloImage.image = UIImage(named: imageEmptinessArray[indexPath.row])
        
        return cello
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorEmptinessArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93
    }
}



  
