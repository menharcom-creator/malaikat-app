import 'package:flutter/material.dart';

class Section {
  final String title;
  final IconData icon;
  final List<Color> colors;
  final List<String> paras;
  const Section(this.title, this.icon, this.colors, this.paras);
}

const _teal = [Color(0xFF0F766E), Color(0xFF134E4A)];
const _gold = [Color(0xFFB7791F), Color(0xFF7C4A03)];
const _blue = [Color(0xFF2563EB), Color(0xFF1E3A8A)];
const _violet = [Color(0xFF7C3AED), Color(0xFF4C1D95)];
const _red = [Color(0xFFB91C1C), Color(0xFF7F1D1D)];
const _green = [Color(0xFF15803D), Color(0xFF14532D)];
const _slate = [Color(0xFF475569), Color(0xFF1E293B)];
const _rose = [Color(0xFFBE185D), Color(0xFF831843)];
const _sky = [Color(0xFF0284C7), Color(0xFF0C4A6E)];
const _indigo = [Color(0xFF4338CA), Color(0xFF1E1B4B)];

const List<Section> sections = [
  Section('Sino ang mga Malaikat?', Icons.auto_awesome, _gold, [
    'Bago pa nilikha ang tao, nilikha na ni Allah ang mga malaikat mula sa liwanag (Sahih Muslim 2996). Hindi sila sumusuway kay Allah. Ginagawa nila ang iniuutos sa kanila (Qur\'an 66:6). Hindi sila napapagod sa pagsamba (21:19–20). May pakpak sila, dalawa, tatlo, o apat (35:1). Hindi sila lalaki at hindi babae (43:19).',
    'Napakarami nila. Si Allah lang ang may alam ng bilang nila (74:31).',
  ]),
  Section('Si Jibril, ang Tagapagdala ng Mensahe', Icons.menu_book, _teal, [
    'Isang gabi sa Cave Hira, may dumating kay Propeta Muhammad ﷺ. Si Jibril iyon. Siya ang naghatid ng Qur\'an sa puso ng Propeta ﷺ, sa utos ni Allah (2:97). Tinatawag siyang “mapagkakatiwalaang Espiritu” (26:193).',
    'Nakita ng Propeta ﷺ si Jibril sa tunay niyang anyo. Napakalaki niya, may 600 pakpak (Bukhari 4856, Muslim 174).',
  ]),
  Section('Si Mikail', Icons.water_drop, _sky, [
    'Binanggit si Mikail sa Qur\'an kasama ni Jibril (2:98). Ayon sa mga iskolar, may tungkulin siya sa ulan at panustos.',
  ]),
  Section('Si Israfil at ang Trumpeta', Icons.campaign, _violet, [
    'May darating na araw na iihip ang Trumpeta. Mamamatay ang lahat ng nasa langit at lupa. Iihip ulit, at titindig silang lahat para hatulan (39:68).',
    'Ayon sa mga iskolar, si Israfil ang hihihip nito. Nasa Hadith ang pangalan niya, sa du\'a ng Propeta ﷺ: “O Allah, Panginoon nina Jibril, Mikail, at Israfil” (Muslim 770).',
  ]),
  Section('Si Malik, ang Tagabantay ng Impiyerno', Icons.local_fire_department, _red, [
    'Sa Impiyerno, tatawag ang mga tao kay Malik: “O Malik, tapusin na tayo ng Panginoon mo!” Sasagot siya: “Mananatili kayo riyan” (43:77).',
    'Seryoso at mahigpit si Malik sa tungkulin niya. Nakita siya ng Propeta ﷺ sa isang panaginip bilang tagabantay ng Impiyerno (Bukhari 3236).',
    'Hindi lang siya ang malaikat doon. May 19 na tagabantay (74:30), at tinatawag silang Az-Zabaniyah (96:18). Malalakas sila at hindi sumusuway kay Allah (66:6).',
  ]),
  Section('Harut at Marut', Icons.location_city, _slate, [
    'Sa Babilonya, ipinadala ang dalawang ito bilang pagsubok sa mga tao tungkol sa mahika. Sinasabi nila sa lahat: “Pagsubok lang kami, huwag kayong magtakwil ng pananampalataya” (2:102).',
  ]),
  Section('Ang Anghel ng Kamatayan', Icons.hourglass_bottom, _indigo, [
    'Kapag dumating ang oras ng isang tao, may darating na anghel. Siya si Malak al-Mawt (32:11). Ito ay titulo, hindi pangalan. Sikat ang “Azra\'il,” pero walang matibay na batayan para dito.',
    'May mga katulong din siya na kumukuha ng kaluluwa (6:61, 16:28).',
  ]),
  Section('Ang Dalawang Tagasulat', Icons.edit_note, _green, [
    'Sa kanan at kaliwa ng bawat tao, may mga malaikat na nagsusulat. Mararangal sila (Kiraman Katibin). Walang salita o gawa na hindi nila naitala (82:10–12, 50:17–18).',
  ]),
  Section('Munkar at Nakir', Icons.help_outline, _slate, [
    'Kapag inilibing na ang tao, darating ang dalawang malaikat, sina Munkar at Nakir (Tirmidhi 1071). Tatanungin nila: Sino ang Panginoon mo? Ano ang relihiyon mo? Sino ang propeta mo? (Bukhari 1374, Muslim 2870; tingnan din ang 14:27)',
  ]),
  Section('Mga Bantay ng Tao', Icons.shield, _blue, [
    'May mga malaikat na sumusunod sa tao, sa harap at likod, para bantayan siya sa utos ni Allah (13:10–11). Hindi ito ibig sabihing hindi na siya masasaktan. Ang lahat ay ayon sa kalooban ni Allah.',
  ]),
  Section('Ang Walong Magdadala ng Trono', Icons.diamond, _gold, [
    'Sa Araw ng Paghuhukom, walong malaikat ang magdadala ng Trono ni Allah (69:17). Pinupuri nila si Allah at humihingi ng tawad para sa mga mananampalataya (40:7).',
  ]),
  Section('Ang mga Pintuan ng Paraiso', Icons.park, _green, [
    'Kapag dumating ang mga mananampalataya sa Paraiso, bukas na ang mga pintuan. Sasalubungin sila ng mga tagabantay: “Kapayapaan sa inyo! Pumasok kayo nang walang hanggan” (39:73, 13:23–24).',
    'Sikat ang pangalang “Ridwan,” pero hindi ito binabanggit sa Qur\'an.',
  ]),
  Section('Ang Gabi ng Laylat al-Qadr', Icons.nights_stay, _indigo, [
    'Isang gabi sa isang taon, bumababa ang mga malaikat at ang Ruh sa lupa, sa pahintulot ng Panginoon nila (97:4).',
  ]),
  Section('Tumulong sa Badr', Icons.flag, _teal, [
    'Nang mahina ang mga Muslim sa Labanan ng Badr, nagpadala si Allah ng mga malaikat bilang tulong at pampalakas ng loob (8:9, 3:124–125). Si Allah ang nagbigay ng tagumpay.',
  ]),
  Section('Mga Bisita ng mga Propeta', Icons.groups, _rose, [
    '• Dumating kay Ibrahim ang mga bisitang malaikat na may dalang balita ng anak (11:69–70).',
    '• Dumating ang mga malaikat kay Lut para sa bayang pinarusahan (11:77–81).',
    '• Binalitaan si Zakariya tungkol kay Yahya (3:39).',
    '• Kinausap ng mga malaikat si Maryam (3:42), at nagpakita si Jibril sa anyong tao (19:17).',
  ]),
  Section('Ang Anghel sa Sinapupunan', Icons.child_care, _rose, [
    'Bago isilang ang sanggol, may malaikat na pinadadala. Isinusulat niya ang apat na bagay: ang rizq, ang taning ng buhay, ang gawa, at kung mapalad o hindi (Bukhari 3208, Muslim 2643).',
  ]),
  Section('Ang Anghel ng mga Bundok', Icons.landscape, _slate, [
    'Nang saktan ang Propeta ﷺ sa Ta\'if, dumating ang anghel ng mga bundok. Nag-alok siya na pagdikitin ang dalawang bundok sa ibabaw ng mga tao roon. Tumanggi ang Propeta ﷺ. Umasa siyang may lalabas sa lahi nila na sasamba kay Allah lamang (Bukhari 3231, Muslim 1795).',
  ]),
  Section('Si Iblis ay Hindi Malaikat', Icons.not_interested, _red, [
    'Si Iblis ay jinn, hindi anghel (18:50). Hindi sumusuway ang mga malaikat kay Allah.',
  ]),
  Section('Ang Bayt al-Ma\'mur', Icons.home, _sky, [
    'Sa langit, may bahay na dinadalaw ng mga malaikat. Araw-araw, 70,000 ang pumapasok, at hindi na sila babalik ulit (Bukhari 3207). Halimbawa lang ito kung gaano sila karami.',
  ]),
  Section('Paniniwala sa mga Malaikat', Icons.favorite, _teal, [
    'Bahagi ng Iman ang maniwala sa mga malaikat (2:285, 2:177, 4:136; Muslim 8a).',
  ]),
];
