//
//  DetailsPage.swift
//  ProgramaticUI
//
//  Created by sinbad on 4/17/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class DetailsPage : UIViewController {
    
    let topView:UIView = UIView()
    let topSliderImage:UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        
     
    
    }
    @objc func handleFav(){
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let addBtn = UIBarButtonItem(image: UIImage(named: "heart"), style: .plain, target: self, action: #selector(handleFav))
        addBtn.tintColor = .white
        self.navigationItem.rightBarButtonItem = addBtn
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()  
    }
    
    func setUI(){
 
        self.view.addSubview(topSliderImage)
        topSliderImage.image = UIImage(named: "img-1")
        topSliderImage.contentMode = .scaleAspectFit
        topSliderImage.translatesAutoresizingMaskIntoConstraints = false
        topSliderImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topSliderImage.heightAnchor.constraint(equalToConstant: 350).isActive = true
        topSliderImage.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    }
}
