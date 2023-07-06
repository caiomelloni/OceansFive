//
//  UIViewExtension.swift
//  OceansFive
//
//  Created by Caio Melloni dos Santos on 06/07/23.
//
import UIKit

class ClickListener: UITapGestureRecognizer {
     var onClick : (() -> Void)? = nil
}


extension UIView {
    
    func setOnClickListener(action :@escaping () -> Void){
        let tapRecogniser = ClickListener(target: self, action: #selector(onViewClicked(sender:)))
        tapRecogniser.onClick = action
        self.addGestureRecognizer(tapRecogniser)
    }
     
    @objc func onViewClicked(sender: ClickListener) {
        if let onClick = sender.onClick {
            onClick()
        }
    }
     
}

