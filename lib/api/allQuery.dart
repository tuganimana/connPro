import 'dart:ffi';

class Allprofessional{

 String experience;
 String firstname;
 String lastname;
 String telephone;
 String profile;
 String profession;

Allprofessional({this.experience,this.firstname,this.lastname,this.profile,this.profession,this.telephone});
factory Allprofessional.fromJson(Map<String, dynamic>  json){
  return Allprofessional(
    experience: json['experience'].toString(),
    firstname:  json['firstname'].toString(),
    lastname: json['lastname'],
    telephone: json['profile'],
    profession: json['profession'],
    profile:json['profile'],

  );
}
}