//
//  ScoreViewController.swift
//  EunseoChoi_13340260_A2
//
//  Created by 최은서 on 2020/05/22.
//  Copyright © 2020 Eunseo Choi. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    var rankingRecord = [String : Double]()
    var sortedScore = [(key: String, value: Double)]()
    
    @IBOutlet weak var playerName1: UILabel!
    @IBOutlet weak var highScore1: UILabel!
    @IBOutlet weak var playerName2: UILabel!
    @IBOutlet weak var highScore2: UILabel!
    @IBOutlet weak var playerName3: UILabel!
    @IBOutlet weak var highScore3: UILabel!
    
    @IBAction func homeButton(_ sender: UIButton) {
        let viewDestination = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(viewDestination, animated: true)        //present(destinationView, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

                
        if let rankingRecord = UserDefaults.standard.dictionary(forKey: "scoreRank") as! [String : Double]? {
            sortedScore = rankingRecord.sorted(by: {$0.value > $1.value})
            
            if sortedScore.count == 1 {
                playerName1.text = sortedScore[0].key
                highScore1.text = "\(sortedScore[0].value)"
            } else if sortedScore.count == 2 {
                playerName1.text = sortedScore[0].key
                playerName2.text = sortedScore[1].key
                highScore1.text = "\(sortedScore[0].value)"
                highScore2.text = "\(sortedScore[1].value)"
            } else {
                playerName1.text = sortedScore[0].key
                playerName2.text = sortedScore[1].key
                playerName3.text = sortedScore[2].key
                highScore1.text = "\(sortedScore[0].value)"
                highScore2.text = "\(sortedScore[1].value)"
                highScore3.text = "\(sortedScore[2].value)"
            }
        }        // Do any additional setup after loading the view.
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
