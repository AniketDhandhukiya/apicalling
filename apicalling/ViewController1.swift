//
//  ViewController1.swift
//  apicalling
//
//  Created by R83 on 29/03/23.
//

import UIKit

class ViewController1: UIViewController {

    @IBOutlet weak var imageview1: UIImageView!
    @IBOutlet weak var imageview2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var label11 = ""
    var label21 = ""
    var img1 = UIImage()
    var img2 = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        label1.text = label11
        label2.text = label21
        imageview1.image = img1
        imageview2.image = img2
        label1.layer.borderColor = UIColor.black.cgColor
        label1.layer.borderWidth = 2.0
        label2.layer.borderColor = UIColor.black.cgColor
        label2.layer.borderWidth = 2.0
//        imageview1.layer.borderColor = UIColor.red.cgColor
//        imageview1.layer.borderWidth = 5.0
//        imageview2.layer.borderColor = UIColor.red.cgColor
//        imageview2.layer.borderWidth = 5.0
    }
 
}
