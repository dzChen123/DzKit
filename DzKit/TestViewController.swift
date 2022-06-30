//
//  TestViewController.swift
//  DzKit
//
//  Created by 陈毅琥 on 2022/6/30.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let butn = UIButton.init(title: "shdiahjds", titleColor: .black, titleFont: .systemFont(ofSize: 16), image: "emoji")
        let imgView = UIImageView.init(image: .init(named: "emoji"))
        
        view.addSubview(butn)
        view.addSubview(imgView)
        butn.frame = .init(x: 100, y: 100, width: 250, height: 65)
        butn.backgroundColor = .red
        butn.relayoutImageTitle(with: 5, position: .bottomTop)
        
        imgView.frame = .init(x: 100, y: 400, width: 50, height: 50)
        imgView.backgroundColor = .yellow
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
