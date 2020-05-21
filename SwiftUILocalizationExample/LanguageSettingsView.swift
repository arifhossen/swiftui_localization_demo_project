
import SwiftUI


class LocalPersistance {
    
    private static let defaults = UserDefaults.standard
    static let LOCALSTORAGE_KEY = "LANGUAGE"
    static let lang_eng = "en"
    static let lang_japanese = "ja"
    
    static func getLanguage() -> String? {
        var lang = defaults.string(forKey: LOCALSTORAGE_KEY)
        
        if lang == nil{
            //Set Default Language Japanise
            lang = lang_japanese
        }
        
        return lang
    }
    
    static func setLanguage(id: String) {
        defaults.set(id, forKey: LOCALSTORAGE_KEY)
    }
    
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        return Binding(
            get: { self.wrappedValue },
            set: { selection in
                self.wrappedValue = selection
                handler(selection)
        })
    }
}


struct LanguageSettingsView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    @State private var selectedLang:Int = 1
    var languages = ["English", "Japanese"]
    
    
    func languageChange(_ index: Int) {
        print("Language index: \(index)")
        
        if index == 0{
            LocalPersistance.setLanguage(id: LocalPersistance.lang_eng)
        }
        else if index == 1{
            LocalPersistance.setLanguage(id: LocalPersistance.lang_japanese)
        }
        
        self.viewRouter.currentPage = "Home"
        
    }
    
    
    var body: some View {
        
        
        
        NavigationView{
            
            VStack(alignment: .trailing){
                
                Image("icon_home")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .trailing)
                    .onTapGesture {
                        
                        self.viewRouter.currentPage = "Home"
                }
                
                Form{
                    
                    VStack{
                        
                        
                        Section {
                            Picker(selection: $selectedLang.onChange(languageChange), label: Text("Select Language")) {
                                ForEach(0 ..< languages.count) { index in
                                    Text(self.languages[index]).tag(index)
                                }
                            }.frame(height:30)
                        }
                        
                    } .navigationBarTitle("Settings")
                    
                }
                
            }
        }
        
        
        
        
    }
}

struct LanguageSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageSettingsView(viewRouter: ViewRouter())
    }
}
