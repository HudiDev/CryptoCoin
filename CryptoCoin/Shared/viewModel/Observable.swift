//
//  Observable.swift
//  CryptoCoin
//
//  Created by Ilfeld, Yehuda on 12/02/2023.
//

import Foundation


///Observable is a class which handles data binding for ViewModel <-> View communication
class Observable<T> {
    
    ///value is private due to issues with bidirectional infinite loops
    private var _value: T
    
    ///error indicating invalid data etc..
    var error: Error? {
        didSet {
            if let error = error {
                errorOcurred?(error)
            }
        }
    }
    
    var value: T {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    ///observable listeners for value live updates
    var valueChanged: ((T) -> ())?
    
    ///observable listeners for error live updates
    var errorOcurred: ((Error) -> ())?
    
    
    ///constructs a new observable object
    init(_ value: T) {
        self._value = value
        valueChanged?(_value)
    }
    
    
    ///opposite direction of bidirectional value changes
    ///i.e. view -> model
    func bindingChanged(to newValue: T) {
        _value = newValue
        print("Value is now \(newValue)")
    }
    
}
