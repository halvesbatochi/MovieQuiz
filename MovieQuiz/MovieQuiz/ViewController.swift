//
//  ViewController.swift
//  MovieQuiz
//
//  Created by Henrique Alves Batochi on 09/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viSoundBar: UIView!
    @IBOutlet weak var slMusic: UISlider!
    @IBOutlet var btOptions: [UIButton]!
    @IBOutlet weak var ivQuiz: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
    }
    
    @IBAction func changeMusicTime(_ sender: UISlider) {
    }
    
    @IBAction func showHideSoundBar(_ sender: Any) {
    }
    
    @IBAction func changeMusicStatus(_ sender: UIButton) {
    }
    
}

