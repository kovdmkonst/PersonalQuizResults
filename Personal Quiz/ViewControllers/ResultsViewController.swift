//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встерчающийся тип живтоного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet var defenitionLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!

    
    var answerArray: [Answer] = []
    
    private var dogScore: [AnimalType] = []
    private var catScore: [AnimalType] = []
    private var turtleScore: [AnimalType] = []
    private var rabbitScore: [AnimalType] = []
    private var dictionary: [AnimalType: Int] = [ : ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        calculateResult()
    }
    
    func calculateResult() {
        for animal in answerArray {
            if animal.type == .dog {
                dogScore.append(animal.type)
            }
            if animal.type == .cat {
                catScore.append(animal.type)
            }
            if animal.type == .turtle {
                turtleScore.append(animal.type)
            }
            if animal.type == .rabbit {
                rabbitScore.append(animal.type)
            }
            
            dictionary = [
                .dog: dogScore.count,
                .cat: catScore.count,
                .turtle: turtleScore.count,
                .rabbit: rabbitScore.count
            ]
            let sorted = dictionary.sorted { $0.value > $1.value }
            let winner = sorted[0].key
            defenitionLabel.text = winner.definition
            resultLabel.text = "Вы - \(winner.rawValue)!"
        }
    }
}
