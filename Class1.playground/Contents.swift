//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//Como declarar una variable sin inicializar
var nameWithoutInizialitation: String?

//Como declara una variable con inicializacion
var nameWithInizialitation = "Name"

//Como declara una constante
let nameConstant = "Name"


nameWithoutInizialitation = "Variable opcional"

//la manera correcta de hacer un unwrap de un opcional es usando un if let

if let nameWithoutInizialitation = nameWithoutInizialitation{
print("la varible tiene \(nameWithoutInizialitation.characters.count)caracteres")
}

//la forma no segura y no recomendada de hacer un unwrap (solo si se sabe que el valor no es nil) de usar un unwrap de un opcional es la siguiente:
print("la varible tiene \(nameWithoutInizialitation!.characters.count)caracteres")


// el guard se utiliza para validar campos
//cuando no quiere utilizar el nombre de retorno utiliza un _
func explicacionDeUnGuard(value: String?)->Bool{
    guard let _ = value else{
        return false
    }
    return true
}

public enum CampoFaltante: Int{
    case primero = 1, segundo
}

func validarCampos(campo1: String?, campo2:String?) -> CampoFaltante?{
    guard let _ = campo1 else {
        return CampoFaltante.primero
    }
    guard let _ = campo2 else {
        return CampoFaltante.segundo
    }
    return nil
}

validarCampos(campo1: nil, campo2: "LLENO")
validarCampos(campo1: "LLENO", campo2: nil)
validarCampos(campo1: nil, campo2: nil)
validarCampos(campo1: "LLENO", campo2: "LLENO")







