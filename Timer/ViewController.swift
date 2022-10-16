//
//  ViewController.swift
//  Timer
//
//  Created by 박다미 on 2022/10/16.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var slider: UISlider!
    weak var timer: Timer?
    var num:Int = 0
    
    @IBOutlet weak var startBtn: UIButton!
    var stop:Int = 0 //stop<->start 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        configureUI()
        
    }
    func configureUI(){
        mainLable.text = "초를 선택하세요"
        //슬라이더 가운데 설정
        slider.setValue(0.5, animated: true)
        num = 0
        timer?.invalidate()
        startBtn.setTitle("Start", for: .normal)
        startBtn.backgroundColor = #colorLiteral(red: 0, green: 0.7525901198, blue: 0.98887676, alpha: 1)
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        //sliderValue값으로 mainLable text 세팅
        num = Int(slider.value * 60) //0.0~1.0
       // print(seconds)
        mainLable.text = "\(num) 초"
        
        
    }
    
    
    @IBAction func startTappedBtn(_ sender: UIButton) {
        //1초당 줄어들기
       
        timer?.invalidate()
//        timer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(afterOneSec), userInfo: nil, repeats: true)
        
        //stop = 0 일때 timer 진행중
        if stop == 0{
            startBtn.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        startBtn.setTitle("Stop", for: .normal)
            stop=1
            //시간 가기
            timer = Timer.scheduledTimer(timeInterval:1.0, target: self, selector: #selector(afterOneSec), userInfo: nil, repeats: true)
           
          
        }
        else{
            startBtn.setTitle("Start", for: .normal)
            stop=0
            stopTimerTest()
            
            
        }
        
        
//        timer =  Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
//                // Do what you need to do repeatedly
//
//
//
//            }
        
        
        
    }
    
    func stopTimerTest() {
      timer?.invalidate()
      timer = nil
      startBtn.backgroundColor = #colorLiteral(red: 0, green: 0.7525901198, blue: 0.98887676, alpha: 1)
    }
    
    
    @objc func afterOneSec(){
        if num>0{
            num -= 1
            //slider, mainLable 도 표시
            slider.value = Float(num)/Float(60)
            mainLable.text = "\(num) 초"
            
            
        }
        else{
            num = 0
            //timer 비활성화해야 멈춤
            timer?.invalidate()
            //num=0일때 소리내기
            AudioServicesPlayAlertSound(SystemSoundID(1322))
            
            
        }
    }
    
    @IBAction func resetTappedBtn(_ sender: UIButton) {
        
        configureUI()
        
    }
    
}

