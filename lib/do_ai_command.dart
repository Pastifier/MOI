import 'package:string_similarity/string_similarity.dart';

String do_a_command(
    String recognizedText, Function(String) speakText, String _response) {
  var bestMatch = StringSimilarity.findBestMatch(recognizedText, [
    'How many points do I have',
    'Do I have a traffic fine',
    'I want to pay the traffic fine',
    'start',
    'close',
    'Can you give me the details of the Traffic fines',
    null
  ]);

  var command = bestMatch.bestMatch.target;

  double threshold = recognizedText.similarityTo(command);
  // print(threshold);

  if (command == 'start') {
    _response = 'MOI started';
    speakText('MOI started');
  } else if (threshold < 0.3) {
    _response = 'Command not recognized';
    speakText('Command not recognized');
  } else if (command == 'How many points do I have') {
    _response = 'You have 15 points';
    speakText('You have 15 points');
  } else if (command == 'Do I have a traffic fine') {
    _response = 'You do not have any traffic fines';
    speakText('You do not have any traffic fines');
  } else if (command == 'I want to pay the traffic fine') {
    _response =
        'Please provide the traffic fine number to proceed with the payment';
    speakText(
        'Please provide the traffic fine number to proceed with the payment');
  } else if (command == 'Can you give me the details of the Traffic fines') {
    _response = 'You have no traffic fines';
    speakText('You have no traffic fines');
  } else if (command == 'close') {
    _response = 'AI Assitance is closed';
    speakText('AI Assitance is closed');
  } else {
    _response = 'Command not recognized';
    speakText('Command not recognized');
  }

  return (_response);
}
