//
//  ViewController.swift
//  SimonGame
//
//  Created by Jiwoo Lee on 2019-10-29.
//  Copyright © 2019 Jiwoo Lee. All rights reserved.
//

import UIKit
import GameplayKit


class ViewController: UIViewController {
    //Labels
    @IBOutlet weak var statusBar: UILabel!
    @IBOutlet weak var level: UILabel!
    
    //Blocks
    @IBOutlet weak var green: UIButton!
    @IBOutlet weak var red: UIButton!
    @IBOutlet weak var yellow: UIButton!
    @IBOutlet weak var blue: UIButton!
    
    enum Block {
        case green
        case red
        case yellow
        case blue
    }
    
    //Block button action
    @IBAction func greenButton() {
        if playerTurn && (blocksPressed < signals.count ){
            blocksPressed += 1
            guesses.append(Block.green)
            guess()
        }
//        statusBar.text = String(blocksPressed) + String(signals.count)
    }
    
    @IBAction func redButton() {
        if playerTurn && (blocksPressed < signals.count) {
            blocksPressed += 1
            guesses.append(Block.red)
            guess()
        }
//        statusBar.text = String(blocksPressed) + String(signals.count)
    }
    
    @IBAction func yellowButton() {
        if playerTurn && (blocksPressed < signals.count) {
            blocksPressed += 1
            guesses.append(Block.yellow)
            guess()
        }
//        statusBar.text = String(blocksPressed) + String(signals.count)
    }
    
    @IBAction func blueButton() {
        if playerTurn && (blocksPressed < signals.count ){
            blocksPressed += 1
            guesses.append(Block.blue)
            guess()
        }
//        statusBar.text = String(blocksPressed) + String(signals.count)
    }
    
    //Start/Restart button
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var restart: UIButton!
    
    var playerTurn:Bool = false
    
    @IBAction func startButton() {
        start.isEnabled = false
        statusBar.text = "Simon is giving signals"
        playgame()
    }
    
    @IBAction func restartButton() {
        start.isEnabled = true
        disableButton()
        statusBar.text = "Ready?"
        levelNum = 0
        level.text = "0"
        blocksPressed = 0
        signals = []
        guesses = []
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        disableButton()
    }
    
    //Custom funcitons-------------------------------------------------------------------------------------------------------------
    func enableButton() {
        green.isEnabled = true
        red.isEnabled = true
        yellow.isEnabled = true
        blue.isEnabled = true
    }
    
    func disableButton() {
        green.isEnabled = false
        red.isEnabled = false
        yellow.isEnabled = false
        blue.isEnabled = false
    }
    
    func playgame() {
        giveSignal()
        guess()

    }
    
    var levelNum:Int = 0

    //Simon signal
    let randomSource = GKARC4RandomSource() //for random number generation
    var signals:[Block] = []

    func giveSignal() {
        disableButton()
        signals = []
        for _ in 0...levelNum  {
            let randomSignal:Int = randomSource.nextInt(upperBound: 4)
            switch randomSignal {
                //Green
                case 0:
                    signals.append(Block.green)
                //Red
                case 1:
                    signals.append(Block.red)
                //Yellow
                case 2:
                    signals.append(Block.yellow)
                //Blue
                case 3:
                    signals.append(Block.blue)
            default:
                break
            }

        }
        let finalSeq:String = makeString()
        statusBar.text = finalSeq
    }
    
    //player guess
    var guesses:[Block] = []
    var blocksPressed = 0;

    func guess() {
        playerTurn = true
        enableButton()
        if (blocksPressed == signals.count) {
            disableButton()
            let passedLevel:Bool = verdict()
            if passedLevel {
                levelNum += 1
                level.text = String(levelNum)
                blocksPressed = 0;
                guesses = []
                signals = []
                playgame()
            }
            else {
                statusBar.text = "You Lost"
            }
        }
    }
    
    func verdict() -> Bool {
        //If player guess is not the same as signal
        for i in 0...signals.count-1  {
            if !(signals[i] == guesses[i]) {
                return false
            }
        }
//        statusBar.text = String(blocksPressed) + String(signals.count)
        return true
    }

    func makeString() -> String {
        var seq:String = ""
        for n in signals {
            switch n {
                case Block.green:
                  seq = seq + "G "
                case Block.red:
                   seq = seq + "R "
                case Block.yellow:
                    seq = seq + "Y "
                case Block.blue:
                    seq = seq + "B "
              }
        }
        return seq
    }
  

}
