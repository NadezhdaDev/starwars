import '../../domain/model/person.dart';
import '../model/db_person_model.dart';

class PersonMapper {
  DBPersonModel getDBModel(Person person) {
    final DBPersonModel dbModel = DBPersonModel(
        name: person.name,
        gender: person.gender,
        starshipsLink: person.starshipsLink);

    return dbModel;
  }

  Person getProject(DBPersonModel dbModel) {
    return Person(
        name: dbModel.name,
        gender: dbModel.gender,
        starshipsLink: dbModel.starshipsLink);
  }
}
