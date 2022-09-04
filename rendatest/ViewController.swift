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
    @IBOutlet weak var abutton: UIButton!
    @IBOutlet weak var kabutton: UIButton!
    @IBOutlet weak var sabutton: UIButton!
    @IBOutlet weak var tabutton: UIButton!
    @IBOutlet weak var nabutton: UIButton!
    @IBOutlet weak var habutton: UIButton!
    @IBOutlet weak var mabutton: UIButton!
    @IBOutlet weak var yabutton: UIButton!
    @IBOutlet weak var rabutton: UIButton!
    @IBOutlet weak var wabutton: UIButton!
    @IBOutlet weak var retrybutton: UIButton!
    @IBOutlet var ue:UILabel!
    @IBOutlet var migi:UILabel!
    @IBOutlet var sita:UILabel!
    @IBOutlet var hidari:UILabel!
    @IBOutlet var circle:UIImageView!
    
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
    var index:Int=1
    
    let clearSound=try!AVAudioPlayer(data: NSDataAsset(name: "SE_fanfare")!.data)
    let failureSound=try!AVAudioPlayer(data: NSDataAsset(name: "SE_gameover")!.data)
    let correctSound=try!AVAudioPlayer(data: NSDataAsset(name: "correct")!.data)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        t.text=""
        _t.text=""
        timerStart()
        timerLabel.text=""
        retrybutton.isHidden=true
        retrybutton.isEnabled=false
        circle.isHidden=true
    }
    func tap(initial:inout [String]){
        if n < 4{
            n += 1
            t.text=initial[n]
            if t.text == "く" && index == 1{
                ue.text="べ"
                migi.text="く"
                sita.text="ち"
                hidari.text="ぱ"
                timeCount=16
                index += 1
                t.text=""
                correctSound.play()
                circle.isHidden=false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.circle.isHidden=true
                }
            }
            if t.text == "お" && index == 3{
                _t.text="CLEAR"
                abutton.isEnabled = false
                kabutton.isEnabled = false
                sabutton.isEnabled = false
                tabutton.isEnabled = false
                nabutton.isEnabled = false
                habutton.isEnabled = false
                mabutton.isEnabled = false
                yabutton.isEnabled = false
                rabutton.isEnabled = false
                wabutton.isEnabled = false
                retrybutton.isHidden=false
                retrybutton.isEnabled=true
                createTimer?.invalidate()
                clearSound.play()
            }
        }else{
            n = 0
            t.text=initial[n]
        }
    }
    func tap2(initial:inout [String]){
        if _n < 2{
            _n += 1
            t.text=initial[_n]
            if t.text == "ん" && index == 2{
                ue.text="こ"
                migi.text="と"
                sita.text="り"
                hidari.text="め"
                timeCount=16
                index += 1
                t.text=""
                correctSound.play()
                circle.isHidden=false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.circle.isHidden=true
                }
            }
        }else{
            _n = 0
            t.text=initial[_n]
        }
    }
    @IBAction func atap(){
        tap(initial:&a)
    }
    @IBAction func katap(){
        tap(initial:&ka)
    }
    @IBAction func satap(){
        tap(initial:&sa)
    }
    @IBAction func tatap(){
        tap(initial:&ta)
    }
    @IBAction func natap(){
        tap(initial:&na)
    }
    @IBAction func hatap(){
        tap(initial:&ha)
    }
    @IBAction func matap(){
        tap(initial:&ma)
    }
    @IBAction func yatap(){
        tap2(initial:&ya)
    }
    @IBAction func ratap(){
        tap(initial:&ra)
    }
    @IBAction func watap(){
        tap2(initial:&wa)
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
          abutton.isEnabled = false
          kabutton.isEnabled = false
          sabutton.isEnabled = false
          tabutton.isEnabled = false
          nabutton.isEnabled = false
          habutton.isEnabled = false
          mabutton.isEnabled = false
          yabutton.isEnabled = false
          rabutton.isEnabled = false
          wabutton.isEnabled = false
          retrybutton.isHidden=false
          retrybutton.isEnabled=true
          failureSound.play()
      }
    }
    @IBAction func retry(){
        abutton.isEnabled = true
        kabutton.isEnabled = true
        sabutton.isEnabled = true
        tabutton.isEnabled = true
        nabutton.isEnabled = true
        habutton.isEnabled = true
        mabutton.isEnabled = true
        yabutton.isEnabled = true
        rabutton.isEnabled = true
        wabutton.isEnabled = true
        retrybutton.isHidden=true
        retrybutton.isEnabled=false
        t.text=""
        _t.text=""
        timeCount=16
        timerStart()
        n = -1
        _n = -1
        ue.text="さ"
        migi.text="ば"
        sita.text="ら"
        hidari.text="は"
        index=1
    }


}

