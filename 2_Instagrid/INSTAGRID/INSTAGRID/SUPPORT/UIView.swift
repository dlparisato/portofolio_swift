//
//  UIView.swift
//  INSTAGRID
//
//  Created by DL PARISATO on 02/04/2020.
//  Copyright © 2020 PARISATO. All rights reserved.
//

import UIKit

extension UIView {
    
    // UIGraphicsImageRenderer: transform UIView to a UIImage
    var transformImage: UIImage {
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        let img = renderer.image { ctx in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)  // => drawHierarchy as visible onscreen into the main grid.
        }
        return img
    }
    
}
