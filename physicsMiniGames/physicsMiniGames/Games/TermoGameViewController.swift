//
//
//  physicsMiniGames
//
//  Created by rshier on 29/04/19.
//  Copyright © 2019 Ahmad Nizar. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UIView {
    func makeVertical(){
        transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
    }
}

class TermoGameViewController: UIViewController {
    
    @IBOutlet weak var celciusSlider: UISlider!
    @IBOutlet weak var reamurSlider: UISlider!
    @IBOutlet weak var fahrenheitSlider: UISlider!
    @IBOutlet weak var kelvinSlider: UISlider!
    
    @IBOutlet weak var celciusText: UITextField!
    @IBOutlet weak var reamurText: UITextField!
    @IBOutlet weak var fahrenheitText: UITextField!
    @IBOutlet weak var kelvinText: UITextField!
    @IBOutlet weak var questionSlider: UILabel!
    
    let disposeBag = DisposeBag()
    var tempEntered: Dictionary<String, Float> = [:]
    var tempAnswer: Dictionary<String, Float> = [:]
    var rightAnswerCount = 0
    var maxCycle = 5
    var cycle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        rotateSlider()
        initData()
        //        bindTextToSlider()
        bindSlider()
    }
    
    func initData(){
        let temperature = Float.random(in: 10...50)
        celciusSlider.value = temperature
        cycle += 1
        
        self.tempAnswer["reamur"] = round((4/5) * temperature)
        self.tempAnswer["fahrenheit"] = round(((9/5) * temperature) + 32)
        self.tempAnswer["kelvin"] = round(temperature + 273)
        
        questionSlider.text = "\(cycle). What temperature are for R, F, and K if C is \(Int(temperature))"
        print(self.tempAnswer)
    }
    
    func bindTextToSlider(){
        let reamur = reamurText.rx.text.map {round(Float($0!)!)}
        let fahrenheit = fahrenheitText.rx.text.map {round(Float($0!)!)}
        let kelvin = kelvinText.rx.text.map {round(Float($0!)!)}
        
        reamur.bind(to: reamurSlider.rx.value).disposed(by: disposeBag)
        fahrenheit.bind(to: fahrenheitSlider.rx.value).disposed(by: disposeBag)
        kelvin.bind(to: kelvinSlider.rx.value).disposed(by: disposeBag)
    }
    
    func bindSlider(){
        celciusSlider.rx.value.subscribe(onNext: {
            self.celciusText.text = String(round($0))
        }).disposed(by: disposeBag)
        
        reamurSlider.rx.value.subscribe(onNext: {
            let number = round($0)
            self.tempEntered["reamur"] = number
            self.reamurText.text = String(number)
        }).disposed(by: disposeBag)
        
        fahrenheitSlider.rx.value.subscribe(onNext: {
            let number = round($0)
            self.tempEntered["fahrenheit"] = number
            self.fahrenheitText.text = String(number)
        }).disposed(by: disposeBag)
        
        kelvinSlider.rx.value.subscribe(onNext: {
            let number = round($0)
            self.tempEntered["kelvin"] = number
            self.kelvinText.text = String(number)
        }).disposed(by: disposeBag)
    }
    
    func rotateSlider() {
        celciusSlider.makeVertical()
        reamurSlider.makeVertical()
        fahrenheitSlider.makeVertical()
        kelvinSlider.makeVertical()
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        //        print(self.tempEntered)
        print(self.tempAnswer)
        
        self.rightAnswerCount += self.tempEntered.filter { temp, value in
            value == self.tempAnswer[temp]
            }.count
        
        if cycle == maxCycle {
            self.performSegue(withIdentifier: "GameToScoreBoard", sender: self)
        }
        
        restart()
    }
    
    func restart(){
        initData()
        
        celciusText.text = String(round(celciusSlider.value))
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GameToScoreBoard"  {
            let scoreBoard = segue.destination as! GameScoreViewController
            scoreBoard.score = rightAnswerCount
        }
    }
    
    
}
