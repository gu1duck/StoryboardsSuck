//
//  ViewController.swift
//  StoryboardsSuck
//
//  Created by Jeremy Petter on 2016-04-14.
//  Copyright © 2016 JeremyPetter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.greenColor()

        view.addSubview(subview)

        subview.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 100).active = true
        subview.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor, constant: -50).active = true
        subview.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor, constant: 50).active = true
        subview.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor, constant: -50).active = true

        subview.addSubview(button)

        button.centerXAnchor.constraintEqualToAnchor(subview.centerXAnchor).active = true
        button.topAnchor.constraintEqualToAnchor(subview.topAnchor, constant: 50).active = true

        button.addTarget(self, action: #selector(goNext), forControlEvents: .TouchUpInside)
    }

    lazy var subview:UIView = {
        let subview = UIView()

        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.backgroundColor = UIColor.whiteColor()

        return subview
    }()

    lazy var button:UIButton = {
        let button = UIButton()

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)

        return button
    }()

    func goNext() {
        let next = ViewController()
        navigationController?.pushViewController(next, animated: true)
    }

}

