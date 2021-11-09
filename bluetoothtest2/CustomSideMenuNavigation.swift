import UIKit
import SideMenu

class CustomSideMenuNavigation: SideMenuNavigationController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentationStyle = .menuSlideIn
        self.menuWidth = self.view.frame.width * 0.7
        self.leftSide = true
        self.statusBarEndAlpha = 0.0

       
    }
    
    

}
