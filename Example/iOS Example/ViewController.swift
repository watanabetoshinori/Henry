//
//  ViewController.swift
//  iOS Example
//
//  Created by Toshinori Watanabe on 12/31/17.
//  Copyright © 2017 Toshinori Watanabe. All rights reserved.
//

import UIKit
import Henry

class ViewController: UIViewController {

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Actions

    @IBAction func printDate(_ sender: Any) {
        print("\(Date()) [\((#file as NSString).lastPathComponent):\(#line) \(#function)]")
    }

    // MARK: - Shake

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == .motionShake {
            Henry.show()
        }
    }

}
