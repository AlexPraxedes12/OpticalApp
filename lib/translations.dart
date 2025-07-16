import 'package:flutter/material.dart';

/// Supported languages for the app
const supportedLanguages = {
  'en': 'EN \uD83C\uDDFA\uD83C\uDDF8',
  'es': 'ES \uD83C\uDDF2\uD83C\uDDFD',
  'fr': 'FR \uD83C\uDDEB\uD83C\uDDF7',
};

/// Locale codes used for text to speech voices
const ttsLocales = {
  'en': 'en-US',
  'es': 'es-MX',
  'fr': 'fr-FR',
};

/// Global language notifier
final ValueNotifier<String> currentLanguage = ValueNotifier('en');

/// UI text translations
const _uiTexts = {
  'topPredictions': {
    'en': 'Top Predictions',
    'es': 'Principales predicciones',
    'fr': 'Principales pr\u00E9dictions',
  },
  'explanation': {
    'en': 'Explanation',
    'es': 'Explicaci\u00F3n',
    'fr': 'Explication',
  },
  'scanAgain': {
    'en': 'Scan Again',
    'es': 'Escanear de nuevo',
    'fr': 'Scanner \u00E0 nouveau',
  },
  'readAloud': {
    'en': 'Read Aloud',
    'es': 'Leer en voz alta',
    'fr': 'Lire \u00E0 haute voix',
  },
  'ttsError': {
    'en': 'Unable to read text',
    'es': 'No se puede leer el texto',
    'fr': 'Impossible de lire le texte',
  },
  'noDescription': {
    'en': 'No description available',
    'es': 'No hay descripci\u00F3n disponible',
    'fr': 'Aucune description disponible',
  },
  'takePhoto': {
    'en': 'Take Photo',
    'es': 'Tomar foto',
    'fr': 'Prendre une photo',
  },
  'chooseGallery': {
    'en': 'Choose from Gallery',
    'es': 'Elegir de la galer\u00EDa',
    'fr': 'Choisir depuis la galerie',
  },
  'keepPhoto': {
    'en': 'Keep Photo',
    'es': 'Conservar foto',
    'fr': 'Garder la photo',
  },
  'retakePhoto': {
    'en': 'Retake Photo',
    'es': 'Repetir foto',
    'fr': 'Reprendre la photo',
  },
  'keep': {
    'en': 'Keep',
    'es': 'Conservar',
    'fr': 'Garder',
  },
  'retake': {
    'en': 'Retake',
    'es': 'Repetir',
    'fr': 'Reprendre',
  },
  'scan': {
    'en': 'Scan',
    'es': 'Escanear',
    'fr': 'Scanner',
  },
  'flashOn': {
    'en': 'Flash On',
    'es': 'Flash encendido',
    'fr': 'Flash activ\u00E9',
  },
  'flashOff': {
    'en': 'Flash Off',
    'es': 'Flash apagado',
    'fr': 'Flash d\u00E9sactiv\u00E9',
  },
  'cameraPreview': {
    'en': 'Camera Preview',
    'es': 'Vista previa de la c\u00E1mara',
    'fr': 'Aper\u00E7u de la cam\u00E9ra',
  },
  'alignText': {
    'en': 'Align your eye within the circle and remain still',
    'es': 'Alinea tu ojo dentro del círculo y mantente quieto',
    'fr': 'Alignez votre œil dans le cercle et restez immobile',
  },
  'lightingTip': {
    'en': 'Good lighting helps accuracy.',
    'es': 'Una buena iluminaci\u00F3n mejora la precisi\u00F3n.',
    'fr': 'Un bon \u00E9clairage am\u00E9liore la pr\u00E9cision.',
  },
  'permissionDenied': {
    'en': 'Permission denied',
    'es': 'Permiso denegado',
    'fr': 'Permission refus\u00E9e',
  },
  'noImage': {
      'en': 'No image selected',
    'es': 'Ninguna imagen seleccionada',
    'fr': 'Aucune image s\u00E9lectionn\u00E9e',
  },
  'noPredictions': {
    'en': 'No predictions found',
    'es': 'No se encontraron predicciones',
    'fr': 'Aucune pr\u00E9diction trouv\u00E9e',
  },
  'noDetails': {
    'en': 'No details available',
    'es': 'No hay detalles disponibles',
    'fr': 'Aucun d\u00E9tail disponible',
  },
  'noInfo': {
    'en': 'No information available',
    'es': 'No hay informaci\u00F3n disponible',
    'fr': 'Aucune information disponible',
  },
  'symptoms': {
    'en': 'Symptoms:',
    'es': 'S\u00EDntomas:',
    'fr': 'Sympt\u00F4mes :',
  },
  'and': {
    'en': 'and',
    'es': 'y',
    'fr': 'et',
  },
  'otherMessage': {
    'en':
        'Result falls outside known categories. Please consult a specialist for an accurate diagnosis.',
    'es':
        'El resultado est\u00E1 fuera de las categor\u00EDas conocidas. Consulta a un especialista para un diagn\u00F3stico preciso.',
    'fr':
        'Le r\u00E9sultat ne correspond \u00E0 aucune cat\u00E9gorie connue. Veuillez consulter un sp\u00E9cialiste pour un diagnostic pr\u00E9cis.',
  },
};

/// Translate a UI key using the provided language code
String tr(String key, String lang) {
  return _uiTexts[key]?[lang] ?? _uiTexts[key]?['en'] ?? key;
}

/// Symptom text translations
const symptomTexts = {
  'blurred central vision': {
    'en': 'blurred central vision',
    'es': 'vision central borrosa',
    'fr': 'vision centrale floue',
  },
  'blurred vision': {
    'en': 'blurred vision',
    'es': 'vision borrosa',
    'fr': 'vision floue',
  },
  'blurry distance vision': {
    'en': 'blurry distance vision',
    'es': 'vision lejana borrosa',
    'fr': 'vision lointaine floue',
  },
  'blurry vision': {
    'en': 'blurry vision',
    'es': 'vision borrosa',
    'fr': 'vision floue',
  },
  'central vision loss': {
    'en': 'central vision loss',
    'es': 'perdida de la vision central',
    'fr': 'perte de la vision centrale',
  },
  'colors appearing dull': {
    'en': 'colors appearing dull',
    'es': 'colores apagados',
    'fr': 'couleurs ternes',
  },
  'dark areas in the center of vision': {
    'en': 'dark areas in the center of vision',
    'es': 'areas oscuras en el centro de la vision',
    'fr': 'zones sombres au centre de la vision',
  },
  'dark spot in central vision': {
    'en': 'dark spot in central vision',
    'es': 'mancha oscura en la vision central',
    'fr': 'tache sombre dans la vision centrale',
  },
  'dark spots': {
    'en': 'dark spots',
    'es': 'manchas oscuras',
    'fr': 'taches sombres',
  },
  'dark spots or floaters': {
    'en': 'dark spots or floaters',
    'es': 'manchas oscuras o flotadores',
    'fr': 'taches sombres ou corps flottants',
  },
  'difficulty adapting to darkness': {
    'en': 'difficulty adapting to darkness',
    'es': 'dificultad para adaptarse a la oscuridad',
    'fr': "difficulte a s'adapter a l'obscurite",
  },
  'difficulty recognizing faces': {
    'en': 'difficulty recognizing faces',
    'es': 'dificultad para reconocer rostros',
    'fr': 'difficulte a reconnaitre les visages',
  },
  'difficulty seeing at night': {
    'en': 'difficulty seeing at night',
    'es': 'dificultad para ver de noche',
    'fr': 'difficulte a voir la nuit',
  },
  'distorted central vision': {
    'en': 'distorted central vision',
    'es': 'vision central distorsionada',
    'fr': 'vision centrale deformee',
  },
  'distorted vision': {
    'en': 'distorted vision',
    'es': 'vision distorsionada',
    'fr': 'vision deformee',
  },
  'distortion': {
    'en': 'distortion',
    'es': 'distorsion',
    'fr': 'distorsion',
  },
  'distortion of straight lines': {
    'en': 'distortion of straight lines',
    'es': 'distorsion de las lineas rectas',
    'fr': 'distorsion des lignes droites',
  },
  'double vision in one eye': {
    'en': 'double vision in one eye',
    'es': 'vision doble en un ojo',
    'fr': 'vision double dans un oeil',
  },
  'eye pain': {
    'en': 'eye pain',
    'es': 'dolor ocular',
    'fr': 'douleur oculaire',
  },
  'eye strain': {
    'en': 'eye strain',
    'es': 'fatiga ocular',
    'fr': 'fatigue oculaire',
  },
  'flashes of light': {
    'en': 'flashes of light',
    'es': 'destellos de luz',
    'fr': 'eclairs de lumiere',
  },
  'floaters': {
    'en': 'floaters',
    'es': 'flotadores',
    'fr': 'corps flottants',
  },
  'headache': {
    'en': 'headache',
    'es': 'dolor de cabeza',
    'fr': 'maux de tete',
  },
  'loss of central vision': {
    'en': 'loss of central vision',
    'es': 'perdida de la vision central',
    'fr': 'perte de la vision centrale',
  },
  'loss of peripheral vision': {
    'en': 'loss of peripheral vision',
    'es': 'perdida de la vision periferica',
    'fr': 'perte de la vision peripherique',
  },
  'may accompany vascular disease': {
    'en': 'may accompany vascular disease',
    'es': 'puede acompanar enfermedad vascular',
    'fr': 'peut accompagner une maladie vasculaire',
  },
  'may be associated with glaucoma': {
    'en': 'may be associated with glaucoma',
    'es': 'puede asociarse con glaucoma',
    'fr': 'peut etre associe au glaucome',
  },
  'may be associated with high myopia': {
    'en': 'may be associated with high myopia',
    'es': 'puede asociarse con miopia alta',
    'fr': 'peut etre associe a une forte myopie',
  },
  'may blur vision if near the macula': {
    'en': 'may blur vision if near the macula',
    'es': 'puede nublar la vision si esta cerca de la macula',
    'fr': 'peut brouiller la vision si proche de la macula',
  },
  'may cause blurred spots in vision': {
    'en': 'may cause blurred spots in vision',
    'es': 'puede causar zonas borrosas en la vision',
    'fr': 'peut provoquer des zones floues dans la vision',
  },
  'may contribute to vision distortion': {
    'en': 'may contribute to vision distortion',
    'es': 'puede contribuir a la distorsion de la vision',
    'fr': 'peut contribuer a la distorsion de la vision',
  },
  'nausea': {
    'en': 'nausea',
    'es': 'nauseas',
    'fr': 'nausees',
  },
  'night blindness': {
    'en': 'night blindness',
    'es': 'ceguera nocturna',
    'fr': 'cecite nocturne',
  },
  'often none': {
    'en': 'often none',
    'es': 'a menudo ninguno',
    'fr': 'souvent aucun',
  },
  'pain in the eye': {
    'en': 'pain in the eye',
    'es': 'dolor en el ojo',
    'fr': "douleur a l'oeil",
  },
  'possible central vision loss over time': {
    'en': 'possible central vision loss over time',
    'es': 'posible perdida de vision central con el tiempo',
    'fr': 'perte possible de la vision centrale avec le temps',
  },
  'possible peripheral vision loss': {
    'en': 'possible peripheral vision loss',
    'es': 'posible perdida de vision periferica',
    'fr': 'perte possible de la vision peripherique',
  },
  'possible vision distortion': {
    'en': 'possible vision distortion',
    'es': 'posible distorsion de la vision',
    'fr': 'distorsion possible de la vision',
  },
  'possible vision obstruction if large': {
    'en': 'possible vision obstruction if large',
    'es': 'posible obstruccion visual si es grande',
    'fr': 'obstruction visuelle possible si grande',
  },
  'reduced color vision': {
    'en': 'reduced color vision',
    'es': 'vision de colores reducida',
    'fr': 'perception des couleurs reduite',
  },
  'shadow in vision': {
    'en': 'shadow in vision',
    'es': 'sombra en la vision',
    'fr': 'ombre dans la vision',
  },
  'squinting': {
    'en': 'squinting',
    'es': 'entrecerrar los ojos',
    'fr': 'plissement des yeux',
  },
  'straight lines appearing wavy': {
    'en': 'straight lines appearing wavy',
    'es': 'las lineas rectas parecen onduladas',
    'fr': 'les lignes droites paraissent ondulees',
  },
  'sudden blurry vision': {
    'en': 'sudden blurry vision',
    'es': 'vision borrosa repentina',
    'fr': 'vision floue soudaine',
  },
  'sudden vision loss': {
    'en': 'sudden vision loss',
    'es': 'perdida subita de la vision',
    'fr': 'perte soudaine de la vision',
  },
  'sudden vision loss in one eye': {
    'en': 'sudden vision loss in one eye',
    'es': 'perdida subita de la vision en un ojo',
    'fr': "perte soudaine de la vision d'un oeil",
  },
  'trouble reading': {
    'en': 'trouble reading',
    'es': 'dificultad para leer',
    'fr': 'difficulte a lire',
  },
  'tunnel vision': {
    'en': 'tunnel vision',
    'es': 'vision en tunel',
    'fr': 'vision en tunnel',
  },
  'usually none': {
    'en': 'usually none',
    'es': 'generalmente ninguno',
    'fr': 'generalement aucun',
  },
  'varies': {
    'en': 'varies',
    'es': 'varia',
    'fr': 'varie',
  },
  'varies depending on procedure': {
    'en': 'varies depending on procedure',
    'es': 'varia segun el procedimiento',
    'fr': 'varie selon la procedure',
  },
  'vision dimming': {
    'en': 'vision dimming',
    'es': 'atenuacion de la vision',
    'fr': 'affaiblissement de la vision',
  },
  'vision distortion': {
    'en': 'vision distortion',
    'es': 'distorsion de la vision',
    'fr': 'distorsion de la vision',
  },
  'vision loss': {
    'en': 'vision loss',
    'es': 'perdida de la vision',
    'fr': 'perte de la vision',
  },
};

/// Translate a symptom using the provided language code
String trSymptom(String text, String lang) {
  return symptomTexts[text]?[lang] ?? symptomTexts[text]?['en'] ?? text;
}
