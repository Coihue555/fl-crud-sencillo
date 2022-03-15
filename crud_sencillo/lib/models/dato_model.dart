

class DatoModel {
    
    int? id;
    String? nombre;
    String? email;

    DatoModel({
        this.id,
        this.nombre,
        this.email,
    }); 


    factory DatoModel.fromJson(Map<String, dynamic> json) => DatoModel(
        id: json["id"],
        nombre: json["nombre"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "email": email,
    };
}
