
import SwiftUI

struct MasterView : View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
            
            if viewRouter.currentPage == "Home" {
                ContentView(viewRouter: viewRouter).environment(\.locale, .init(identifier: LocalPersistance.getLanguage()!))
            }
            else if viewRouter.currentPage == "Settings" {
                LanguageSettingsView(viewRouter: viewRouter).environment(\.locale, .init(identifier: LocalPersistance.getLanguage()!))
            }
       
            else {
              
                LanguageSettingsView(viewRouter: viewRouter).environment(\.locale, .init(identifier: LocalPersistance.getLanguage()!))
                
            }
            
        }
    }
}

#if DEBUG
struct MasterView_Previews : PreviewProvider {
    static var previews: some View {
        MasterView(viewRouter: ViewRouter())
    }
}
#endif
