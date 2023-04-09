import UIKit
import FirebaseAnalytics

class ViewController: UIViewController {
    
    // MARK: 디스플레이 라벨
    @IBOutlet weak var display: UILabel!
    
    
    // MARK: 프로퍼티 초기값 설정
    var userInput: Bool = false
    let oper: [String] = ["+", "-", "×", "÷"]
    
    
    // MARK: 숫자 입력
    // 입력한 숫자를 디스플레이에 나타낸다.
    @IBAction func touchDigit(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            if userInput {
                let txtCurrentlyInDisplay = display.text!
                display.text! = txtCurrentlyInDisplay + digit
            } else {
                display.text! = ""
                display.text! = digit
            }
            userInput = true
        } else {
            print("Error")
        }
    }
    
    
    // MARK: 글자 지우기 버튼
    // dropLast 메소드를 활용해 가장 끝에 있는 문자를 지운다.
    @IBAction func back(_ sender: Any) {
        display.text! = String(display.text!.dropLast(1))
    }
    
    
    // MARK: 초기화 버튼
    // 디스플레이에 있는 문자 및 사용자 입력 프로퍼티 초기화
    @IBAction func clear(_ sender: Any) {
        display.text! = ""
        userInput = false
    }
    
    
    // MARK: 더하기 버튼
    // 만일 문자열 마지막에 연산자가 있을 경우 해당 연산자로 대체
    @IBAction func plus(_ sender: Any) {
        if userInput {
            let text = display.text!
            let last = String(text[text.index(before: display.text!.endIndex)])
            if oper.contains(last) {
                display.text! = String(display.text!.dropLast(1))
                display.text! = display.text! + "+"
            } else {
                display.text! = display.text! + "+"
            }
        } else {
            userInput = true
            let text = display.text!
            let last = String(text[text.index(before: display.text!.endIndex)])
            if oper.contains(last) {
                display.text! = String(display.text!.dropLast(1))
                display.text! = display.text! + "+"
            } else {
                display.text! = display.text! + "+"
            }
        }
    }
    
    
    // MARK: 빼기 버튼
    // 만일 문자열 마지막에 연산자가 있을 경우 해당 연산자로 대체
    @IBAction func minus(_ sender: Any) {
        if userInput {
            let text = display.text!
            let last = String(text[text.index(before: display.text!.endIndex)])
            if oper.contains(last) {
                display.text! = String(display.text!.dropLast(1))
                display.text! = display.text! + "-"
            } else {
                display.text! = display.text! + "-"
            }
        } else {
            userInput = true
            let text = display.text!
            let last = String(text[text.index(before: display.text!.endIndex)])
            if oper.contains(last) {
                display.text! = String(display.text!.dropLast(1))
                display.text! = display.text! + "-"
            } else {
                display.text! = display.text! + "-"
            }
        }
    }
    
    
    // MARK: 곱하기 버튼
    // 만일 문자열 마지막에 연산자가 있을 경우 해당 연산자로 대체
    @IBAction func cross(_ sender: Any) {
        if userInput {
            let text = display.text!
            let last = String(text[text.index(before: display.text!.endIndex)])
            if oper.contains(last) {
                display.text! = String(display.text!.dropLast(1))
                display.text! = display.text! + "×"
            } else {
                display.text! = display.text! + "×"
            }
        } else {
            userInput = true
            let text = display.text!
            let last = String(text[text.index(before: display.text!.endIndex)])
            if oper.contains(last) {
                display.text! = String(display.text!.dropLast(1))
                display.text! = display.text! + "×"
            } else {
                display.text! = display.text! + "×"
            }
        }
    }
    
    
    // MARK: 나누기 버튼
    // 만일 문자열 마지막에 연산자가 있을 경우 해당 연산자로 대체
    @IBAction func div(_ sender: Any) {
        if userInput {
            let text = display.text!
            let last = String(text[text.index(before: display.text!.endIndex)])
            if oper.contains(last) {
                display.text! = String(display.text!.dropLast(1))
                display.text! = display.text! + "÷"
            } else {
                display.text! = display.text! + "÷"
            }
        } else {
            userInput = true
            let text = display.text!
            let last = String(text[text.index(before: display.text!.endIndex)])
            if oper.contains(last) {
                display.text! = String(display.text!.dropLast(1))
                display.text! = display.text! + "÷"
            } else {
                display.text! = display.text! + "÷"
            }
        }
    }
    
    
    // MARK: 결과값 버튼
    // NSExpression 메소드를 사용하여 수식을 한번에 계산하도록 함
    // 결과값에서 바로 연산이 가능하도록 작성
    @IBAction func result(_ sender: Any) {
        let expression = display.text!
        var expressionWithoutSpaces = expression.replacingOccurrences(of: " ", with: "")
        expressionWithoutSpaces = expressionWithoutSpaces.replacingOccurrences(of: "×", with: "*")
        expressionWithoutSpaces = expressionWithoutSpaces.replacingOccurrences(of: "÷", with: "/")
        let last = String(expressionWithoutSpaces[expressionWithoutSpaces.index(before: expressionWithoutSpaces.endIndex)])
        if oper.contains(last) {
            expressionWithoutSpaces = String(expressionWithoutSpaces.dropLast(1))
            let value = NSExpression(format: expressionWithoutSpaces).expressionValue(with: nil, context: nil) as? Double
            display.text! = String(value!)
        } else {
            let value = NSExpression(format: expressionWithoutSpaces).expressionValue(with: nil, context: nil) as? Double
            display.text! = String(value!)
        }
        userInput = false
    }
}
