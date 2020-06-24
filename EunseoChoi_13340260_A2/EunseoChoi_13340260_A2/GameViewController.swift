//
//  ViewController.swift
//  EunseoChoi_13340260_A2
//
//  Created by 최은서 on 2020/05/22.
//  Copyright © 2020 Eunseo Choi. All rights reserved.
//

import UIKit
import GameKit

class GameViewController: UIViewController {
    var timer: Timer?
    var bubble = Bubble()
    var bubbleArray = [Bubble]()
    var maxNumBubble = 15
    var timerSeconds = 30
    var score: Double = 0
    var comboBubbleValue: Double = 0
    var playerName: String = ""
    var scoreRankRecord: Dictionary? = [String : Double]()
    var sortedScore = [(key: String, value: Double)]()
    var rankingRecord = [String : Double]()

    var screenWidth: UInt32 {
        return UInt32(UIScreen.main.bounds.width)
    }
    var screenHeight: UInt32 {
        return UInt32(UIScreen.main.bounds.height)
    }
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScore: UILabel!
    @IBOutlet weak var remainTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreRankRecord = UserDefaults.standard.dictionary(forKey: "scoreRank") as? Dictionary<String, Double>
        if scoreRankRecord != nil {
            rankingRecord = scoreRankRecord!
            sortedScore = rankingRecord.sorted(by: {$0.value > $1.value})
    }
        timer = Timer.scheduledTimer(withTimeInterval: 1.0 , repeats: true) {
            timer in
                self.setTime()
                self.remove()
                self.create()
        }
    }

    @IBAction func bubbleTapped(_ sender: Bubble) {

        sender.removeFromSuperview()
            //If player poped the same color bubble then got secondscore * 1.5, IT'S COMBO!!
        if comboBubbleValue == sender.value {
            score += sender.value * 1.5
        } //if not got Original score
        else {
            score += sender.value
        }
        comboBubbleValue = sender.value
        scoreLabel.text = "\(score)"
        
        if  scoreRankRecord == nil {
            highScore.text = "\(score)"
        } else if sortedScore[0].value < score {
            highScore.text = "\(score)"
        } else if sortedScore[0].value >= score {
            highScore.text = "\(sortedScore[0].value)" }
        }

    func overlapped(newBubble: Bubble) -> Bool {
        for currentBubble in bubbleArray {
            if newBubble.frame.intersects(currentBubble.frame) {
             return true
            }
        }
        return false
    }

    @objc func create() {
        let newBubbleNum = arc4random_uniform(UInt32(maxNumBubble - bubbleArray.count)) + 1
        var i = 0
        
        while i < newBubbleNum {
            //create bubble
            bubble = Bubble()
            //set the position
            bubble.frame = createRandom()
            //check the bubble position for overlapped
            if !overlapped(newBubble: bubble) {
                bubble.addTarget(self, action: #selector(bubbleTapped), for: UIControl.Event.touchUpInside)
                //add the bubble in view
                self.view.addSubview(bubble)
                bubble.animation()
                bubble.fadeAnimation()
                i += 1
                bubbleArray += [bubble]
            }
        }
    }
        
        @objc func createRandom() -> CGRect{
            return CGRect(x: CGFloat(10 + arc4random_uniform(screenWidth - (2 * bubble.radius) - 20)), y: CGFloat(160 + arc4random_uniform(screenHeight - (2 * bubble.radius) - 50)), width: CGFloat(2 * bubble.radius), height: CGFloat(2 * bubble.radius))
        }

    @objc func remove() {
        var i = 0
        while i < bubbleArray.count {
            if arc4random_uniform(100) < 33 {
                let bubbleToBeRemoved = bubbleArray[i]
                bubbleToBeRemoved.removeFromSuperview()
                bubbleArray.remove(at: i)
                i += 1
            }
        }
    }

    @objc func setTime() {
        remainTime.text = "\(timerSeconds)"
        if (timerSeconds == 0) {
            //stop timer
            timer!.invalidate()
            //update the high score
            checkHighScore()
            
            let viewDestination = self.storyboard?.instantiateViewController(withIdentifier: "ScoreViewController") as! ScoreViewController
            self.navigationController?.pushViewController(viewDestination, animated: true)
        }
        timerSeconds -= 1
    }

    func saveScore() {
        rankingRecord.updateValue(score, forKey: "\(playerName)")
        UserDefaults.standard.set(rankingRecord, forKey: "rank")
    }

    func checkHighScore() {
        if scoreRankRecord == nil {
            saveScore()
        } else {
            rankingRecord = scoreRankRecord!
            if rankingRecord.keys.contains("\(playerName)") {
                let currentScore = rankingRecord["\(playerName)"]!
                if currentScore < score {
                    saveScore()
                }
            } else {
                saveScore()
            }
        }
    }
}
