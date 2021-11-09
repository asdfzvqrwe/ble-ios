//
//  CBUUID.swift
//  bluetoothtest2
//
//  Created by 세진시스템 on 2021/08/31.
//

import Foundation
import CoreBluetooth

struct CBUUIDs {
    
    //static let kBLEService_UUID = "6e400001-b5a3-f393-e0a9-e50e24dcca9e"
    //static let kBLE_Characteristic_uuid_Tx = "6e400002-b5a3-f393-e0a9-e50e24dcca9e"
    //static let kBLE_Characteristic_uuid_Rx = "6e400003-b5a3-f393-e0a9-e50e24dcca9e"
    static let kBLEService_UUID = "00001100-06e1-006a-03e8-001f4708ef3b"
    static let kBLE_Characteristic_uuid_Tx = "00001101-06e1-006a-03e8-001f4708ef3b"
    static let kBLE_Characteristic_uuid_Rx = "00001102-06e1-006a-03e8-001f4708ef3b"
    static let MaxCharacters = 20

    static let BLEService_UUID = CBUUID(string: kBLEService_UUID)
    static let BLE_Characteristic_uuid_Tx = CBUUID(string: kBLE_Characteristic_uuid_Tx)//(Property = Write without response)
    static let BLE_Characteristic_uuid_Rx = CBUUID(string: kBLE_Characteristic_uuid_Rx)// (Property = Read/Notify)
}


