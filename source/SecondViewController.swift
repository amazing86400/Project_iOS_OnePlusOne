import UIKit

import FirebaseAnalytics

class SecondViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Analytics.logEvent(AnalyticsEventScreenView, parameters: [AnalyticsParameterScreenName: "DarkMode",
                                                                 AnalyticsParameterScreenClass: "SecondViewController",
                                                                  "ep_first": "APP",
                                                                  "ep_second": "iOS"])
    }
    
    // MARK: 디스플레이 라벨
    @IBOutlet weak var mainDisplay: UILabel!
    
    
    // MARK: 프로퍼티 초기값 설정
    var userInput: Bool = false
    var arr: [String] = []
    var num: Int = 0
    
    
    // MARK: 숫자 입력
    // 입력한 숫자를 디스플레이에 나타낸다.
    // 누른 값이 000, 00 일 경우 1000, 100으로 나타낸다.
    @IBAction func button(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            if userInput {
                let displayTxt = mainDisplay.text!
                mainDisplay.text! = displayTxt + digit
            } else {
                if digit == "0" || digit == "00" || digit == "000" {
                    mainDisplay.text! = "1" + digit
                } else {
                    mainDisplay.text! = digit
                }
            }
            userInput = true
        }
    }
    
    
    // MARK: 초기화 버튼
    // 디스플레이에 있는 문자 및 사용자 입력 프로퍼티 초기화
    @IBAction func clear(_ sender: Any) {
        mainDisplay.text! = ""
        arr = []
        num = 0
        userInput = false
        Analytics.logEvent("clear", parameters: ["category": "click",
                                                 "action": "clear"])
    }
    
    
    // MARK: 글자 지우기 버튼
    // dropLast 메소드를 활용해 가장 끝에 있는 문자를 지운다.
    @IBAction func back(_ sender: Any) {
        if mainDisplay.text! != "" {
            mainDisplay.text! = String(mainDisplay.text!.dropLast(1))
        } else {
            let alert = UIAlertController(title: "Stop", message: "숫자를 입력해 주세요.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive))
            present(alert, animated: true)
        }
        Analytics.logEvent("back", parameters: ["category": "click",
                                                "action": "back"])
    }
    
    
    // MARK: 계산 함수 정의
    // switch문 활용하여 각 연산자에 알맞게 연산하여 디스플레이에 값을 나타낸다.
    func calculate(operation: String) {
        switch operation {
        case "+":
            let sum = num + Int(mainDisplay.text!)!
            mainDisplay.text! = String(sum)
            num = sum
        case "-":
            let minus = num - Int(mainDisplay.text!)!
            mainDisplay.text! = String(minus)
            num = minus
        case "×":
            let cross = num * Int(mainDisplay.text!)!
            mainDisplay.text! = String(cross)
            num = cross
        case "÷":
            let div = num / Int(mainDisplay.text!)!
            mainDisplay.text! = String(div)
            num = div
        default:
            print("")
        }
    }
    
    
    // MARK: 더하기 버튼
    // array에 연산자가 없을 경우 '+' 연산자를 추가한다.
    // array에 연산자가 있을 경우 연산을 실행하고, '+' 연산자를 추가한다.
    @IBAction func plus(_ sender: Any) {
        if mainDisplay.text! != "" {
            if userInput {
                if arr.isEmpty {
                    num = Int(mainDisplay.text!)!
                    arr.append("+")
                } else {
                    let value = arr.last
                    calculate(operation: value!)
                    arr.append("+")
                }
                userInput = false
            }
        } else {
            let alert = UIAlertController(title: "Stop", message: "숫자를 입력해 주세요.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive))
            present(alert, animated: true)
        }
        Analytics.logEvent("plus", parameters: ["category": "click",
                                                "action": "plus"])
    }
    
    
    // MARK: 빼기 버튼
    // array에 연산자가 없을 경우 '-' 연산자를 추가한다.
    // array에 연산자가 있을 경우 연산을 실행하고, '-' 연산자를 추가한다.
    @IBAction func minus(_ sender: Any) {
        if mainDisplay.text! != "" {
            if userInput {
                if arr.isEmpty {
                    num = Int(mainDisplay.text!)!
                    arr.append("-")
                } else {
                    let value = arr.last
                    calculate(operation: value!)
                    arr.append("-")
                }
                userInput = false
            }
        } else {
            let alert = UIAlertController(title: "Stop", message: "숫자를 입력해 주세요.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive))
            present(alert, animated: true)
        }
        Analytics.logEvent("minus", parameters: ["category": "click",
                                                 "action": "minus"])
    }
    
    
    // MARK: 곱하기 버튼
    // array에 연산자가 없을 경우 '×' 연산자를 추가한다.
    // array에 연산자가 있을 경우 연산을 실행하고, '×' 연산자를 추가한다.
    @IBAction func cross(_ sender: Any) {
        if mainDisplay.text! != "" {
            if userInput {
                if arr.isEmpty {
                    num = Int(mainDisplay.text!)!
                    arr.append("×")
                } else {
                    let value = arr.last
                    calculate(operation: value!)
                    arr.append("×")
                }
                userInput = false
            }
        } else {
            let alert = UIAlertController(title: "Stop", message: "숫자를 입력해 주세요.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive))
            present(alert, animated: true)
        }
        Analytics.logEvent("cross", parameters: ["category": "click",
                                                 "action": "cross"])
    }
    
    
    // MARK: 나누기 버튼
    // array에 연산자가 없을 경우 '÷' 연산자를 추가한다.
    // array에 연산자가 있을 경우 연산을 실행하고, '÷' 연산자를 추가한다.
    @IBAction func div(_ sender: Any) {
        if mainDisplay.text! != "" {
            if userInput {
                if arr.isEmpty {
                    num = Int(mainDisplay.text!)!
                    arr.append("÷")
                } else {
                    let value = arr.last
                    calculate(operation: value!)
                    arr.append("÷")
                }
                userInput = false
            }
        } else {
            let alert = UIAlertController(title: "Stop", message: "숫자를 입력해 주세요.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Okay", style: .destructive))
            present(alert, animated: true)
        }
        Analytics.logEvent("div", parameters: ["category": "click",
                                               "action": "div"])
    }
}
