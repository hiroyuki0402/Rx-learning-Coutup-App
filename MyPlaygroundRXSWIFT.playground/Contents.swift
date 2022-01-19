import UIKit
import RxSwift
import RxCocoa

var greeting = "Hello, playground"

class TestClass {

    var button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 50, y: 50, width: 200, height: 80)
        button.addTarget(button, action: #selector(test(sender:)), for: .touchUpInside)
        return button
    }()

    var count = 0
    let deposibag = DisposeBag()





    @objc func test(sender: UIButton){
        count += 1
        print(count)
    }

}

let testClass = TestClass()
