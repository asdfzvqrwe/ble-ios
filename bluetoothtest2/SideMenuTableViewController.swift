import UIKit
import CoreBluetooth
import XCTest

struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}

class SideMenuTableViewController: UITableViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    var peripherals = Array<CBPeripheral>()
    var peripherals2 = [Peripheral]()
    
    var centralManager: CBCentralManager!
    static var myPeripheral: CBPeripheral!
    var rxCharacteristic: CBCharacteristic!
    static var txCharacteristic: CBCharacteristic!
    
    static var characteristicASCIIValue = NSString()
    static var labelString = String()

    
    
    
    @objc func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == CBManagerState.poweredOn {
            print("BLE powered on")
            // Turned on
            central.scanForPeripherals(withServices: nil, options: nil)
        }
        else {
            print("Something wrong with BLE")
            // Not on, but can have different issues
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
       
        
        var peripheralName: String!
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            peripheralName = name
            
            if peripheralName == "SEJIN" {
                print("Peripheral Discovered: \(peripheral)")
                print("Peripheral Name: \(peripheral.name)")
                print("Advertisement Data: \(advertisementData)")
                
                let newPeripheral = Peripheral(id: peripherals2.count, name: peripheralName, rssi: RSSI.intValue)
                peripherals2.append(newPeripheral)
                peripherals.append(peripheral)
                tableView.reloadData()
                
                
            }
        }
        
        /*if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
        //if let name = peripheral.name {
            peripheralName = name
        } else {
            peripheralName = "Unknown"
        }
        
        let newPeripheral = Peripheral(id: peripherals2.count, name: peripheralName, rssi: RSSI.intValue)
        peripherals2.append(newPeripheral)
        tableView.reloadData()
        
        
        
        if let pname = peripheral.name {
            print("Peripheral Discovered: \(peripheral)")
            print("Peripheral Name: \(peripheral.name)")
            print("Advertisement Data: \(advertisementData)")
            
        
            if pname == "SEJIN" {
                centralManager.stopScan()
                
                myPeripheral = peripheral
                myPeripheral.delegate = self
                centralManager.connect(myPeripheral, options: nil)
            }
        }*/
        

        
    }
    
    
    
    
    
    
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Peripheral Connected: \(peripheral)")
        SideMenuTableViewController.myPeripheral.discoverServices([CBUUIDs.BLEService_UUID])
        //myPeripheral.discoverServices(nil)
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if (error != nil) {
            print("Error discovering services: \(error!.localizedDescription)")
            return
        }
        guard let services = peripheral.services else {
            return
        }
        //We need to discover the all characteristic
        for service in services {
            SideMenuTableViewController.myPeripheral.discoverCharacteristics(nil, for: service)
        }
        print("Discovered Services: \(services)")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else {
            return
        }
        
        print("Found \(characteristics.count) characteristics.")
        for characteristic in characteristics {
            if characteristic.uuid.isEqual(CBUUIDs.BLE_Characteristic_uuid_Rx) {
                rxCharacteristic = characteristic
                
                SideMenuTableViewController.myPeripheral.setNotifyValue(true, for: rxCharacteristic)
                SideMenuTableViewController.myPeripheral.readValue(for: rxCharacteristic)
                
                print("RX Characteristic: \(rxCharacteristic)")
            }
            
            if characteristic.uuid.isEqual(CBUUIDs.BLE_Characteristic_uuid_Tx) {
                SideMenuTableViewController.txCharacteristic = characteristic
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "ButtonViewController")
                        self.navigationController?.pushViewController(pushVC!, animated: true)
                print("TX Characteristic: \(SideMenuTableViewController.txCharacteristic.uuid)")
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        var characteristicASCIIValue = NSString()
        
        guard characteristic == rxCharacteristic,
              let characteristicValue = characteristic.value,
              let ASCIIstring = NSString(data: characteristicValue, encoding: String.Encoding.utf8.rawValue) else { return }
        
        characteristicASCIIValue = ASCIIstring
        
        //print("Value Received: \((characteristicASCIIValue as String))")
        print("\((characteristicASCIIValue as String))")
        
        
        let str = characteristicASCIIValue as String
        
        let cas = Array(str)
        
        if cas.isEmpty == false {
         
            if (( cas[1] == "M") && ( cas[2] == "E")) {
                if (( cas[3] == "R") && ( cas[4] == "A")){
                    ButtonViewController.labelString2.text = "RADIO"
                }
            }
            else if ((cas[1] == "F") && (cas[2] == "M")){
                if (cas[3] == "0") {
                    let startIdx: String.Index = str.index(str.startIndex, offsetBy: 4)
                    let endIdx: String.Index = str.index(str.startIndex, offsetBy: 8)
                    let result = String(str[startIdx..<endIdx])
                    ButtonViewController.labelString2.text = "FM  "+result+" (10kHz)"
                } else {
                    let startIdx: String.Index = str.index(str.startIndex, offsetBy: 3)
                    let endIdx: String.Index = str.index(str.startIndex, offsetBy: 8)
                    let result = String(str[startIdx..<endIdx])
                    ButtonViewController.labelString2.text = "FM " + result +
                    " (10kHz)"
                }
            }  else if ((cas[1] == "A") && (cas[2] == "M")){
                if (cas[4] == "0") {
                    let startIdx: String.Index = str.index(str.startIndex, offsetBy: 5)
                    let endIdx: String.Index = str.index(str.startIndex, offsetBy: 8)
                    let result = String(str[startIdx..<endIdx])
                    ButtonViewController.labelString2.text = "AM  "+result+" kHz"
                } else {
                    let startIdx: String.Index = str.index(str.startIndex, offsetBy: 4)
                    let endIdx: String.Index = str.index(str.startIndex, offsetBy: 8)
                    let result = String(str[startIdx..<endIdx])
                    ButtonViewController.labelString2.text = "AM " + result +
                    " kHz"
                }
            }
        }
    }
    
    
    

    
    func disconnectFromDevice() {
        if SideMenuTableViewController.myPeripheral != nil {
            centralManager?.cancelPeripheralConnection(SideMenuTableViewController.myPeripheral)
        }
    }
    
    @IBAction func onTapButton(_ sender: UIButton, forEvent event: UIEvent) {
        centralManager.stopScan()
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       /* tableView.dataSource = dataSource
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(tableViewNames, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)*/
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
    
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return test.count
        return peripherals2.count
    }
    
    var tableViewNames = ["name1", "name2"]
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> SideMenuTableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SideMenuTableViewCell
        
        //cell.column1TextLabel?.text = tableViewNames[indexPath.row]
        //cell.column1TextLabel?.text = peripherals[indexPath.row].name
        cell.column1TextLabel?.text = peripherals2[indexPath.row].name + ", RSSI = \(peripherals2[indexPath.row].rssi)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        centralManager.stopScan()
        
        SideMenuTableViewController.myPeripheral = peripherals[indexPath.row]
        SideMenuTableViewController.myPeripheral.delegate = self
        centralManager.connect(SideMenuTableViewController.myPeripheral, options: nil)
        
        /*let vcName = self.storyboard?.instantiateViewController(withIdentifier: "ButtonViewController")
        vcName?.modalPresentationStyle = .fullScreen
        vcName?.modalTransitionStyle = .crossDissolve
        self.present(vcName!, animated: true, completion:  nil)*/
        
    }

   /* var tableViewNames = ["name1", "name2"]
    
    enum Section {
        case all
    }
    
    lazy var dataSource = configureDataSource()
    
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        let cellIdentifier = "datacell"
        
        
        let dataSource = UITableViewDiffableDataSource<Section, String>(tableView: tableView, cellProvider: { tableView, indexPath, tableViewName in
            
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SideMenuTableViewCell
            
            
            cell.column1TextLabel.text = tableViewName
            
            //cell.textLabel?.text = tableViewName
            
            return cell
        }
        )
        
        return dataSource
    }*/
    
    /*func writeOutgoingValue(data: String) {
        let valueString = (data as NSString).data(using:String.Encoding.utf8.rawValue)
      
        
        if let myPeripheral = myPeripheral {
            if let txCharacteristic = txCharacteristic {
                myPeripheral.writeValue(valueString!, for: txCharacteristic, type: CBCharacteristicWriteType.withResponse)
            }
        }
        print("writeOutgoingValue")
    }*/
    
    
}

