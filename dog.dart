class Dog {
final String message;
final String status; 

Dog({required this.message , required this.status});
factory Dog.fromJson(json){
  return Dog(

    message: json["message"],
    status: json["status"]
  );
}
}