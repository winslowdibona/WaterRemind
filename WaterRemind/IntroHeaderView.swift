//
//  IntroHeaverView.swift
//  WaterRemind
//
//  Created by winslowdibona on 4/18/17.
//  Copyright © 2017 winslowdibona. All rights reserved.
//

import UIKit
import YXWaveView

class IntroHeaderView: UIView {
    
    var label: UILabel!
    var waveView: YXWaveView!
    var strings: [String] = ["WaterReminder", "How often do you want alerts?", "Water Bottle Reminder?", "Notification Permission"]
    
    
    func setup() {
        backgroundColor = Color.red
        label = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.width - 30, height: 125))
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = Color.white
        label.font = UIFont(name: "Helvetica", size: 30)
        waveView = YXWaveView(frame: CGRect(x:0, y:0, width: bounds.width, height: bounds.height), color: Color.blue)
        waveView.waveHeight = 9
        waveView.addOverView(label)
        waveView.backgroundColor = Color.red
        addSubview(waveView)
        waveView.start()
    }
    
    func setIndex(index: Int) {
        UIView.animate(withDuration: 0.15, animations: {
            self.label.alpha = 0
        }) { (complete) in
            self.label.text = self.strings[index]
            UIView.animate(withDuration: 0.15, animations: {
                self.label.alpha = 1
            }, completion: { (complete1) in
                
            })
        }
    }
}
