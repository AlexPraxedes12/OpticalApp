import 'translations.dart';

/// Detailed information for each condition in multiple languages.
const Map<String, Map<String, dynamic>> conditionDetails = {
  'DR': {
    'name': {
      'en': 'Diabetic Retinopathy',
      'es': 'Retinopat\u00EDa diab\u00E9tica',
      'fr': 'R\u00E9tinopathie diab\u00E9tique'
    },
    'description': {
      'en': 'Diabetic retinopathy is a complication of diabetes that damages blood vessels in the retina.',
      'es': 'La retinopat\u00EDa diab\u00E9tica es una complicaci\u00F3n de la diabetes que da\u00F1a los vasos sangu\u00EDneos de la retina.',
      'fr': 'La r\u00E9tinopathie diab\u00E9tique est une complication du diab\u00E8te qui endommage les vaisseaux sanguins de la r\u00E9tine.'
    },
    'symptoms': [
      'blurred vision',
      'floaters',
      'difficulty seeing at night'
    ],
  },
  'ARMD': {
    'name': {
      'en': 'Age-related Macular Degeneration',
      'es': 'Degeneraci\u00F3n macular relacionada con la edad',
      'fr': 'D\u00E9g\u00E9n\u00E9rescence maculaire li\u00E9e \u00E0 l\u2019\u00E2ge'
    },
    'description': {
      'en': 'Age-related macular degeneration causes deterioration of the macula and affects central vision.',
      'es': 'La degeneraci\u00F3n macular relacionada con la edad causa el deterioro de la m\u00E1cula y afecta la visi\u00F3n central.',
      'fr': 'La d\u00E9g\u00E9n\u00E9rescence maculaire li\u00E9e \u00E0 l\u2019\u00E2ge provoque la d\u00E9t\u00E9rioration de la macula et affecte la vision centrale.'
    },
    'symptoms': [
      'distorted central vision',
      'trouble reading',
      'dark areas in the center of vision'
    ],
  },
  'MH': {
    'name': {
      'en': 'Macular Hole',
      'es': 'Agujero macular',
      'fr': 'Trou maculaire'
    },
    'description': {
      'en': 'Macular hole is a small break in the macula that can blur and distort central vision.',
      'es': 'Un agujero macular es una peque\u00F1a ruptura en la m\u00E1cula que puede nublar y distorsionar la visi\u00F3n central.',
      'fr': 'Un trou maculaire est une petite d\u00E9chirure de la macula pouvant brouiller et d\u00E9former la vision centrale.'
    },
    'symptoms': [
      'blurred central vision',
      'straight lines appearing wavy',
      'difficulty recognizing faces'
    ],
  },
  'DN': {
    'name': {
      'en': 'Drusen',
      'es': 'Drusas',
      'fr': 'Drusen'
    },
    'description': {
      'en': 'Drusen are yellow deposits under the retina often related to aging.',
      'es': 'Las drusas son dep\u00F3sitos amarillos debajo de la retina, a menudo relacionados con la edad.',
      'fr': 'Les drusen sont des d\u00E9p\u00F4ts jaunes sous la r\u00E9tine souvent li\u00E9s au vieillissement.'
    },
    'symptoms': [
      'usually none',
      'may contribute to vision distortion',
      'possible central vision loss over time'
    ],
  },
  'MYA': {
    'name': {
      'en': 'Myopia',
      'es': 'Miop\u00EDa',
      'fr': 'Myopie'
    },
    'description': {
      'en': 'Myopia, or nearsightedness, causes distant objects to appear blurry.',
      'es': 'La miop\u00EDa, o visi\u00F3n corta, hace que los objetos lejanos se vean borrosos.',
      'fr': 'La myopie, ou vision courte, fait appara\u00EEtre flous les objets \u00E9loign\u00E9s.'
    },
    'symptoms': [
      'blurry distance vision',
      'squinting',
      'eye strain'
    ],
  },
  'BRVO': {
    'name': {
      'en': 'Branch Retinal Vein Occlusion',
      'es': 'Oclusi\u00F3n de vena retiniana ramificada',
      'fr': 'Occlusion d\u2019une veine r\u00E9tinienne branch\u00E9e'
    },
    'description': {
      'en': 'Branch retinal vein occlusion occurs when one of the small veins in the retina becomes blocked.',
      'es': 'La oclusi\u00F3n de una vena retiniana ramificada ocurre cuando una de las peque\u00F1as venas de la retina se bloquea.',
      'fr': 'L\u2019occlusion d\u2019une veine r\u00E9tinienne branch\u00E9e survient lorsqu\u2019une petite veine de la r\u00E9tine se bouche.'
    },
    'symptoms': [
      'sudden blurry vision',
      'floaters',
      'loss of peripheral vision'
    ],
  },
  'TSLS': {
    'name': {
      'en': 'Tessellated Fundus',
      'es': 'Fondo de ojo teselado',
      'fr': 'Fond tessel\u00E9'
    },
    'description': {
      'en': 'Tessellated fundus refers to a mottled appearance of the retina.',
      'es': 'El fondo de ojo teselado se refiere a una apariencia moteada de la retina.',
      'fr': 'Le fond tessel\u00E9 fait r\u00E9f\u00E9rence \u00E0 une apparence marbr\u00E9e de la r\u00E9tine.'
    },
    'symptoms': [
      'usually none',
      'may be associated with high myopia'
    ],
  },
  'ERM': {
    'name': {
      'en': 'Epiretinal Membrane',
      'es': 'Membrana epirretiniana',
      'fr': 'Membrane \u00E9pir\u00E9tinienne'
    },
    'description': {
      'en': 'Epiretinal membrane is a thin layer of tissue that forms on the retina and can cause distortion.',
      'es': 'La membrana epirretiniana es una fina capa de tejido que se forma sobre la retina y puede causar distorsi\u00F3n.',
      'fr': 'La membrane \u00E9pir\u00E9tinienne est une fine couche de tissu qui se forme sur la r\u00E9tine et peut provoquer une distorsion.'
    },
    'symptoms': [
      'blurred vision',
      'distortion of straight lines',
      'double vision in one eye'
    ],
  },
  'LS': {
    'name': {
      'en': 'Laser Scars',
      'es': 'Cicatrices de l\u00E1ser',
      'fr': 'Cicatrices laser'
    },
    'description': {
      'en': 'Laser scars in the retina from previous treatments.',
      'es': 'Cicatrices en la retina de tratamientos l\u00E1ser previos.',
      'fr': 'Cicatrices dans la r\u00E9tine dues \u00E0 des traitements laser ant\u00E9rieurs.'
    },
    'symptoms': [
      'usually none',
      'possible peripheral vision loss'
    ],
  },
  'MS': {
    'name': {
      'en': 'Macular Scar',
      'es': 'Cicatriz macular',
      'fr': 'Cicatrice maculaire'
    },
    'description': {
      'en': 'Macular scar refers to scar tissue on the macula.',
      'es': 'La cicatriz macular se refiere al tejido cicatricial en la m\u00E1cula.',
      'fr': 'La cicatrice maculaire fait r\u00E9f\u00E9rence \u00E0 du tissu cicatriciel sur la macula.'
    },
    'symptoms': [
      'central vision loss',
      'distortion',
      'blurred vision'
    ],
  },
  'CSR': {
    'name': {
      'en': 'Central Serous Retinopathy',
      'es': 'Retinopat\u00EDa serosa central',
      'fr': 'R\u00E9tinopathie s\u00E9reuse centrale'
    },
    'description': {
      'en': 'Central serous retinopathy is the buildup of fluid under the retina that can blur vision.',
      'es': 'La retinopat\u00EDa serosa central es la acumulaci\u00F3n de l\u00EDquido bajo la retina que puede nublar la visi\u00F3n.',
      'fr': 'La r\u00E9tinopathie s\u00E9reuse centrale correspond \u00E0 une accumulation de liquide sous la r\u00E9tine pouvant brouiller la vision.'
    },
    'symptoms': [
      'sudden blurry vision',
      'dark spot in central vision',
      'colors appearing dull'
    ],
  },
  'OD': {
    'name': {
      'en': 'Optic Disc Abnormalities',
      'es': 'Anomal\u00EDas del disco \u00F3ptico',
      'fr': 'Anomalies de la papille optique'
    },
    'description': {
      'en': 'Optic disc abnormalities involving swelling or irregular shape.',
      'es': 'Anomal\u00EDas del disco \u00F3ptico que incluyen hinchaz\u00F3n o forma irregular.',
      'fr': 'Anomalies de la papille optique impliquant un gonflement ou une forme irr\u00E9guli\u00E8re.'
    },
    'symptoms': [
      'vision loss',
      'headache',
      'nausea'
    ],
  },
  'TV': {
    'name': {
      'en': 'Tortuous Vessels',
      'es': 'Vasos tortuosos',
      'fr': 'Vaisseaux tortueux'
    },
    'description': {
      'en': 'Tortuous vessels are abnormally twisted retinal blood vessels.',
      'es': 'Los vasos tortuosos son vasos sangu\u00EDneos retinianos anormalmente retorcidos.',
      'fr': 'Les vaisseaux tortueux sont des vaisseaux sanguins r\u00E9tiniens anormalement sinueux.'
    },
    'symptoms': [
      'usually none',
      'may accompany vascular disease'
    ],
  },
  'AH': {
    'name': {
      'en': 'Astrocytic Hamartoma',
      'es': 'Hamartoma astroc\u00EDtico',
      'fr': 'Hamartome astrocytaire'
    },
    'description': {
      'en': 'Astrocytic hamartoma is a benign tumor on the optic nerve or retina.',
      'es': 'El hamartoma astroc\u00EDtico es un tumor benigno en el nervio \u00F3ptico o la retina.',
      'fr': 'L\u2019hamartome astrocytaire est une tumeur bénigne sur le nerf optique ou la r\u00E9tine.'
    },
    'symptoms': [
      'often none',
      'possible vision obstruction if large'
    ],
  },
  'ODC': {
    'name': {
      'en': 'Optic Disc Cupping',
      'es': 'Excavaci\u00F3n del disco \u00F3ptico',
      'fr': 'Excavation de la papille optique'
    },
    'description': {
      'en': 'Optic disc cupping is an increased depression in the optic nerve head.',
      'es': 'La excavaci\u00F3n del disco \u00F3ptico es una depresi\u00F3n aumentada en la cabeza del nervio \u00F3ptico.',
      'fr': 'L\u2019excavation de la papille optique est un approfondissement accru de la t\u00EAte du nerf optique.'
    },
    'symptoms': [
      'loss of peripheral vision',
      'vision dimming'
    ],
  },
  'AION': {
    'name': {
      'en': 'Anterior Ischemic Optic Neuropathy',
      'es': 'Neuropat\u00EDa \u00F3ptica isqu\u00E9mica anterior',
      'fr': 'Neuropathie optique isch\u00E9mique ant\u00E9rieure'
    },
    'description': {
      'en': 'Anterior ischemic optic neuropathy involves reduced blood flow to the optic nerve.',
      'es': 'La neuropat\u00EDa \u00F3ptica isqu\u00E9mica anterior implica un flujo sangu\u00EDneo reducido al nervio \u00F3ptico.',
      'fr': 'La neuropathie optique isch\u00E9mique ant\u00E9rieure implique une r\u00E9duction du flux sanguin vers le nerf optique.'
    },
    'symptoms': [
      'sudden vision loss in one eye',
      'eye pain',
      'reduced color vision'
    ],
  },
  'PT': {
    'name': {
      'en': 'Peripapillary Atrophy',
      'es': 'Atrofia peripapilar',
      'fr': 'Atrophie p\u00E9ripapillaire'
    },
    'description': {
      'en': 'Peripapillary atrophy is thinning around the optic disc.',
      'es': 'La atrofia peripapilar es un adelgazamiento alrededor del disco \u00F3ptico.',
      'fr': 'L\u2019atrophie p\u00E9ripapillaire est un amincissement autour de la papille optique.'
    },
    'symptoms': [
      'usually none',
      'may be associated with glaucoma'
    ],
  },
  'RT': {
    'name': {
      'en': 'Retinal Tears',
      'es': 'Desgarros de retina',
      'fr': 'D\u00E9chirures r\u00E9tiniennes'
    },
    'description': {
      'en': 'Retinal tears are breaks in the retina that can lead to detachment.',
      'es': 'Los desgarros de retina son rupturas en la retina que pueden llevar al desprendimiento.',
      'fr': 'Les d\u00E9chirures r\u00E9tiniennes sont des ruptures de la r\u00E9tine pouvant conduire au d\u00E9collement.'
    },
    'symptoms': [
      'flashes of light',
      'floaters',
      'shadow in vision'
    ],
  },
  'RS': {
    'name': {
      'en': 'Retinal Surgery',
      'es': 'Cirug\u00EDa retiniana',
      'fr': 'Chirurgie r\u00E9tinienne'
    },
    'description': {
      'en': 'Retinal surgery changes such as scleral buckling or laser scars.',
      'es': 'Cambios por cirug\u00EDa retiniana como el cerclaje escleral o cicatrices l\u00E1ser.',
      'fr': 'Changements dus \u00E0 une chirurgie r\u00E9tinienne tels que la scl\u00E9rose ou des cicatrices laser.'
    },
    'symptoms': [
      'varies depending on procedure',
      'possible vision distortion'
    ],
  },
  'CRVO': {
    'name': {
      'en': 'Central Retinal Vein Occlusion',
      'es': 'Oclusi\u00F3n de la vena central de la retina',
      'fr': 'Occlusion de la veine centrale de la r\u00E9tine'
    },
    'description': {
      'en': 'Central retinal vein occlusion is blockage of the main vein of the retina.',
      'es': 'La oclusi\u00F3n de la vena central de la retina es el bloqueo de la vena principal de la retina.',
      'fr': 'L\u2019occlusion de la veine centrale de la r\u00E9tine est un blocage de la veine principale de la r\u00E9tine.'
    },
    'symptoms': [
      'sudden blurry vision',
      'pain in the eye',
      'dark spots or floaters'
    ],
  },
  'EDN': {
    'name': {
      'en': 'Exudative Changes',
      'es': 'Cambios exudativos',
      'fr': 'Changements exsudatifs'
    },
    'description': {
      'en': 'Exudative changes with deposits or swelling in the retina.',
      'es': 'Cambios exudativos con dep\u00F3sitos o hinchaz\u00F3n en la retina.',
      'fr': 'Changements exsudatifs avec d\u00E9p\u00F4ts ou gonflement dans la r\u00E9tine.'
    },
    'symptoms': [
      'vision distortion',
      'dark spots',
      'loss of central vision'
    ],
  },
  'RPEC': {
    'name': {
      'en': 'Retinal Pigment Epithelial Changes',
      'es': 'Cambios del epitelio pigmentario de la retina',
      'fr': 'Changements de l\u2019\u00E9pith\u00E9lium pigmentaire r\u00E9tinien'
    },
    'description': {
      'en': 'Retinal pigment epithelial changes affecting pigment cells.',
      'es': 'Cambios del epitelio pigmentario de la retina que afectan a las c\u00E9lulas pigmentarias.',
      'fr': 'Changements de l\u2019\u00E9pith\u00E9lium pigmentaire r\u00E9tinien affectant les cellules pigmentaires.'
    },
    'symptoms': [
      'blurry vision',
      'difficulty adapting to darkness'
    ],
  },
  'MHL': {
    'name': {
      'en': 'Macular Hemorrhage',
      'es': 'Hemorragia macular',
      'fr': 'H\u00E9morragie maculaire'
    },
    'description': {
      'en': 'Macular hemorrhage is bleeding in the macula.',
      'es': 'La hemorragia macular es un sangrado en la m\u00E1cula.',
      'fr': 'L\u2019h\u00E9morragie maculaire est un saignement au niveau de la macula.'
    },
    'symptoms': [
      'sudden vision loss',
      'dark spot in central vision'
    ],
  },
  'RP': {
    'name': {
      'en': 'Retinitis Pigmentosa',
      'es': 'Retinitis pigmentosa',
      'fr': 'R\u00E9tinite pigmentaire'
    },
    'description': {
      'en': 'Retinitis pigmentosa is a group of genetic disorders affecting the retina.',
      'es': 'La retinitis pigmentosa es un grupo de trastornos gen\u00E9ticos que afectan la retina.',
      'fr': 'La r\u00E9tinite pigmentaire est un groupe de troubles g\u00E9n\u00E9tiques affectant la r\u00E9tine.'
    },
    'symptoms': [
      'night blindness',
      'loss of peripheral vision',
      'tunnel vision'
    ],
  },
  'CWS': {
    'name': {
      'en': 'Cotton Wool Spots',
      'es': 'Manchas algodonosas',
      'fr': 'Taches cotonneuses'
    },
    'description': {
      'en': 'Cotton wool spots are fluffy white patches on the retina.',
      'es': 'Las manchas algodonosas son parches blancos algodonosos en la retina.',
      'fr': 'Les taches cotonneuses sont des plaques blanches duveteuses sur la r\u00E9tine.'
    },
    'symptoms': [
      'usually none',
      'may cause blurred spots in vision'
    ],
  },
  'CB': {
    'name': {
      'en': 'Choroidal Bleeding',
      'es': 'Sangrado coroideo',
      'fr': 'Saignement choro\u00EFdien'
    },
    'description': {
      'en': 'Choroidal neovascularization or bleeding under the retina.',
      'es': 'Neovascularizaci\u00F3n coroidea o sangrado bajo la retina.',
      'fr': 'N\u00E9ovascularisation choro\u00EFdienne ou saignement sous la r\u00E9tine.'
    },
    'symptoms': [
      'distorted vision',
      'dark spots',
      'vision loss'
    ],
  },
  'HPED': {
    'name': {
      'en': 'Hard Exudates',
      'es': 'Exudados duros',
      'fr': 'Exsudats durs'
    },
    'description': {
      'en': 'Hard exudates are lipid deposits on the retina.',
      'es': 'Los exudados duros son dep\u00F3sitos de l\u00EDpidos en la retina.',
      'fr': 'Les exsudats durs sont des d\u00E9p\u00F4ts lipidiques sur la r\u00E9tine.'
    },
    'symptoms': [
      'usually none',
      'may blur vision if near the macula'
    ],
  },
  'Other': {
    'name': {
      'en': 'Other',
      'es': 'Otro',
      'fr': 'Autre'
    },
    'description': {
      'en': 'Other retinal findings not categorized above.',
      'es': 'Otros hallazgos retinianos no categorizados anteriormente.',
      'fr': 'Autres observations r\u00E9tiniennes non class\u00E9es ci-dessus.'
    },
    'symptoms': [
      'varies'
    ],
  },
};

/// Returns translated details for a condition code.
Map<String, dynamic>? getConditionDetails(String code, String lang) {
  final data = conditionDetails[code];
  if (data == null) return null;
  final nameMap = data['name'] as Map<String, String>;
  final descMap = data['description'] as Map<String, String>;
  final symptoms = (data['symptoms'] as List<dynamic>? ?? []).cast<String>();
  return {
    'name': nameMap[lang] ?? nameMap['en'] ?? code,
    'description': descMap[lang] ?? descMap['en'] ?? '',
    'symptoms': symptoms,
  };
}
