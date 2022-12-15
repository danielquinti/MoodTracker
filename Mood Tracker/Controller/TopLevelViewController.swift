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
    
    var topLevelFeeling : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data=loadJson()!
        for category in data.feelings{
            if category.name == "uncomfortable"{
            for feeling in category.details{
                let button = UIButton()
                button.setTitle(feeling.name, for: .normal)
                button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                button.addTarget(self, action: #selector(self.onFeelingClicked), for: .touchUpInside)
                leftColumn.addArrangedSubview(button)
            }
            }
            else{
                for feeling in category.details{
                    let button = UIButton()
                    button.setTitle(feeling.name, for: .normal)
                    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                    button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
                    button.addTarget(self, action: #selector(self.onFeelingClicked), for: .touchUpInside)

                    rightColumn.addArrangedSubview(button)
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondLevel"{
            let destination = segue.destination as! SecondLevelViewController
            destination.keyword = self.topLevelFeeling
        }
    }

    @objc func onFeelingClicked(sender: UIButton) {
        self.topLevelFeeling = sender.currentTitle
        self.performSegue(withIdentifier: "secondLevel", sender: self)

    }

}

