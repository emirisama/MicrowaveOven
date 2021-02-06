//
//  ViewController.swift
//  MicrowaveOven
//
//  Created by 中森えみり on 2021/01/31.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    

    

    @IBOutlet weak var PickerView: UIPickerView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var wattLabel: UILabel!
    
    var timer = Timer()
    var count = 0
    var wattcount = 0
    
    let countList = [[Int](0...60),[Int](0...60)]
    let wattList:[String] = ["500W","600W","1200W"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PickerView.delegate = self
        PickerView.dataSource = self
        //分のラベルを追加
         let minutes = UILabel()
        minutes.text = "分"
        minutes.sizeToFit()
        minutes.frame = CGRect(x:PickerView.bounds.width/2 - minutes.bounds.width*4, y:PickerView.bounds.height/2 - (minutes.bounds.height/2), width: minutes.bounds.width, height: minutes.bounds.height)
        PickerView.addSubview(minutes)
        //秒のラベル追加
        let seconds = UILabel()
        seconds.text = "秒"
        seconds.sizeToFit()
        seconds.frame = CGRect(x: PickerView.bounds.width*7/8 - seconds.bounds.width/2, y: PickerView.bounds.height/2 - (seconds.bounds.height/2), width: seconds.bounds.width, height: seconds.bounds.height)
        PickerView.addSubview(seconds)
        
        
    }


    
    
    //コンポーネントの個数を返すメソッド
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return countList.count
    }
    
    //コンポーネントに含まれるデータの個数を返すメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countList[component].count
    }
    
    //データを返すメソッド
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let countLabel = UILabel()
        countLabel.textAlignment = NSTextAlignment.center
        countLabel.text = String(countList[component][row])
        return countLabel
        
    }
    
    //invalidateはタイマー停止
    @IBAction func startButton(_ sender: Any) {
        timer.invalidate()
        count = countList[0][PickerView.selectedRow(inComponent:  0)] * 60
            + countList[0][PickerView.selectedRow(inComponent: 1)]
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        count = 0
        countLabel.text = "あたため完了"
    }
    
    
    //タイマーから呼び出されるメソッド
    @objc func countDown(){
        count -= 1
        if(count > 0){
            countLabel.text = "残り\(count)秒です"
        }else{
            countLabel.text = "あたため完了"
            timer.invalidate()
        }
    }
    
    
    @IBAction func wattButton(_ sender: Any) {
        wattcount += 1
        if wattcount == 1{
            wattLabel.text = "500W"
        }else if wattcount == 2{
            wattLabel.text = "600W"
        }else if wattcount == 3{
            wattLabel.text = "1200W"
        }
    }
    
    
    
}

