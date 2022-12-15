//
//  SecondLevelViewController.swift
//  Mood Tracker
//
//  Created by Daniel Quintillán on 13/12/2022.
//

import UIKit

class SecondLevelViewController: UIViewController{
    var keyword: String?
    var topLevelFeeling: String?
    
    @IBOutlet weak var buttonColumn: UIStackView!
    @objc func onFeelingClicked(sender: UIButton) {
        self.topLevelFeeling = sender.currentTitle

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeKeyword = keyword{
            let data=loadJson()!
            for category in data.feelings{
                for feeling in category.details{
                    if feeling.name == safeKeyword{
                        for sfeeling in feeling.details{
                            let button = UIButton()
                            button.setTitle(sfeeling.name, for: .normal)
                            button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                            button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                            button.addTarget(self, action: #selector(self.onFeelingClicked), for: .touchUpInside)
                            buttonColumn.addArrangedSubview(button)
                        }
                    }

                }
            }
        }
    }
}
