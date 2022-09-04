//
//  ViewController.swift
//  rendatest
//
//  Created by K I on 2022/08/29.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var t:UILabel!
    @IBOutlet var _t:UILabel!
    @IBOutlet var timerLabel: UILabel!
    var timeCount = 16
    var createTimer:Timer?
    
    var a:[String] = ["あ","い","う","え","お"]
    var ka:[String] = ["か","き","く","け","こ"]
    var sa:[String] = ["さ","し","す","せ","そ"]
    var ta:[String] = ["た","ち","つ","て","と"]
    var na:[String] = ["な","に","ぬ","ね","の"]
    var ha:[String] = ["は","ひ","ふ","へ","ほ"]
    var ma:[String] = ["ま","み","む","め","も"]
    var ya:[String] = ["や","ゆ","よ"]
    var ra:[String] = ["ら","り","る","れ","ろ"]
    var wa:[String] = ["わ","を","ん"]
    
    var n:Int = -1
    var _n:Int = -1
    
    let clearSound=try!AVAudioPlayer(data: NSDataAsset(name: "SE_fanfare")!.data)
    let failureSound=try!AVAudioPlayer(data: NSDataAsset(name: "SE_gameover")!.data)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        t.text=""
        _t.text=""
        timerStart()
        timerLabel.text=""
    }
    
    @IBAction func atap(){
        if n < 4{
            n += 1
            t.text=a[n]
        }else{
            n = 0
            t.text=a[n]
        }
    }
    @IBAction func katap(){
        if n < 4 {
            n += 1
            t.text=ka[n]
            if n == 2{
                _t.text="CLEAR"
                clearSound.play()
                createTimer?.invalidate()
            }
        }else{
            n = 0
            t.text=ka[n]
        }
    }
    @IBAction func satap(){
        if n < 4{
            n += 1
            t.text=sa[n]
        }else{
            n = 0
            t.text=sa[n]
        }
    }
    @IBAction func tatap(){
        if n < 4{
            n += 1
            t.text=ta[n]
        }else{
            n = 0
            t.text=ta[n]
        }
    }
    @IBAction func natap(){
        if n < 4{
            n += 1
            t.text=na[n]
        }else{
            n = 0
            t.text=na[n]
        }
    }
    @IBAction func hatap(){
        if n < 4{
            n += 1
            t.text=ha[n]
        }else{
            n = 0
            t.text=ha[n]
        }
    }
    @IBAction func matap(){
        if n < 4{
            n += 1
            t.text=ma[n]
        }else{
            n = 0
            t.text=ma[n]
        }
    }
    @IBAction func yatap(){
        if _n < 2{
            _n += 1
            t.text=ya[_n]
        }else{
            _n = 0
            t.text=ya[_n]
        }
    }
    @IBAction func ratap(){
        if n < 4{
            n += 1
            t.text=ra[n]
        }else{
            n = 0
            t.text=ra[n]
        }
    }
    @IBAction func watap(){
        if _n < 2{
            _n += 1
            t.text=wa[_n]
        }else{
            _n = 0
            t.text=wa[_n]
        }
    }
    func timerStart() {
      createTimer = Timer.scheduledTimer(timeInterval:1, //1秒毎指定
                                          target: self,
                                          selector: #selector(self.countDown),
                                          userInfo: nil,
                                          repeats: true)
    }
    @objc func countDown(sender:Timer) {
      timeCount -= 1
      if 0 <= timeCount && timeCount <= 15 {
        timerLabel.text = String(timeCount)
      }
      if timeCount == 0 {
        createTimer?.invalidate()
        _t.text="FAILED"
          failureSound.play()
      }
    }


}

