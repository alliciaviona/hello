//
//  HistoryViewController.swift
//  NCONE
//
//  Created by Allicia Viona Sagi on 12/03/20.
//  Copyright © 2020 Allicia Viona Sagi. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    //passable variable
    var bgImg = #imageLiteral(resourceName: "bg2")
    var bgColor = #colorLiteral(red: 0, green: 0.1923047006, blue: 0.7999534607, alpha: 1)
    
    @IBOutlet weak var bgImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.image = bgImg
        self.view.backgroundColor = bgColor
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
