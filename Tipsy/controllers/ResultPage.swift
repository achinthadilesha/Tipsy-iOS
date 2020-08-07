//
//  ResultPage.swift
//  Tipsy
//
//  Created by Achintha Dilesha on 8/6/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultPage: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var summarylabel: UILabel!
    var total:String?
    var tipPercentage:String?
    var person:Int?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text=total ?? "0.0"
        summarylabel.text="Split between \(person ?? 1) people, with \(tipPercentage ?? "0%") tip"
    }
    
    @IBAction func ReCalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
