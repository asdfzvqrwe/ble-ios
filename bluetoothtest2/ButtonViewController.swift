//
//  ButtonViewController.swift
//  bluetoothtest2
//
//  Created by 세진시스템 on 2021/08/31.
//

import UIKit
import CoreBluetooth



class ButtonViewController: UIViewController{
    
    var myPeripheral: CBPeripheral!
    var txCharacteristic: CBCharacteristic!
    
    
   func writeOutgoingValue(data: String) {
        let valueString = (data as NSString).data(using:String.Encoding.utf8.rawValue)
       if let myPeripheral = SideMenuTableViewController.myPeripheral {
           if let txCharacteristic = SideMenuTableViewController.txCharacteristic {
                myPeripheral.writeValue(valueString!, for: txCharacteristic, type: CBCharacteristicWriteType.withResponse)
               
                   print(data as NSString)
               
            }
        }
    }

    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func Test1(sender: UIButton) {
       
        
     //   let alertController = UIAlertController(title: "GAIN", message: "GAIN", preferredStyle: UIAlertController.Style.alert)
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
            writeOutgoingValue(data: "<KSGA>")

    }
    
    @IBAction func Test2(sender: UIButton) {
        
       // let alertController = UIAlertController(title: "HPF", message: "HPF", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSHP>")
    }
    
    @IBAction func Test3(sender: UIButton) {
       // let alertController = UIAlertController(title: "LPF", message: "LPF", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSLP>")
    }
    
    @IBAction func Test4(sender: UIButton) {
      //  let alertController = UIAlertController(title: "FMODE", message: "FMODE", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSFM>")
    }
    
    @IBAction func Test5(sender: UIButton) {
       // let alertController = UIAlertController(title: "RMODE", message: "RMODE", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSRM>")
    }
    
    @IBAction func Test6(sender: UIButton) {
        //let alertController = UIAlertController(title: "SUBGAIN", message: "SUBGAIN", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSSG>")
    }
    
    @IBAction func Test7(sender: UIButton) {
      //  let alertController = UIAlertController(title: "SUBLPF", message: "SUBLPF", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSSL>")
    }
    
    @IBAction func Test8(sender: UIButton) {
       // let alertController = UIAlertController(title: "SUBSONIC", message: "SUBSONIC", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSSO>")
    }
    
    @IBAction func Test9(sender: UIButton) {
     //   let alertController = UIAlertController(title: "BASSBOOST", message: "BASSBOOST", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSBO>")
    }
    
    @IBAction func Test10(sender: UIButton) {
      //  let alertController = UIAlertController(title: "SUBPHASE", message: "SUBPHASE", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSPH>")
    }
    
    @IBAction func Test11(sender: UIButton) {
     //   let alertController = UIAlertController(title: "ENTER", message: "ENTER", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSEN>")
    }
    
    @IBAction func Test12(sender: UIButton) {
        //let alertController = UIAlertController(title: "ENC DN", message: "ENC_DN", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSED>")
    }
    
    @IBAction func Test13(sender: UIButton) {
        //let alertController = UIAlertController(title: "ENC UP", message: "ENC_UP", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSEU>")
    }
    
    @IBAction func Test14(sender: UIButton) {
        //let alertController = UIAlertController(title: "TUNE DN", message: "TUNE_DN", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KLTD>")
    }
    
    @IBAction func Test15(sender: UIButton) {
        //let alertController = UIAlertController(title: "BAND", message: "BAND", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSBD>")
    }
    
    @IBAction func Test16(sender: UIButton) {
       // let alertController = UIAlertController(title: "TUNE UP", message: "TUNE_UP", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KLTU>")
    }
    
    @IBAction func Test17(sender: UIButton) {
       // let alertController = UIAlertController(title: "MEDIA", message: "MEDIA", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSME>")
    }
    
    @IBAction func Test18(sender: UIButton) {
      //  let alertController = UIAlertController(title: "AS", message: "AS", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSAS>")
    }
    
    @IBAction func Test19(sender: UIButton) {
       // let alertController = UIAlertController(title: "PS", message: "PS", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KLPS>")
    }
    
    @IBAction func Test20(sender: UIButton) {
       // let alertController = UIAlertController(title: "P1", message: "P1", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSP1>")
    }
    
    @IBAction func Test21(sender: UIButton) {
      //  let alertController = UIAlertController(title: "P2", message: "P2", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSP2>")
    }
    
    @IBAction func Test22(sender: UIButton) {
      //  let alertController = UIAlertController(title: "P3", message: "P3", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSP3>")
    }
    
    @IBAction func Test23(sender: UIButton) {
       // let alertController = UIAlertController(title: "P4", message: "P4", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSP4>")
    }
    
    @IBAction func Test24(sender: UIButton) {
       // let alertController = UIAlertController(title: "P5", message: "P5", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSP5>")
    }
    
    @IBAction func Test25(sender: UIButton) {
      //  let alertController = UIAlertController(title: "P6", message: "P6", preferredStyle: UIAlertController.Style.alert)
        
        //alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        //present(alertController, animated: true, completion: nil)
        writeOutgoingValue(data: "<KSP6>")
        
    }

    

    @IBOutlet weak var labelString1: UILabel!
    static var labelString2 : UILabel = UILabel()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ButtonViewController.labelString2 = labelString1
       
    }
    

}
