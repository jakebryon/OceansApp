//
//  OceansViewController.swift
//  Oceans Study APP
//
//  Created by Jacob Bryon on 09/19/17.
//  Copyright © 2016 Jacob Bryon. All rights reserved.
//

// TODO FOR JAKE: add splash screen (a loading screen)
// add an icon
// add a point counter
// add a home screen (basically a blank screen with a start button)


import UIKit



class OceansViewController: UIViewController {
    
    // adding in components to screen
    var startbutton: UIButton
    var starttext: UILabel
    var starthighscore: UILabel
    
    var buttonA: UIButton
    var buttonB: UIButton
    var buttonC: UIButton
    var buttonD: UIButton
    var questionLabel: UILabel
    var apptitle: UILabel
    var counter: UILabel
    var points: Int = 0
    var Highscore: Int = 0
    var correct: String?
    var numpoints: String?
    var endbutton: UIButton
    
    var restartbutton: UIButton
    
    let userDefults = UserDefaults.standard
    
    
    // MARK: - UIViewController Methods
    
    init() {
        startbutton = UIButton()
        starttext = UILabel()
        starthighscore = UILabel()
        buttonA = UIButton()
        buttonB = UIButton()
        buttonC = UIButton()
        buttonD = UIButton()
        questionLabel = UILabel()
        apptitle = UILabel()
        counter = UILabel()
        endbutton = UIButton()
        restartbutton = UIButton()
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setpointvalue(){
        points = 0
        let userDefults = UserDefaults.standard
        if var Highscore = userDefults.value(forKey: "highScore") { //Returns the integer value associated with the specified key.
            points = 0
        }
        else{
            Highscore = 0
        }
        
    }
    
    //executes code
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setGradientBackground()
        self.setpointvalue()
        self.dostartscreen()
        self.addTargets()
        // Do any additional setup after loading the view.
    }
    
    //Function that sets background gradient
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.addSublayer(gradientLayer)
    }
    
    func dostartscreen() {
        startbutton.setX(x: 110)
        startbutton.setY(y: 230)
        startbutton.setHeight(height: 50)
        startbutton.setWidth(width: 100)
        startbutton.layer.cornerRadius = 10
        startbutton.backgroundColor = UIColor(red: 0.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        startbutton.setTitle("Start!", for: UIControlState.normal)
        
        starttext.setX(x: 35)
        starttext.setY(y: 50)
        starttext.setHeight(height: 200)
        starttext.setWidth(width: 250)
        starttext.layer.cornerRadius = 50
        starttext.backgroundColor = UIColor.clear
        starttext.text = "Oceans Study App!"
        starttext.font = UIFont(name:"Arial", size:  36)
        starttext.lineBreakMode = NSLineBreakMode.byWordWrapping
        starttext.numberOfLines = 3
        starttext.textAlignment = NSTextAlignment.center
        
        starthighscore.setX(x: 85)
        starthighscore.setY(y: 440)
        starthighscore.setHeight(height: 50)
        starthighscore.setWidth(width: 150)
        starthighscore.backgroundColor = UIColor.clear
        starthighscore.textAlignment = NSTextAlignment.center
        starthighscore.text = "Highscore: \(Highscore)"
        
        starttext.isHidden = false
        startbutton.isHidden = false
        
        points = 0
        
        self.view.addSubview(startbutton);
        self.view.addSubview(starttext);
        self.view.addSubview(starthighscore)
        startbutton.addTarget(self, action: #selector(startgame(start:)), for: .touchUpInside)
    }
    
    func doLayout() {
        // get the questions
        
        let array = ConstantsDict.dictionary.keys
        let questionlist = Array(array)
        let question = questionlist.sample()
        
        let mainDictionary = ConstantsDict.dictionary
        let questionsDictionary = mainDictionary[question]
        let answers = questionsDictionary?["answer"] as [String]!
        correct = (questionsDictionary?["correct"] as [String]!)[0]
        
        let answerA = answers?[0]
        let answerB = answers?[1]
        let answerC = answers?[2]
        let answerD = answers?[3]
        
        numpoints = String(describing: points)
        
        starthighscore.setX(x: 30)
        
        questionLabel.setX(x: 40)
        questionLabel.setY(y: 40)
        questionLabel.setHeight(height:200)
        questionLabel.setWidth(width: 250)
        questionLabel.backgroundColor = UIColor.clear
        questionLabel.text = question
        questionLabel.font = UIFont(name:"Arial",size: 22)
        questionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        questionLabel.numberOfLines = 4
        questionLabel.textAlignment = NSTextAlignment.center
        
        apptitle.setX(x: 40)
        apptitle.setY(y: 30)
        apptitle.setHeight(height:20)
        apptitle.setWidth(width: 250)
        apptitle.backgroundColor = UIColor.clear
        apptitle.text = "Oceans Study App!"
        apptitle.textAlignment = NSTextAlignment.center
        
        counter.setX(x: 20)
        counter.setY(y: 420)
        counter.setHeight(height: 30)
        counter.setWidth(width: 150)
        counter.backgroundColor = UIColor.clear
        counter.text = "Points:" + numpoints!
        counter.textAlignment = NSTextAlignment.center
        
        buttonA.setX(x: 30)
        buttonA.setY(y: 260)
        buttonA.setHeight(height:50)
        buttonA.setWidth(width: 120)
        buttonA.layer.cornerRadius = 10
        buttonA.backgroundColor = UIColor(red: 0.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        buttonA.setTitle(answerA, for: UIControlState.normal)
        buttonA.titleLabel?.numberOfLines = 2
        buttonA.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        buttonA.titleLabel?.textAlignment = NSTextAlignment.center
        
        buttonB.setX(x: 180)
        buttonB.setY(y: 260)
        buttonB.setHeight(height: 50)
        buttonB.setWidth(width: 120)
        buttonB.layer.cornerRadius = 10
        buttonB.backgroundColor = UIColor(red: 0.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        buttonB.setTitle(answerB, for: UIControlState.normal)
        buttonB.titleLabel?.numberOfLines = 2
        buttonB.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        buttonB.titleLabel?.textAlignment = NSTextAlignment.center
        
        buttonC.setX(x: 30)
        buttonC.setY(y: 350)
        buttonC.setHeight(height: 50)
        buttonC.setWidth(width: 120)
        buttonC.layer.cornerRadius = 10
        buttonC.backgroundColor = UIColor(red: 0.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        buttonC.setTitle(answerC, for: UIControlState.normal)
        buttonC.titleLabel?.numberOfLines = 2
        buttonC.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        buttonC.titleLabel?.textAlignment = NSTextAlignment.center
        
        buttonD.setX(x: 180)
        buttonD.setY(y: 350)
        buttonD.setHeight(height: 50)
        buttonD.setWidth(width: 120)
        buttonD.layer.cornerRadius = 10
        buttonD.backgroundColor = UIColor(red: 0.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        buttonD.setTitle(answerD, for: UIControlState.normal)
        buttonD.titleLabel?.numberOfLines = 2
        buttonD.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        buttonD.titleLabel?.textAlignment = NSTextAlignment.center
        
        endbutton.setX(x: 170)
        endbutton.setY(y: 425)
        endbutton.setHeight(height: 40)
        endbutton.setWidth(width: 100)
        endbutton.layer.cornerRadius = 10
        endbutton.backgroundColor = UIColor(red: 0.0/255.0, green: 110.0/255.0, blue: 110.0/255.0, alpha: 1.0)
        endbutton.setTitle("end", for: UIControlState.normal)
        
        buttonA.isHidden = false
        buttonB.isHidden = false
        buttonC.isHidden = false
        buttonD.isHidden = false
        questionLabel.isHidden = false
        apptitle.isHidden = false
        endbutton.isHidden = false
        counter.isHidden = false
        
        self.view.addSubview(buttonA);
        self.view.addSubview(buttonB);
        self.view.addSubview(buttonC);
        self.view.addSubview(buttonD);
        self.view.addSubview(questionLabel);
        self.view.addSubview(apptitle);
        self.view.addSubview(counter);
        self.view.addSubview(endbutton);
    }
    
    func restartscreen() {
        buttonA.isHidden = true
        buttonB.isHidden = true
        buttonC.isHidden = true
        buttonD.isHidden = true
        questionLabel.isHidden = true
        apptitle.isHidden = true
        endbutton.isHidden = true
        
        restartbutton.setX(x: 110)
        restartbutton.setY(y: 200)
        restartbutton.setHeight(height: 50)
        restartbutton.setWidth(width: 100)
        restartbutton.layer.cornerRadius = 10
        restartbutton.backgroundColor = UIColor(red: 0.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        restartbutton.setTitle("New Game", for: UIControlState.normal)
        
        starthighscore.setX(x: 85)
        counter.setX(x: 85)
        
        restartbutton.isHidden = false
        
        self.view.addSubview(restartbutton)
        restartbutton.addTarget(self, action: #selector(restartgame(restart:)), for: .touchUpInside)
    }
    
    func addTargets() {
        buttonA.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside);
        buttonB.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside);
        buttonC.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside);
        buttonD.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside);
        startbutton.addTarget(self, action: #selector(startgame(start:)), for: .touchUpInside);
        endbutton.addTarget(self, action: #selector(endgame(end:)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func startgame(start: UIButton){
        if (start == startbutton) {
            self.doLayout()
            self.addTargets()
            startbutton.isHidden = true
            starttext.isHidden = true
        }
        
    }
    
    @objc func endgame(end: UIButton){
        if (end == endbutton){
        self.restartscreen()
        }
    }
    
    @objc func restartgame(restart: UIButton) {
        if (restart == restartbutton){
            restartbutton.isHidden = true
            counter.isHidden = true
            self.dostartscreen()
            self.addTargets()
        }
    }
    
    // MARK: - custom methods
    @objc func buttonPressed(button: UIButton) {
        if (button.titleLabel?.text == correct!){
            button.backgroundColor = UIColor.green
            points += 10
            
            if(points >= Highscore){
                Highscore = points
                starthighscore.text = "Highscore: \(Highscore)"
                userDefults.set(Highscore, forKey: "highScore")
            }
            
            numpoints = String(describing: points)
            counter.text = "Points:" + numpoints!
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.doLayout()
            })
        }
        else {
            button.backgroundColor = UIColor.red
            points -= 5
            numpoints = String(describing: points)
            counter.text = "Points:" + numpoints!
        }
    }
        
    
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


