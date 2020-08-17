//
//  fonts.swift
//  timeToRead
//
//  Created by Cecilia Soares on 14/08/20.
//  Copyright © 2020 Cecilia Soares. All rights reserved.
//

import Foundation
import UIKit

func sfPro(size: CGFloat, weight: UIFont.Weight) -> UIFont{
    
    let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
    let descriptor = systemFont.fontDescriptor.withDesign(.default)
    
    let roundedFont = UIFont(descriptor: descriptor!, size: size)
    
    return roundedFont
}
