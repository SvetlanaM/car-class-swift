//: Playground - noun: a place where people can play

import UIKit

//
//  car.swift
//
//  Created by Svetlana Margetová on 19.04.16.
//  Copyright © 2016 Svetlana Margetová. All rights reserved.
//

import Foundation


/**************************************
 Enum for storing types of car
 **************************************/

enum CarType {
    case EconomyCar
    case FamilyCar
    case Microcar
    case SportsCar
    case Buggati
}

/**************************************
 Base Car class
 **************************************/

public class Car {
    internal var carType : CarType
    private let carVinCode : String // immutable car identifier
    internal var gasConsuption : Float // average consuption in l/100km
    public var hasConditioning : Bool
    private var isEngineOn : Bool = false // engine start or stop info, default is stop
    
    init(carType : CarType, carVinCode : String, gasConsuption : Float, hasConditioning : Bool) {
        self.carType = carType
        self.carVinCode = carVinCode
        self.gasConsuption = gasConsuption
        self.hasConditioning = hasConditioning
    }
    
    func engineStart() -> Bool {
        isEngineOn = true
        return isEngineOn
    }
    
    func engineStop() -> Bool {
        isEngineOn = false
        return isEngineOn
    }
    
    func getEngineState() -> Bool {
        return isEngineOn
    }
    
    func changeEngineState(state : Bool) -> Bool {
        
        if !isEngineOn {
            return engineStart()
        }
        else {
            return engineStop()
        }
        
    }
    
    func getConsuptionForKm(kilometers : Float) -> Float {
        if gasConsuption > 0 {
            return (kilometers * gasConsuption) / 100
        }
        else {
            return 0 as Float
        }
    }
}

public class CarCollection {
    var cars : [Car] = []
    
    func addCar(car: Car) -> [Car] {
        cars.append(car)
        return cars

    }
    
    func removeCar(code : String) {
        var count = 0
        for car in cars {
            if car.carVinCode == code {
                cars.removeAtIndex(count)
            }
            count = count + 1
        }
    }
    
    func showOff(cars : [Car]) {
        for car in cars {
            if car.carType == .Buggati {
                print ("Toto je moje oblubene auto")
            }
            else {
                print (car.carVinCode, car.carType)
            }
        }
        
    }
    
    func hasCarWithThisVin(vin: String) -> Bool {
        for car in cars {
            if car.carVinCode == vin {
                return true
            }
        }
        return false
    }
    
    func hasCarWithThisVinVerze2(vin: String) -> Bool {
        for i in 0..<cars.count {
            if cars[i].carVinCode == vin {
                return true
            }
        }
        return false
    }

    func addNewCar(car: Car) {
        if !hasCarWithThisVin(car.carVinCode) {
            cars.append(car)
        }
        else {
            print("Car with this VIN is already in the collection")
        }
    }
    

    func xy() -> (cislo: Int, retezec: String) {
        return (0, "pepa")
    }  
}

//Inicialization of the class
var superb = Car(carType: .Buggati, carVinCode: "SVN01234", gasConsuption: 20.00, hasConditioning: false)
var tesla = Car(carType: .FamilyCar, carVinCode: "SVN01234", gasConsuption: 20.00, hasConditioning: false)

superb.engineStart()
superb.engineStop()
superb.isEngineOn
superb.getEngineState()
superb.changeEngineState(superb.getEngineState())
superb
superb.changeEngineState(superb.getEngineState())
superb
superb.getConsuptionForKm(15678.563)
superb.getConsuptionForKm(0)

var myCar = CarCollection()
myCar.addCar(superb)
myCar.addCar(Car(carType: .EconomyCar, carVinCode: "SVN0123e", gasConsuption: 20.00, hasConditioning: false))
myCar.showOff(myCar.cars)
myCar.removeCar("SVN0123e")
myCar.showOff(myCar.cars)

