//
//  ProtoTViCell.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 5/1/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import SwiftUI
import UIKit


protocol ProtoCellProtocol {
    func clickable(index: Int)
}

class ProtoTViCell: UITableViewCell {
    
    var cellDelegate: ProtoCellProtocol?
    var index: IndexPath?
    
    @IBAction func protoCelloAction(_ sender: UIButton) {
        cellDelegate?.clickable(index: (index?.row ?? 0))
    }
      
    
    
//    @IBAction func protoCelloButton(_ sender: Any) {
//        cellDelegate?.clickable(index: (index?.row)!)
//    }
    
    @IBOutlet weak var protoCelloImage: UIImageView!
    
    @IBOutlet weak var protoCelloRabel: UILabel!
    
}

class ProtoTable: UIViewController {
    @IBOutlet weak var protoTableV: UITableView!
    
    @IBSegueAction func swiftinessAction(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftinessView())
    }
    
     
    
    
    
    
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
        
        guard let cello = protoTableV.dequeueReusableCell(withIdentifier: "cello", for: indexPath) as? ProtoTViCell else {
            fatalError("cell-guards fatality")   
        }
        
        cello.protoCelloRabel.text = colorEmptinessArray[indexPath.row]
        cello.protoCelloImage.image = UIImage(named: imageEmptinessArray[indexPath.row])
        
        cello.cellDelegate = self
        cello.index = indexPath
        
        return cello
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorEmptinessArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93
    }
}

extension ProtoTable: ProtoCellProtocol {
    func clickable(index: Int) {
        print("clickable called")
    }
    
    
    
    
}



  
