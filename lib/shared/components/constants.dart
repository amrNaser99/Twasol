void printFullText(String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? uId ='';
int? token ;
class Paths {
  static String recording = '/storage/emulated/0/Twasol/recordings';
}




