//
//  ViewController.swift
//  Dicee
//
//  Created by SERDAR ILARSLAN on 10/06/2018.
//  Copyright © 2018 SERDAR ILARSLAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int = 0
    var randonDiceIndex2 : Int = 0
    let numberArray = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    @IBOutlet weak var diceViewImage1: UIImageView!
    @IBOutlet weak var diceViewImage2: UIImageView!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var pointPlayer1: UILabel!
    @IBOutlet weak var pointPlayer2: UILabel!
    var sumOfPoints1 : Int = 0
    var sumOfPoints2 : Int = 0
    var num1 : Int = 0
    var num2 : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func rollBtnPressed(_ sender: UIButton) {
        updateDiceImages()
    }
    
    func updateDiceImages (){
        
        if pointPlayer1.text != "0" && pointPlayer2.text != "0"{
            pointPlayer2.text = "0"
            pointPlayer1.text = "0"
        }
        
        if pointPlayer2.text == "0" && pointPlayer1.text != "0"{
            randomDiceIndex1 = Int(arc4random_uniform(6))
            randonDiceIndex2 = Int(arc4random_uniform(6))
            num1 = randomDiceIndex1 + 1
            num2 = randonDiceIndex2 + 1
            diceViewImage1.image = UIImage(named: numberArray[randomDiceIndex1])
            diceViewImage2.image = UIImage(named: numberArray[randonDiceIndex2])
            
            sumOfPoints2 = num1 + num2
            pointPlayer2.text = String(sumOfPoints2)
            
                if sumOfPoints2 == sumOfPoints1{
                    playerPosition.text = "DRAW!"
                    sumOfPoints2 = 0
                    sumOfPoints1 = 0
                }
                if sumOfPoints1 > sumOfPoints2{
                    playerPosition.text = "Player 1 Wins!"
                    sumOfPoints2 = 0
                    sumOfPoints1 = 0
                }
                if sumOfPoints2 > sumOfPoints1{
                    playerPosition.text = "Player 2 Wins!"
                    sumOfPoints2 = 0
                    sumOfPoints1 = 0
                }
            
        }
        
        if pointPlayer1.text == "0"{
            randomDiceIndex1 = Int(arc4random_uniform(6))
            randonDiceIndex2 = Int(arc4random_uniform(6))
            num1 = randomDiceIndex1 + 1
            num2 = randonDiceIndex2 + 1
            diceViewImage1.image = UIImage(named: numberArray[randomDiceIndex1])
            diceViewImage2.image = UIImage(named: numberArray[randonDiceIndex2])
            
            sumOfPoints1 = num1 + num2
            pointPlayer1.text = String(sumOfPoints1)
            playerPosition.text = "Player 2 Rolls !!!"
        }

    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
}

