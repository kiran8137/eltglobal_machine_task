
import 'package:elt_global_machine_task/data/model/author_model.dart';

abstract class AuthorRepository{

  Future<List<AuthorModel>> fetchAuthors();
}