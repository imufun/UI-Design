//
//  ViewController.swift
//  ProgramaticUI
//
//  Created by sinbad on 4/16/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit


extension String {
    func toUInt() -> UInt? {
        let scanner = Scanner(string: self)
        var u: UInt64 = 0
        if scanner.scanUnsignedLongLong(&u) && scanner.isAtEnd {
            return UInt(u)
        }
        return nil
    }
}



class ViewController: UIViewController {
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    var colorValus = ["FF0811","FF5733","65498C"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let sendButton:UIButton = UIButton(type: .system)
        let pushButton:UIButton = UIButton(type: .system)
        
        sendButton.setTitle("Send", for: .normal)
        sendButton.backgroundColor = .red
        sendButton.layer.cornerRadius = 8
        sendButton.layer.borderWidth = 1
        sendButton.layer.borderColor = UIColor.green.cgColor
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(handleSendButton), for: .touchUpInside)
        view.addSubview(sendButton)
        sendButton.center = self.view.center
        
        
        
        pushButton.setTitle("Next", for: .normal)
        pushButton.backgroundColor = .red
        pushButton.layer.cornerRadius = 8
        pushButton.layer.borderWidth = 1
        pushButton.layer.borderColor = UIColor.green.cgColor
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.addTarget(self, action: #selector(handleSendPush), for: .touchUpInside)
        view.addSubview(pushButton)
        pushButton.center = self.view.center
        
        
        
       // sendButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        
        self.view.addConstraints([
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 200),
            sendButton.heightAnchor.constraint(equalToConstant: 40),
            
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushButton.topAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: 20),
            pushButton.widthAnchor.constraint(equalToConstant: 200),
            pushButton.heightAnchor.constraint(equalToConstant: 40),
            
            ])
        
        var xOffest:CGFloat = 20
        for color in 0..<colorValus.count {
            let colorButton = UIButton(frame: CGRect(x: xOffest, y: 200, width: 50, height: 50))
            xOffest += 60
            colorButton.backgroundColor = hexStringToUIColor( hex: colorValus[color])
            colorButton.layer.cornerRadius = colorButton.frame.width / 2
            colorButton.layer.borderWidth = 1
            colorButton.titleLabel?.text = "\(color)"
            colorButton.addTarget(self, action: #selector(handleColorBtn), for: .touchUpInside)
            self.view.addSubview(colorButton)
            print("\(index) \(color)")
        }
        
   
    }
    @objc func handleSendButton(){
        let details = DetailsPage()
        self.navigationController?.pushViewController(details, animated: true)
    }
    
    @objc func handleSendPush(){
        let newVC = SplashScreen()
        self.present(newVC, animated: true, completion: nil)
    }
    
    
    @objc func handleColorBtn(sender:UIButton){
        if sender.titleLabel?.text != nil {
            print("Selected\(sender.titleLabel?.text)")
        } else {
            print("Not selected")
        }
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8)  / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


//var x: Float = 10
//var y: Float = 10
//var width: Float = 50
//var height: Float = 50
//for i in 0..<10 {
//    var btn = UIButton(type: .roundedRect)
//    btn.frame = CGRect(x: CGFloat(x), y: CGFloat(y) + 100, width: CGFloat(width), height: CGFloat(height))
//    btn.backgroundColor  = getRandomColor()
//    btn.layer.cornerRadius = btn.frame.width / 2
//    btn.layer.borderWidth = 1
//    btn.layer.masksToBounds = false
//    btn.layer.borderColor = UIColor.lightGray.cgColor
//    //  btn.addTarget(self, action: #selector(handleColorBtn), for: .touchUpInside)
//    // btn.clipsToBounds = true
//    btn.setTitle("B\(i + 1)", for: .normal)
//    //  view.addSubview(btn)
//
//    x = x + width + 20
//
//    if (i + 1) % 6 == 0 {
//        x = 10
//        y = y + height + 20
//    }
//}
