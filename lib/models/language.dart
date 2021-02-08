const SYSTEM_LANGUAGE_PREFERENCE = -1;

class Language {
  final String languageCode;
  final String countryCode;
  final String englishName;
  final String localName;
  final String flag;

  const Language({
    this.languageCode,
    this.countryCode,
    this.englishName,
    this.localName,
    this.flag,
  });
}

const LANGUAGES = [
  Language(
    languageCode: "hr",
    countryCode: "HR",
    englishName: "Croatian",
    localName: "Hrvatski",
    flag: "assets/images/croatia.png",
  ),
  Language(
    languageCode: "en",
    countryCode: "GB",
    englishName: "English (UK)",
    localName: "English (UK)",
    flag: "assets/images/english.png",
  ),
  Language(
    languageCode: "en",
    countryCode: "US",
    englishName: "English (US)",
    localName: "English (US)",
    flag: "assets/images/usa.png",
  ),
  Language(
    languageCode: "fr",
    countryCode: "FR",
    englishName: "French (France)",
    localName: "Français (France)",
    flag: "assets/images/france.png",
  ),
  Language(
    languageCode: "it",
    countryCode: "IT",
    englishName: "Italian",
    localName: "Italiano",
    flag: "assets/images/italy.png",
  ),
  Language(
    languageCode: "ms",
    countryCode: "MS",
    englishName: "Malaysian",
    localName: "Melayu",
    flag: "assets/images/malaysia.png",
  ),
  Language(
    languageCode: "ru",
    countryCode: "RU",
    englishName: "Russian",
    localName: "Русский",
    flag: "assets/images/russia.png",
  ),
  Language(
    languageCode: "sr",
    countryCode: "RS",
    englishName: "Serbian",
    localName: "Srbski",
    flag: "assets/images/serbia.png",
  ),
  Language(
    languageCode: "vi",
    countryCode: "VI",
    englishName: "Vietnamese",
    localName: "Tiếng Việt",
    flag: "assets/images/vietnam.png",
  ),
];
