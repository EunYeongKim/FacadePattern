import Foundation
import UIKit

struct Hotel {
    //호텔에 대한 정보
}

struct HotelBooking {
    static func getHotelNameForDates(to: Date, from: Date) -> [Hotel]? {
        let hotels = [Hotel]()
        
        return hotels
    }
    
    static func bookHotel(hotel: Hotel) {
        //호텔 객실을 예약하기 위한 로직
    }
}

struct Flight {
    //비행기에 대한 정보
}

struct FlightBooking {
    static func getFlightNameForDates(to: Date, From: Date) -> [Flight]? {
        let flights = [Flight]()
        
        return flights
    }
    
    static func bookingFlight(flight: Flight) {
        //비행기를 예약하기 위한 로직
    }
}


class TravelFacade {
    private var hotels: [Hotel]?
    private var flights: [Flight]?
    
    init(to: Date, from: Date) {
        hotels = HotelBooking.getHotelNameForDates(to: to, from: from)
        flights = FlightBooking.getFlightNameForDates(to: to, From: from)
    }
    
    func bookTrip(hotel: Hotel, flight: Flight) {
        HotelBooking.bookHotel(hotel: hotel)
        FlightBooking.bookingFlight(flight: flight)
    }
}

//===============================================================================

protocol Switch {
    func on()
    func off()
}

class Cooler: Switch {
    func on() {
        print("쿨러 작동 시작")
    }
    
    func off() {
        print("쿨러 작동 끝")
    }
}

class Micro: Switch {
    func on() {
        print("마이크로파 작동 시작")
    }
    
    func off() {
        print("마이크로파 작동 끝")
    }
}

class TurnTable: Switch {
    func on() {
        print("턴테이블 작동 시작")
    }
    
    func off() {
        print("턴테이블 작동 끝")
    }
}

class MicroWaveFacade {
    let cooler: Cooler
    let micro: Micro
    let turnTable: TurnTable
    let switches: [Switch]
    
    init(cooler: Cooler, micro: Micro, turnTable: TurnTable) {
        self.cooler = cooler
        self.micro = micro
        self.turnTable = turnTable
        self.switches = [cooler, micro, turnTable]
    }
    
    func on() {
        for s in switches {
            s.on()
        }
    }
}

let 전자렌지 = MicroWaveFacade(cooler: Cooler(), micro: Micro(), turnTable: TurnTable())
전자렌지.on()

//===============================================================================

func toggleSettings() {
    let settingKey = "my-setting"
    
    let originalValue = UserDefaults.standard.bool(forKey: settingKey)
    let newValue = !originalValue
    
    UserDefaults.standard.setValue(newValue, forKey: settingKey)
    UserDefaults.standard.synchronize()
    
//    self.switchButton.setOn(newValue, animated: true)
}
