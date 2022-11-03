//
//  ViewController.swift
//  Assignment4
//
//  Created by Home on 10/29/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ResCalc: UILabel!
    var nb1: String?
    var nb2: String?
    var str: String = ""
    var Ope: String?
    var add: Bool = false
    var sub: Bool = false
    var div: Bool = false
    var mul: Bool = false

    
    //var nb2 : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ResCalc.text = "0"

    }

    
    
    
    @IBAction func btnPourcent(_ sender: Any) {
        let nb = ResCalc.text
        var pourcent = Double(nb!)
        pourcent = (pourcent!/100)
        ResCalc.text = String(pourcent!)
        if(Ope == nil)||(Ope == "wait"){
            nb1 = String(pourcent!)
 //           nb1.Inputted = true
        }
        else{
            nb2 = String(pourcent!)
 //           nb2.Inputted = true
        }
    }
    
    @IBAction func btnPlusMinus(_ sender: Any) {
        str = ResCalc.text!
        let lgStr: Int = str.count
       // str.index
        
        let char =  str.prefix(1)  //str[str.index(str.startIndex, offsetBy: 0)]
        if(char == "-"){
            if(Ope == nil) || (Ope == "wait"){
                //let index = str.index(str.endIndex,offsetBy: lgStr-1)
                let myStr = str.suffix(lgStr-1)
                ResCalc.text = String(myStr)
                nb1 = String(myStr)
            }else{
                let myStr = str.suffix(lgStr-1)
                ResCalc.text = String(myStr)
                nb2 = String(myStr)
            }
        }
        else
        {
            let myStr = "-" + str
            ResCalc.text = String(myStr)
            if(Ope == nil) || (Ope == "wait"){
                //let index = str.index(str.endIndex,offsetBy: lgStr-1)
                nb1 = String(myStr)
            }else{
                nb2 = String(myStr)
            }

        }
    }
    
    // AC button allows to reset 2 numbers in the operation
    @IBAction func btnAC(_ sender: Any) {
        if(((Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/")) && (nb1 != nil)){
            nb2 = nil
 //           nb2.Inputted = false
            ResCalc.text = "0"
        }else{
            ResCalc.text = "0"
            nb1 = nil
 //           nb1.Inputted = false
            nb2 = nil
            Ope = nil
 //           nb2.Inputted = false
        }
    }
    
    // I can enter the operation only when I have the first number
    @IBAction func btnDivision(_ sender: Any) {
        if(nb1 != nil){
            Ope = "/"
            ResCalc.text = "0"
        }
    }
    @IBAction func btnMultiplication(_ sender: Any) {
        if(nb1 != nil){
            Ope = "*"
            ResCalc.text = "0"
        }
    }
    @IBAction func btnSubstraction(_ sender: Any) {
        if(nb1 != nil){
            Ope = "-"
            ResCalc.text = "0"
        }
    }
    @IBAction func btnAddition(_ sender: Any) {
        if(nb1 != nil){
            Ope = "+"
            ResCalc.text = "0"
        }
    }
    
    @IBAction func btnEqual(_ sender: Any) {
        if (Ope != nil)&&(nb1 != nil)&&(nb2 != nil){
            var val: String = nb1!
            let n1 = Double(val)
            val = nb2!
            let n2 = Double(val)
            var sum:Double
            if(Ope == "+"){
                sum = Double(n1!) + Double(n2!)
                ResCalc.text = String(sum)
                nb1 = String(sum)
            }else if(Ope == "-"){
                sum = Double(n1!) - Double(n2!)
                ResCalc.text = String(sum)
                nb1 = String(sum)
            }
            else if(Ope == "*"){
                sum = Double(n1!) * Double(n2!)
                ResCalc.text = String(sum)
                nb1 = String(sum)
            }else if(Ope == "/"){
                if(n2 != 0){
                sum =  Double(n1!) / Double(n2!)
                ResCalc.text = String(sum)
                nb1 = String(sum)
                }else{
                    ResCalc.text = "Error"
                    //nb1.strval = String(sum)
                }
            }
            Ope = "wait"
            nb2 = nil
   //         nb2.Inputted = false
        }
    }
    
    /* adding a dot is possible only when the current number is not a decimal without "." and after waiting period that the operation inputted, we can use "." only when operation is inputted */
    @IBAction func btnDot(_ sender: Any) {
        if(Ope != "wait"){
            var dotExists: Bool = false
            str = ResCalc.text!
            // check if exists "."
            for char in str{
                if(char == "."){
                    dotExists = true
                    break}
            }
            if(dotExists == false){
                str = str + "."
                ResCalc.text = str
                if (Ope == nil){
                    nb1 = str
                }else{
                    nb2 = str
                }
            }
        }
    }
    
    
    // button 9
    @IBAction func btn9Act(_ sender: Any) {
        str = ResCalc.text!
        if(str == "0"){str = "9"} else{str = str + "9"}
        if(Ope == nil){
            nb1 = str
            ResCalc.text = str
        }else if (Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/"){
            ResCalc.text = str
            nb2 = str
            
        }
        
    }
    @IBAction func btn8Act(_ sender: Any) {
        str = ResCalc.text!
        if(str == "0"){str = "8"} else{str = str + "8"}
        if(Ope == nil){
            nb1 = str
            ResCalc.text = str
        }else if (Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/"){
            ResCalc.text = str
            nb2 = str
        }
    }
    @IBAction func btn7Act(_ sender: Any) {
        str = ResCalc.text!
        if(str == "0"){str = "7"} else{str = str + "7"}
        if(Ope == nil){
            nb1 = str
            ResCalc.text = str
        }else if (Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/"){
            ResCalc.text = str
            nb2 = str
        }
    }
    @IBAction func btn6Act(_ sender: Any) {
        str = ResCalc.text!
        if(str == "0"){str = "6"} else{str = str + "6"}
        if(Ope == nil){
            nb1 = str
            ResCalc.text = str
        }else if (Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/"){
            ResCalc.text = str
            nb2 = str
        }
    }
    @IBAction func btn5Act(_ sender: Any) {
        str = ResCalc.text!
        if(str == "0"){str = "5"} else{str = str + "5"}
        if(Ope == nil){
            nb1 = str
            ResCalc.text = str
        }else if (Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/"){
            ResCalc.text = str
            nb2 = str
        }
   }
    @IBAction func btn4Act(_ sender: Any) {
        str = ResCalc.text!
        if(str == "0"){str = "4"} else{str = str + "4"}
        if(Ope == nil){
            nb1 = str
            ResCalc.text = str
        }else if (Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/"){
            ResCalc.text = str
            nb2 = str
        }
    }
    @IBAction func btn3Act(_ sender: Any) {
        str = ResCalc.text!
        if(str == "0"){str = "3"} else{str = str + "3"}
        if(Ope == nil){
            nb1 = str
            ResCalc.text = str
        }else if (Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/"){
            ResCalc.text = str
            nb2 = str
        }
    }
    @IBAction func btn2Act(_ sender: Any) {
        str = ResCalc.text!
        if(str == "0"){str = "2"} else{str = str + "2"}
        if(Ope == nil){
            nb1 = str
            ResCalc.text = str
        }else if (Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/"){
            ResCalc.text = str
            nb2 = str
        }
    }
    @IBAction func btn1Act(_ sender: Any) {
        str = ResCalc.text!
        if(str == "0"){str = "1"} else{str = str + "1"}
        if(Ope == nil){
            nb1 = str
            ResCalc.text = str
        }else if (Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/"){
            ResCalc.text = str
            nb2 = str
        }
    }
    @IBAction func btn0Act(_ sender: Any) {
        str = ResCalc.text!
        if(str != "0"){str = str + "0"}
        //nb1.strval = str
        if(Ope == nil){
            nb1 = str
            ResCalc.text = str
        }else if (Ope == "+") || (Ope == "-") || (Ope == "*") || (Ope == "/"){
            ResCalc.text = str
            nb2 = str
        }
    }
    
    
    
}

