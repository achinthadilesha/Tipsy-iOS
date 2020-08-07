

import UIKit

class CalculationPage: UIViewController {

    @IBOutlet weak var inputLabel: UITextField!
    @IBOutlet weak var ZeroLabel: UIButton!
    @IBOutlet weak var TenLabel: UIButton!
    @IBOutlet weak var TwentyLabel: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var StepperLabel: UIStepper!
    
    var tipPercentage:Double = 0.0
    var stepperValue:Int = 1
    var billAmount:Double = 0.0
    var total:String?
    var percentageTitle:String="0%"
//    var tipAmount:Double?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }

    @IBAction func PercentageButtonPressed(_ sender: UIButton) {
        
        ZeroLabel.isSelected=false
        TenLabel.isSelected=false
        TwentyLabel.isSelected=false
        
        sender.isSelected=true
        
        
        
        percentageTitle=sender.currentTitle!
        
        if(percentageTitle=="0%"){
            tipPercentage=0.0
        }
        else if(percentageTitle=="10%"){
            tipPercentage=0.1
        }
        else{
            tipPercentage=0.2
        }
        
//        let percentageTitleWithoutPercentageMark=percentageTitle.dropLast()
//
//
//        tipPercentage=Double(percentageTitleWithoutPercentageMark)! / Double(100)
//        print(tipAmount)
        
        inputLabel.endEditing(true)
        
    }
    
    @IBAction func StepperButtonPressed(_ sender: UIStepper) {
        
        stepperValue=Int(sender.value)
        splitLabel.text=String(stepperValue)
        
        inputLabel.endEditing(true)
        
    }
    
    @IBAction func CalculateButtonPressed(_ sender: UIButton) {

        let amount=inputLabel.text!
        billAmount=Double(amount) ?? 0.0
        
        total=String(format: "%.2f",((billAmount*tipPercentage)+billAmount)/Double(stepperValue))
        
        print(total ?? "No Amount")
        
        performSegue(withIdentifier: "toResultPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="toResultPage"){
            let result=segue.destination as! ResultPage
            
            result.total=total
            result.person=stepperValue
            result.tipPercentage=percentageTitle
        }
    }
    
    
}

