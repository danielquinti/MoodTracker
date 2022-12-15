//
//  ViewController.swift
//  Mood Tracker
//
//  Created by Daniel Quintillán on 03/12/2022.
//

import UIKit

class TopLevelViewController: UIViewController {

    @IBOutlet weak var leftColumn: UIStackView!
    @IBOutlet weak var rightColumn: UIStackView!
    
    var moodModelManager = MoodModelManager()
    var topLevelFeeling : String?
    
    func column(comfort:Bool,color:UIColor){
        if let safeFeelings = moodModelManager.getSecondLevelFeelings(comfort: comfort){
            for feeling in safeFeelings{
                let button = UIButton()
                button.setTitle(feeling.name, for: .normal)
                button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                button.backgroundColor = color
                button.addTarget(self, action: #selector(self.onFeelingClicked), for: .touchUpInside)
                if comfort{rightColumn.addArrangedSubview(button)}
                else{leftColumn.addArrangedSubview(button)}
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        column(comfort: false, color: #colorLiteral(red: 0.5799757838, green: 0.07781272382, blue: 0.08502667397, alpha: 1))
        column(comfort: true, color: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondLevel"{
            let destination = segue.destination as! SecondLevelViewController
            destination.moodModelManager = self.moodModelManager
            destination.keyword = self.topLevelFeeling
        }
    }

    @objc func onFeelingClicked(sender: UIButton) {
        self.topLevelFeeling = sender.currentTitle
        self.performSegue(withIdentifier: "secondLevel", sender: self)

    }

}

