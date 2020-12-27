//
//  DetailsViewController.swift
//  Task4
//
//  Created by Вова Благой on 27.12.2020.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var username: UILabel!
    
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        username.text = name
    }
    
    @IBAction func firstButton(_ sender: UIButton) {
        showAlert()
    }
    
    @IBAction func secondButton(_ sender: UIButton) {
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Big Alert Title", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        present(alert, animated: true)
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
