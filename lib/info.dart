class Users {
  String name;
  int age;

  Users ( this.name , this.age );

  String getInfo(){
    return "Name: $name , Age: $age ";
  }
}

List<Users> listUsers = [
  Users ('Chi', 20),
  Users ('Tân', 23),
  Users ('Hiếu', 23),
  Users ('Tú', 23),
  Users ('Tuấn', 28),
];


int itemCount(List s){
  int count = 0;
  for( int i = 0 ; i < s.length ; i++){
    count ++;
  }
  return count;
}




