import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

Color getBackgroundColor(String testName, int score) {
    switch (testName) {
      case 'GAD-7':
        return _getGAD7BackgroundColor(score);
      case 'PHQ-9':
        return _getPHQ9BackgroundColor(score);
      case 'PSS':
        return _getPSSBackgroundColor(score);
      default:
        return Colors.grey; // Default color
    }
  }

  String getTextResult(String testName, int score) {
    switch (testName) {
      case 'GAD-7':
        return _getGAD7TextResult(score);
      case 'PHQ-9':
        return _getPHQ9TextResult(score);
      case 'PSS':
        return _getPSSTextResult(score);
      default:
        return "Unknown test"; // Default text
    }
  }

  int getNbrSugg(String testName, int score) {
    switch (testName) {
      case '  GAD-7':
        return _getGAD7SuggestedNumber(score);
      case '  PHQ-9':
        return _getPHQ9SuggestedNumber(score);
      case 'PSS':
        return _getPSSSuggestedNumber(score);
      default:
        return 0; // Default suggested number
    }
  }

// GAD-7 Functions
Color _getGAD7BackgroundColor(int score) {
  if (score >= 0 && score <= 4) {
    return MhColors.green;
  } else if (score >= 5 && score <= 9) {
    return MhColors.purple;
  } else if (score >= 10 && score <= 14) {
    return MhColors.orange;
  } else {
    return MhColors.lightBlue;
  }
}

String _getGAD7TextResult(int score) {
  if (score >= 0 && score <= 4) {
    return "Minimal Anxiety";
  } else if (score >= 5 && score <= 9) {
    return "Mild Anxiety";
  } else if (score >= 10 && score <= 14) {
    return "Moderate Anxiety";
  } else {
    return "Severe Anxiety";
  }
}

int _getGAD7SuggestedNumber(int score) {
  if (score >= 0 && score <= 4) {
    return 20;
  } else if (score >= 5 && score <= 9) {
    return 23;
  } else if (score >= 10 && score <= 14) {
    return 30;
  } else {
    return 35;
  }
}

// PHQ-9 Functions
Color _getPHQ9BackgroundColor(int score) {
  if (score >= 0 && score <= 4) {
    return MhColors.green;
  } else if (score >= 5 && score <= 9) {
    return MhColors.purple;
  } else if (score >= 10 && score <= 14) {
    return MhColors.pink;
  }else if (score >= 15 && score <= 19) {
    return MhColors.orange;
  } else {
    return MhColors.lightBlue;
  }
}

String _getPHQ9TextResult(int score) {
  if (score >= 0 && score <= 4) {
    return "None-Minimal";
  } else if (score >= 5 && score <= 9) {
    return "Mild";
  } else if (score >= 10 && score <= 14) {
    return "Moderate";
  } else if (score >= 15 && score <= 19) {
    return "Moderately Severe";
  } else {
    return "Severe";
  }
}

int _getPHQ9SuggestedNumber(int score) {
  if (score >= 0 && score <= 4) {
    return 20;
  } else if (score >= 5 && score <= 9) {
    return 23;
  } else if (score >= 10 && score <= 14) {
    return 30;
  } else {
    return 35;
  }
}

// PSS Functions
Color _getPSSBackgroundColor(int score) {
  if (score >= 0 && score <= 13) {
    return MhColors.green;
  } else if (score >= 14 && score <= 26) {
    return MhColors.purple;
  } else {
    return MhColors.orange;
  }
}

String _getPSSTextResult(int score) {
  if (score >= 0 && score <= 13) {
    return "low stress";
  } else if (score >= 14 && score <= 26) {
    return "moderate stress";
  } else {
    return "high perceived stress";
  }
}

int _getPSSSuggestedNumber(int score) {
  if (score >= 0 && score <= 13) {
    return 20;
  } else if (score >= 14 && score <= 26) {
    return 23;
  } else {
    return 35;
  }
}