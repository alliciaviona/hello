//
//  ViewController.swift
//  NCONE
//
//  Created by Allicia Viona Sagi on 03/03/20.
//  Copyright © 2020 Allicia Viona Sagi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //passable variables
    var bgImg:UIImage = #imageLiteral(resourceName: "bg2")
    var bgColor = #colorLiteral(red: 0, green: 0.1618920565, blue: 0.833045423, alpha: 1)
    var currEmotion = ""
    //constants
        //happy responses
    let happyResponse = ["I'm glad you enjoy your day", "Tell me more!", "Good gracious!", "It is indeed!","Share your joy with others"]
    
    let happyEmoji:[UIImage] = [#imageLiteral(resourceName: "face-with-party-horn-and-party-hat_1f973"), #imageLiteral(resourceName: "grinning-face-with-smiling-eyes_1f601"), #imageLiteral(resourceName: "smiling-face-with-open-mouth_1f603"), #imageLiteral(resourceName: "grinning-face-with-star-eyes_1f929"), #imageLiteral(resourceName: "face-with-stuck-out-tongue-and-winking-eye_1f61c")]
        //sad responses
    let sadResponse = ["What happened?","Talk to someone close to you", "I hope things will get better", "Try to write down your sadness", "Writing might relieves you"]
    let sadEmoji:[UIImage] = [#imageLiteral(resourceName: "slightly-frowning-face_1f641"), #imageLiteral(resourceName: "white-frowning-face_2639")]
        //angry responses
    let angryResponse = ["Calm down, calm down", "take your time to relax"]
    let angryEmoji:[UIImage] = [#imageLiteral(resourceName: "serious-face-with-symbols-covering-mouth_1f92c"), #imageLiteral(resourceName: "pouting-face_1f621")]
        //self-harm response
    let selfHarmResponse = ["Stop hurting yourself", "You deserve more good thing", "Don't do that"]
    //variables
    var level = 1, tap = 0,love = 0, shock = 0, negativity = 20, positivity = 100, sick = 0, angry = 0, power = 120
    //check alert
    var prevPress:[Int] = []
    var title_ = " ", msg_ = " "
    //alert
    var nameTextField: UITextField?
    var lblNameError: UILabel?
    var alertCounter = 0
    //background
    @IBOutlet weak var bgImage: UIImageView!
    var backGColor = #colorLiteral(red: 0, green: 0.1618920565, blue: 0.833045423, alpha: 1)
    //header
    @IBOutlet weak var btnEmergency: UIButton!
    @IBOutlet weak var btnHistory: UIButton!
    //top
    @IBOutlet weak var imgEmoji: UIImageView!
    @IBOutlet weak var lblAnswer: UILabel!
    //greetings
    @IBOutlet weak var btnName: UIButton!
    //xps
    @IBOutlet weak var lblHappiness: UILabel!
    @IBOutlet weak var lblSadness: UILabel!
    @IBOutlet weak var lblLevel: UILabel!
    //categories
    @IBOutlet weak var btnSelfHarm: UIButton!
    @IBOutlet weak var btnHealth: UIButton!
    @IBOutlet weak var btnPositive: UIButton!
    @IBOutlet weak var btnMore: UIButton!
    //catalogue of thoughts
    @IBOutlet weak var btnThoughts2: UIButton! //i'm hurting
    @IBOutlet weak var btnThoughts4: UIButton! //i'm disappointed
    @IBOutlet weak var btnThoughts6: UIButton! //feeling grateful
    @IBOutlet weak var btnThoughts7: UIButton! //i'm feeling great today
    
    //first thing to load
    override func viewDidLoad() {
        super.viewDidLoad()
        btnHistory.isHidden = true
        btnMore.isHidden = true
    }
    
    //press action
    @IBAction func pressName(_ sender: Any) {
        let nameAlert = UIAlertController(title: "Input Your Name", message: nil, preferredStyle: .alert)
        
        nameAlert.addTextField(configurationHandler: nameTextField)
        
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: self.doneHandler)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        nameAlert.addAction(doneAction)
        nameAlert.addAction(cancelAction)
        
        self.present(nameAlert, animated: true)
    }
    
    @IBAction func pressEmergency(_ sender: Any) {
        "+6281210287117".makeACall()
    }
    
    
    @IBAction func pressThought(_ sender: UIButton) {
        
        if sender == btnThoughts7 {
            //i'm feeling great today
            tap += 1
            generateTheme(state: "happy")
            currEmotion = "happy"
        }else if(sender == btnThoughts2){
            //i'm hurting
            tap += 1
            generateTheme(state: "sad")
            currEmotion = "happy"
        }else if(sender == btnThoughts6){
            //i'm angry
            tap += 1
            generateTheme(state: "angry")
            currEmotion = "happy"
        }else if(sender == btnThoughts4){
            //i'm disappointed
            tap += 1
            generateTheme(state: "sad")
            currEmotion = "happy"
        }
        
        checkLevelProgress()
        
    }

    @IBAction func pressCategoryOne(_ sender: Any) {
        bgImg = bgImage.image!
        performSegue(withIdentifier: "home_self", sender: self)
    }
    
    @IBAction func pressCategoryTwo(_ sender: Any) {
        bgImg = bgImage.image!
        performSegue(withIdentifier: "home_health", sender: self)
    }
    
    @IBAction func pressCategoryThree(_ sender: Any) {
        bgImg = bgImage.image!
        performSegue(withIdentifier: "home_positive", sender: self)
    }
    
    @IBAction func pressMore(_ sender: Any) {
        bgImg = bgImage.image!
        performSegue(withIdentifier: "home_categories", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "home_self"){
            let send = segue.destination as! SelfHarmViewController
            send.bgImg = self.bgImg
            send.bgColor = self.backGColor
            
            if let self_h = segue.destination as? SelfHarmViewController{
                self_h.callback = { message in
                    self.generateTheme(state: self_h.currEmotion)
                }
            }
        }else if(segue.identifier == "home_categories"){
            let send = segue.destination as! CategoryViewController
            send.bgImg = self.bgImg
            send.bgColor = self.backGColor
            
            if let cat = segue.destination as?
                CategoryViewController{
                self.generateTheme(state: cat.currEmotion)
            }
        }else if(segue.identifier == "home_health"){
            let send = segue.destination as! HealthViewController
            send.bgImg = self.bgImg
            send.bgColor = self.backGColor

        }else if(segue.identifier == "home_positive"){
            let send = segue.destination as! PositiveVibeViewController
            send.bgImg = self.bgImg
            send.bgColor = self.backGColor

        }
        
    }
    
    func generateTheme(state: String){
        if(state == "happy"){
            generateEmotionXP(act: "inc")
            generateBackground(state: state)
            generateEmoji(emoji: happyEmoji[generateRandomNumber(arr: happyEmoji)])
            generateAnswer(word: generateHappyResponse())
        }else if(state == "sad"){
            generateEmotionXP(act: "dec")
            generateBackground(state: state)
            generateEmoji(emoji: sadEmoji[generateRandomNumber(arr: sadEmoji)])
            generateAnswer(word: generateSadResponse())
        }else if(state == "angry"){
            generateEmotionXP(act: "dec")
            generateBackground(state: state)
            generateEmoji(emoji: angryEmoji[generateRandomNumber(arr: angryEmoji)])
            generateAnswer(word: angryResponse[generateRandomNumber(arr: angryResponse)])
        }else if(state == "condolence"){
            generateEmotionXP(act: "dec")
            generateBackground(state: state)
            generateEmoji(emoji: #imageLiteral(resourceName: "wilted-flower_1f940"))
            generateAnswer(word: selfHarmResponse[generateRandomNumber(arr: selfHarmResponse)])
        }
    }
    
    func generateEmotionXP(act:String){
        if(act == "inc"){
            if(positivity < power-negativity){
                positivity += 1
            }
            
            if(negativity > 0){
                negativity -= 1
            }
        }else if(act == "dec"){
            if(negativity < power-positivity){
                negativity += 1
            }
            
            if(positivity > 0){
                positivity -= 1
            }
        }
        
        loadEmotions(happiness: positivity, sadness: negativity)
        
    }
    
    func generateAnswer(word:String){
        if(word.count <= 12){
            lblAnswer.font = lblAnswer.font.withSize(48)
            lblAnswer.text = word
        }else if(word.count <= 20){
            lblAnswer.font = lblAnswer.font.withSize(24)
            lblAnswer.text = word
        }else if(word.count <= 35){
            lblAnswer.font = lblAnswer.font.withSize(21)
            lblAnswer.text = word
        }else{
            lblAnswer.font = lblAnswer.font.withSize(19)
            lblAnswer.text = word
        }
    }
    
    func generateRandomNumber(arr:[Any]) -> Int{
        let randomNum = Int.random(in: 0...arr.count-1)
        return randomNum
    }
    
    func generateHappyResponse() -> String{
       let index = generateRandomNumber(arr: happyResponse)
        lblAnswer.text = happyResponse[index]
        return happyResponse[index]
    }
    
    func generateSadResponse() -> String{
       let index = generateRandomNumber(arr: sadResponse)
        lblAnswer.text = sadResponse[index]
        return sadResponse[index]
    }
    
    func generateEmoji(emoji:UIImage){
        imgEmoji.image = emoji
    }
    
    func generateBackground(state:String){
        if(state == "happy"){
            self.view.backgroundColor = #colorLiteral(red: 0.7098039216, green: 0.5843137255, blue: 0.07450980392, alpha: 1)
            backGColor = #colorLiteral(red: 0.70496279, green: 0.5835767388, blue: 0.06379938871, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-happy")
        }else if(state == "sad"){
            self.view.backgroundColor = #colorLiteral(red: 0.03921568627, green: 0.168627451, blue: 0.5843137255, alpha: 1)
            backGColor = #colorLiteral(red: 0.03257182986, green: 0.1686936319, blue: 0.5794419646, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-sad")
        }else if(state == "love"){
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-love")
            backGColor = #colorLiteral(red: 1, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
        }else if(state == "sick"){
            self.view.backgroundColor = #colorLiteral(red: 0.3215686275, green: 0.7098039216, blue: 0.07450980392, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-sick")
            backGColor = #colorLiteral(red: 0.3215686275, green: 0.7098039216, blue: 0.07450980392, alpha: 1)
        }else if(state == "angry"){
            self.view.backgroundColor = #colorLiteral(red: 0.7098039216, green: 0.3137254902, blue: 0.07450980392, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-angry")
            backGColor = #colorLiteral(red: 0.7098039216, green: 0.3137254902, blue: 0.07450980392, alpha: 1)
        }else if(state == "condolence"){
            self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg-condolence")
            backGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }else if(state == "excellent"){
            self.view.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.2274509804, blue: 0.7098039216, alpha: 1)
            bgImage.image = #imageLiteral(resourceName: "bg2")
            backGColor = #colorLiteral(red: 0.07450980392, green: 0.2274509804, blue: 0.7098039216, alpha: 1)
        }
        
    }
    
    //alerts
    func myAlert(title_: String, msg: String){
        let alert = UIAlertController(title: title_, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func nameExceeded(){
        title_ = "Too long"
        msg_ = "Name must be less than 12 characters"
        myAlert(title_: title_, msg: msg_)
    }
    func noneError(){
        title_ = "No Input Available"
        msg_ = "There are no data inputted"
        myAlert(title_: title_, msg: msg_)
    }
    
    func refreshAlert(){
        title_ = "Let's start the day off! 🌳"
        msg_ = "You can always start all over again. Do your best!"
        
        myAlert(title_: title_, msg: msg_)
    }
    
    func proudAlert(){
        title_ = "You are great !"
        msg_ = "You're on fire 🔥"
        
        myAlert(title_: title_, msg: msg_)
    }
    
    func sadAlert(){
        title_ = "Hey is everything okay? ❤️"
        msg_ = "Let's refresh your day and start things all over again"
        
        myAlert(title_: title_, msg: msg_)
    }
    
    //other functions
    func loadEmotions(happiness:Int, sadness:Int){
        lblHappiness.text = String(positivity)
        lblSadness.text = String(negativity)
    }
    
    func checkLevelProgress(){
        if(tap == level*10){
            level += 1
            if(level >= 10){
                lblLevel.text = String(level)
            }else{
                lblLevel.text = "0\(level)"
            }
        }
    }
    
    func nameTextField(textField: UITextField!){
        nameTextField = textField
        nameTextField?.placeholder = "your name"
    }
    
    func errLabel(label : UILabel!){
        lblNameError = label
        lblNameError?.text = "Name max. 12 character"
    }
    
    func doneHandler(alert: UIAlertAction!){
        
        guard (nameTextField?.text) != nil else{
            noneError()
            print("input none")
            return
        }
        
        let name_ = nameTextField?.text
        
        if( name_!.count  > 12){
            nameExceeded()
        }else{
            btnName.setTitle(nameTextField?.text, for: .normal)
        }
    }
    

    
}

extension String {

    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }

    func isValid(regex: RegularExpressions) -> Bool { return isValid(regex: regex.rawValue) }
    func isValid(regex: String) -> Bool { return range(of: regex, options: .regularExpression) != nil }

    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }

    func makeACall() {
        guard   isValid(regex: .phone),
                let url = URL(string: "tel://\(self.onlyDigits())"),
                UIApplication.shared.canOpenURL(url) else { return }
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}

