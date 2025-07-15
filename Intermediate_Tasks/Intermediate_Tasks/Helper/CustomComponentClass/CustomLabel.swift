//
//  CustomLabel.swift
//  Intermediate_Tasks
//
//  Created by Apple on 7/15/25.
//

import UIKit

class CustomLabelBlue: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    func setFont(){
        self.textColor = Theme.appBlue
        self.font = Theme.getAppBoldFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 30 : 30)

    }
}
class CustomLabelBlack: UILabel{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setFont()
    }
    
    func setFont(){
        self.textColor = Theme.appBlack
        self.font = Theme.getAppBoldFont(withSize: UIDevice.current.userInterfaceIdiom == .pad ? 16 : 16)

    }
}
