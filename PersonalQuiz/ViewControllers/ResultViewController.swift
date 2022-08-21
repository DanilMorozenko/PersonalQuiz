//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 18.08.2022.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var taglineLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    
    @IBOutlet var backBarButton: UINavigationItem!
  
    // 1. Передать массив с ответами на экран с результатами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    var resultAnswers: [Answer] = []
    private var catNumber = 0
    private var dogNumber = 0
    private var turtleNumber = 0
    private var rabbitNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseVariant()
        backBarButton.hidesBackButton = true
    }
    
    private func calculateResult() {
        for resultAnswer in resultAnswers {
            switch resultAnswer.type {
        case .dog:
            dogNumber += 1
        case .cat:
            catNumber += 1
        case .rabbit:
            rabbitNumber += 1
        case .turtle:
            turtleNumber += 1
            }
        }
    }
    
    private func chooseVariant () {
        calculateResult()
        if dogNumber > catNumber && dogNumber > rabbitNumber && dogNumber > turtleNumber {
            taglineLabel.text = "Вы - \(AnimalType.dog.rawValue)"
            textLabel.text = "\(AnimalType.dog.definition)"
        } else if catNumber > dogNumber && catNumber > turtleNumber && catNumber > rabbitNumber {
            taglineLabel.text = "Вы - \(AnimalType.cat.rawValue)"
            textLabel.text = "\(AnimalType.cat.definition)"
        } else if turtleNumber > dogNumber && turtleNumber > catNumber && turtleNumber > rabbitNumber {
            taglineLabel.text = "Вы - \(AnimalType.turtle.rawValue)"
            textLabel.text = "\(AnimalType.turtle.definition)"
        } else if rabbitNumber > dogNumber && rabbitNumber > catNumber && rabbitNumber > turtleNumber {
            taglineLabel.text = "Вы - \(AnimalType.rabbit.rawValue)"
            textLabel.text = "\(AnimalType.rabbit.definition)"
        }
    }
 
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}


