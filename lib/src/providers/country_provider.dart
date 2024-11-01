import 'package:intl_phone_number_input/src/models/country_list.dart';
import 'package:intl_phone_number_input/src/models/country_model.dart';

const String PropertyName = 'alpha_2_code';

/// [CountryProvider] provides helper classes that involves manipulations.
/// of Countries from [Countries.countryList]
class CountryProvider {
  /// Get data of Countries.
  ///
  /// Returns List of [Country].
  ///
  ///  * If [countries] is `null` or empty it returns a list of all [Countries.countryList].
  ///  * If [countries] is not empty it returns a list containing
  ///    counties as specified in passed order.
  static List<Country> getCountriesData({required List<String>? countries}) {
    final countryMap = Countries.countryMap;

    if (countries == null || countries.isEmpty) {
      return Countries.countryList
          .map((country) => Country.fromJson(country))
          .toList();
    }

    return countries
        .map((value) => countryMap[value])
        .where((value) => value != null)
        .map((country) => Country.fromJson(country))
        .toList();
  }
}
