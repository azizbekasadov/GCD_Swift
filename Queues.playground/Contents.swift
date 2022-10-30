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
