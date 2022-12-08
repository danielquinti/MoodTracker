//
//  ViewController.swift
//  Mood Tracker
//
//  Created by Daniel Quintillán on 03/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftColumn: UIStackView!
    @IBOutlet weak var rightColumn: UIStackView!
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
                leftColumn.addArrangedSubview(button)
            }
            }
            else{
                for feeling in category.details{
                    let button = UIButton()
                    button.setTitle(feeling.name, for: .normal)
                    button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                    rightColumn.addArrangedSubview(button)
                }
            }
        }
    }


}

