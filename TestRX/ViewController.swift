//
//  ViewController.swift
//  TestRX
//
//  Created by SHIRAISHI HIROYUKI on 2022/01/18.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    private let reactive = RXSwiftEx()

    var count = 0

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        countUp()
    }

    @IBAction func button(_ sender: Any) {
        reactive.coutUp()
    }
    private func countUp(){
        ///reactive処理
        reactive.event
        /// 通知
            .subscribe { [unowned self] val in
                label.text = String(val)
            }
            .disposed(by: disposeBag)
    }

}

class RXSwiftEx {
    private let subject = PublishSubject<Int>()
    private var count = 0

    var event: Observable<Int> {
        return subject
    }

    func coutUp() {
        /// countUp
        count = count + 1
        /// イベント発行
        subject.onNext(self.count)
    }
}

