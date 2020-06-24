//
//  LoginViewController.swift
//  EunseoChoi_13340260_A2
//
//  Created by 최은서 on 2020/05/22.
//  Copyright © 2020 Eunseo Choi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    var numberSliderValue = 15
    var timeSliderVale = 60
    
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerName.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func setting(_ sender: UISlider) {
        if sender.tag == 1 {
            timeSliderVale = Int (sender.value)
            timeLabel.text = "\(timeSliderVale)"
        }
        if sender.tag == 2 {
            numberSliderValue = Int(sender.value)
            numberLabel.text = "\(numberSliderValue)"
        }

    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "start" {
            let dest = segue.destination as! GameViewController
            dest.maxNumBubble = numberSliderValue
            dest.timerSeconds = timeSliderVale
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
