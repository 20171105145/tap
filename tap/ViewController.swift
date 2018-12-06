//
//  ViewController.swift
//  tap
//
//  Created by 杜炎峰 on 2018/11/29.
//  Copyright © 2018 杜炎峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var num = 0 //num用于计算tap me 按键数
    var time = 0//time用于追踪秒数

    var  overtime = Timer()//overtime用timer 描述时间是否终止
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBOutlet weak var timerL: UILabel!
    @IBOutlet weak var scoreL: UILabel!
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        if num == 0{
            setupGame()
            subtracTimer()
        }
        
        if time > 0{
            num = num + 1
            scoreL.text = "score\(num)"
        }
        else { scoreL.text = "时间已结束，score\(num)"
        }
        
    }
    func setupGame(){
        time = 30
        timerL.text = "Time:\(time)"
        scoreL.text = "score:\(num)"
        overtime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(subtracTimer), userInfo: nil, repeats: true)//
        
    }
    @objc func subtracTimer(){
        
        time = time - 1
        timerL.text = "Time: \(time)"
        if(time == 0)  {
            overtime.invalidate()//阻止时间减少
        }
}
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let alert = UIAlertController(title: "Time  Is Up!", message: "You scored/(count) points", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: {
            action in self.setupGame()
        }),
self.presentedViewController(alert,animated: true,completion: nil)
        )
        
    }
}
