//: Playground - noun: a place where people can play

import UIKit

// Create the Circle class

class Circle {
    var x: Double = 0
    var y: Double = 0
    
    // Observed Property
    var radius: Double {
        
        didSet {
            if radius < 0 {
                radius = 0
            }
        }
    }
    
    // Computed Property
    var area: Double {
        get {
            return M_PI * radius * radius
        }
        
        set(newArea) {
            radius = sqrt(newArea / M_PI)
        }
    }
    
    // Initializer
    
    init() {
        radius = 1
    }
    
    init(x: Double, y: Double, radius: Double) {
        self.x = x
        self.y = y
        self.radius = radius
    }
    
    func doesOverlapCircle(c: Circle) -> Bool {
        let dx = self.x - c.x
        let dy = self.y - c.y
        let distance = sqrt(pow(dx, 2) + pow(dy, 2))
        
        return distance <= (self.radius + c.radius)
    }
}

// Use some circles...
let c1 = Circle(x: 10, y: 10, radius: 1)
var c2 = c1
var c3 = c1

c2.radius = 1000

c1.x = 200 












