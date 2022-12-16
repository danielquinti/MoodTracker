//
//  SecondLevelViewController.swift
//  Mood Tracker
//
//  Created by Daniel Quintillán on 13/12/2022.
//

import UIKit

class SecondLevelViewController: UIViewController{
    var keyword: String?
    var moodModelManager: MoodModelManager?
    
    @IBOutlet weak var buttonColumn: UIStackView!
    
    func viewwillappear(){
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden=false
    }
    
    @objc func onFeelingClicked(sender: UIButton){
        print(keyword,sender.currentTitle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeKeyword = keyword{
            let data=moodModelManager!.loadJson()!
            for category in data.feelings{
                for feeling in category.details{
                    if feeling.name == safeKeyword{
                        for sfeeling in feeling.details{
                            
                            let stack = UIStackView()
                            stack.axis = .horizontal
                            stack.alignment = .fill
                            stack.distribution = .fillEqually
                            
                            var button = UIButton()
                            button.setTitle(sfeeling.details[0], for: .normal)
                            button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                            button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                            
                            
                            button.addTarget(self, action: #selector(self.onFeelingClicked), for: .touchUpInside)
                            
                            stack.addArrangedSubview(button)
                            
                            
                            button = UIButton()
                            button.setTitle(sfeeling.name, for: .normal)
                            button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                            button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                            button.alpha = 0.5
                            stack.addArrangedSubview(button)
                            
                            
                            button = UIButton()
                            button.setTitle(sfeeling.details[1], for: .normal)
                            button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                            button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
                            
                            
                            button.addTarget(self, action: #selector(self.onFeelingClicked), for: .touchUpInside)
                            
                            stack.addArrangedSubview(button)
                            
                            buttonColumn.addArrangedSubview(stack)
                        }
                    }

                }
            }
        }
    }
}

