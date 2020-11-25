//
//  CategoryViewController.swift
//  NCONE
//
//  Created by Allicia Viona Sagi on 12/03/20.
//  Copyright © 2020 Allicia Viona Sagi. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    //passable variable
    var bgImg = #imageLiteral(resourceName: "bg2")
    var bgColor = #colorLiteral(red: 0, green: 0.1923047006, blue: 0.7999534607, alpha: 1)
    var backGColor = #colorLiteral(red: 0, green: 0.1923047006, blue: 0.7999534607, alpha: 1)
    var callback : ((String) -> Void)?
    var currEmotion = ""
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var btnHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage.image = bgImg
        self.view.backgroundColor = bgColor
        backGColor = bgColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressHealth(_ sender: Any) {
        bgImg = bgImage.image!
        performSegue(withIdentifier: "home_self", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "category_health"){
            let send = segue.destination as! CategoryViewController
            send.bgImg = self.bgImg
            send.bgColor = self.backGColor
        }
    }
    @IBAction func pressHome(_ sender: Any) {
        backAction()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnHome)
    }
    
    func backAction() -> Void {
        callback?(currEmotion)
        self.navigationController?.popViewController(animated: true)
        bgImage.image = bgImg
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
