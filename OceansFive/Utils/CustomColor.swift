//
//  CustomColor.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 28/06/23.
//
import UIKit
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int, opacity: CGFloat = 1.0) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: opacity)
   }

   convenience init(hex: Int, opacity: CGFloat = 1.0) {
       self.init(
           red: (hex >> 16) & 0xFF,
           green: (hex >> 8) & 0xFF,
           blue: hex & 0xFF,
           opacity: opacity
       )
   }
}

class PaleteColor {
    static var primary: UIColor = UIColor(hex: 0x6F150C)
}
