//
//  ViewController.swift
//  Task4
//
//  Created by Вова Благой on 26.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(fade), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetails" else { return }
        guard let destination = segue.destination as? DetailsViewController else { return }
        if let text = usernameField.text {
            destination.name = text
        }
    }

    @objc func fade() {
            print("NOOOO!!!!!!")
        }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}

