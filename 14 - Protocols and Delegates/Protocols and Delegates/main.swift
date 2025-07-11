

protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}


struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvancedLifeSupport  {
    
    init(handler: EmergencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 100 per second.")
    }
    
    func useStethescope() {
        print("The doctor listens intently.")
    }
}


class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr...")
    }
}


let emilio = EmergencyCallHandler()
let angela = Doctor(handler: emilio)


emilio.assessSituation()
emilio.medicalEmergency()


