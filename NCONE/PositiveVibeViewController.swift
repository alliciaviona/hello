//
//  PositiveVibeViewController.swift
//  NCONE
//
//  Created by Allicia Viona Sagi on 12/03/20.
//  Copyright © 2020 Allicia Viona Sagi. All rights reserved.
//

import UIKit

class PositiveVibeViewController: UIViewController {

    //passable variable
    var bgImg = #imageLiteral(resourceName: "bg2")
    var bgColor = #colorLiteral(red: 0, green: 0.1923047006, blue: 0.7999534607, alpha: 1)
    
    @IBOutlet weak var btnHome: UIButton!
    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.image = bgImg
        self.view.backgroundColor = bgColor

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressHome(_ sender: Any) {
        backAction()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnHome)
    }
    
    func backAction() -> Void {
    self.navigationController?.popViewController(animated: true)
    }

}
