// 1
import 'package:chopper/chopper.dart';
import 'recipe_model.dart';
import 'model_response.dart';
import 'model_converter.dart';
// 2
const String apiKey = '18dc58eef9c4ddecafcf09e0b701898a';
const String apiId = 'e6b2fbe2';
// 3
const String apiUrl = 'https://api.edamam.com';

// 1
@ChopperApi()
// 2
abstract class RecipeService extends ChopperService {
// 3
  @Get(path: 'search')
  // 4
  Future<Response<Result<APIRecipeQuery>>> queryRecipes(
// 5
      @Query('q') String query, @Query('from') int from,
      @Query('to') int to);
// TODO: Add create()
}

Request _addQuery(Request req) {
// 1
  final params = Map<String, dynamic>.from(req.parameters);
  // 2
  params['app_id'] = apiId;
  params['app_key'] = apiKey;
// 3
  return req.copyWith(parameters: params);
}