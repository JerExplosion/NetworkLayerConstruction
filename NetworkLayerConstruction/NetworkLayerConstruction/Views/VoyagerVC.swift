//
//  VoyagerVC.swift
//  NetworkLayerConstruction
//
//  Created by Jerry Ren on 5/3/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class VoyagerVC: UIViewController {

    @IBOutlet weak var voyagerTableV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        voyagerTableV.delegate = self
        voyagerTableV.dataSource = self

    }
    
}

extension VoyagerVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
       let cell = voyagerTableV.dequeueReusableCell(withIdentifier: "ollec", for: indexPath) as! VoyagerTviCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
}
