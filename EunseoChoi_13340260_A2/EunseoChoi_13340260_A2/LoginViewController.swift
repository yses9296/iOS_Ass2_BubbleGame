//
//  LoginViewController.swift
//  EunseoChoi_13340260_A2
//
//  Created by 최은서 on 2020/05/22.
//  Copyright © 2020 Eunseo Choi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    var bubbleNumberValue = 15
    var timerValue = 30
    
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerName.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func timerSetting(_ sender: UISlider) {
        timerValue = Int (sender.value)
        timeLabel.text = "\(timerValue)"
    }
    
    
    @IBAction func maxNum(_ sender: UISlider) {
        bubbleNumberValue = Int(sender.value)
        numberLabel.text = "\(bubbleNumberValue)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text
        if text!.isEmpty {
            playerName.text = "Null"
        }
        return true
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "start" {
            let dest = segue.destination as! GameViewController
            dest.maxNumBubble = bubbleNumberValue
            dest.timerSeconds = timerValue
            dest.playerName = playerName.text!
            
        }
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
