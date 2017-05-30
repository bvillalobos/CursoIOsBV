import UIKit
import RealmSwift

class RealmManager: NSObject {
    
    class func getAllCats() -> Results<Cat>? {
        let realm = try! Realm()
        let cats = realm.objects(Cat.self)
        
        if cats.count > 0 {
        
             return cats
        }
        else {
        return nil
        }
        
        
    }
    
    class func createCats(name: String) {
        
        let cats = Cat()
        cats.name = name
        
        if let cats = getAllCats(){
            
        }
        
        addObjectToRealm(realmObject: cats)
        
    }
    
    private class func addObjectToRealm(realmObject: Object) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
    
      class func validaExistCat (name: String) -> Bool{
        let real = try! Realm()
        let pred = NSPredicate(format: "name = %@", name)
        let cat = real.objects(Cat.self).filter(pred).first
    
        guard let _ = cat
            else
        {
            return true
    
       }
        return false
    
   
 }
    
}
