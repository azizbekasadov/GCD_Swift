import UIKit

let serial = DispatchQueue(label: "serial")
let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
let initiallyInactive = DispatchQueue(label: "initiallyInactive", attributes: [.initiallyInactive, .concurrent])
type(of: serial)
type(of: concurrentQueue)

serial.async {
    (1...4).forEach { print($0) }
}

concurrentQueue.async {
    (5...10).forEach { print($0) }
}

initiallyInactive.async {
    (11...15).forEach { print($0) }
}

initiallyInactive.activate()

let queueTwo = DispatchQueue(label: "com.queueTwo")
let timeDelay = DispatchTime.now() + 3.0
queueTwo.asyncAfter(deadline: timeDelay, execute: { print("Shown after the delay of 3 secs") })
let queueOne = DispatchQueue(label: "queueOne")
let queueSecond = DispatchQueue(label: "queueTwo")
let queueThird = DispatchQueue(label: "queueThree")

queueOne.sync {
    print(queueOne.label)
}

queueSecond.sync {
    print(queueSecond.label)
}

queueThird.sync {
    print(queueThird.label)
}
