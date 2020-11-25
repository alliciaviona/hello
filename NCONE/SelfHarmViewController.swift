//
//  SelfHarmViewController.swift
//  NCONE
//
//  Created by Allicia Viona Sagi on 12/03/20.
//  Copyright © 2020 Allicia Viona Sagi. All rights reserved.
//

import UIKit

class SelfHarmViewController: UIViewController {

    //passable variable
    var bgImg = #imageLiteral(resourceName: "bg2")
    var bgColor = #colorLiteral(red: 0, green: 0.1923047006, blue: 0.7999534607, alpha: 1)
    var currEmotion = ""
    var callback : ((String) -> Void)?
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var btnHome: UIButton!
    
    //collections of button
    @IBOutlet weak var btnHurtMyself: UIButton!
    @IBOutlet weak var btnIsolatingMyself: UIButton!
    @IBOutlet weak var btnEveryonesNeed: UIButton!
    @IBOutlet weak var btnHatingMyself: UIButton!
    
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
    
    @IBAction func pressCategory(_ sender: UIButton){
        if(sender == btnHurtMyself || sender == btnIsolatingMyself || sender == btnEveryonesNeed || sender == btnHatingMyself ){
            currEmotion = "condolence"
        }
        
        generateBackground(state: currEmotion)
    }
    
    func generateBackground(state:String){
        if(state == "happy"){
            self.view.backgroundColor = #colorLiteral(red: 0.7098039216, green: 0.5843137255, blue: 0.07450980392, alpha: 1)
            bgColor = #colorLiteral(red: 0.70496279, green: 0.5835767388, blue: 0.06379938871, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-happy")
        }else if(state == "sad"){
            self.view.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.168627451, blue: 0.5843137255, alpha: 1)
            bgColor = #colorLiteral(red: 0.03257182986, green: 0.1686936319, blue: 0.5794419646, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-sad")
        }else if(state == "love"){
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-love")
            bgColor = #colorLiteral(red: 1, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
        }else if(state == "sick"){
            self.view.backgroundColor = #colorLiteral(red: 0.3215686275, green: 0.7098039216, blue: 0.07450980392, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-sick")
            bgColor = #colorLiteral(red: 0.3215686275, green: 0.7098039216, blue: 0.07450980392, alpha: 1)
        }else if(state == "angry"){
            self.view.backgroundColor = #colorLiteral(red: 0.7098039216, green: 0.3137254902, blue: 0.07450980392, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-angry")
            bgColor = #colorLiteral(red: 0.7098039216, green: 0.3137254902, blue: 0.07450980392, alpha: 1)
        }else if(state == "condolence"){
            self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-condolence")
            bgColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }else if(state == "excellent"){
            self.view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.2274509804, blue: 0.7098039216, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg2")
            bgColor = #colorLiteral(red: 0.07450980392, green: 0.2274509804, blue: 0.7098039216, alpha: 1)
        }
        
    }
    
    func backAction() -> Void {
       callback?(currEmotion)
        self.navigationController?.popViewController(animated: true)
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
