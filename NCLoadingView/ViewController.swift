//
//  ViewController.swift
//  NCLoadingView
//
//  Created by LINAICAI on 2017/3/17.
//  Copyright © 2017年 LINAICAI. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // NCLoadingView.textColor = UIColor.red
        //NCLoadingView.tintColor = UIColor.red
        NCLoadingView.show(in: self.view, with: "加载中...")

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

