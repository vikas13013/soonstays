import '../../app/data/model/property_list/property_list_model.dart';
import '../../app/data/model/search_criteria/search_criteria_model.dart';

class PropertyDetailsArgument {

  String?cityName;

  String?slug;

  PropertiesList?propertiesData;

  SearchCriteriaModel?searchCriteria;

  PropertyDetailsArgument({
    this.cityName,
    this.slug,
    this.propertiesData,
    this.searchCriteria,
  });
}